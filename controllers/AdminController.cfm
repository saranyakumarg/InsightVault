<cfif structKeyExists(url, "method")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>

    // Get the roles from the RolesModel
    variables.rolesModel = createObject("component", application.baseURL & "models.RolesModel");
    variables.roles = variables.rolesModel.getRoles();
    // Get the access levels from the AccessLevelModel
    variables.accessLevelModel = createObject("component", application.baseURL & "models.AccessLevelModel");
    variables.accessLevels = variables.accessLevelModel.getAccessLevels();
    // Get the user model
    variables.userModel = createObject("component", application.baseURL & "models.UserModel");
    // Get the audit log model
    variables.auditLogModel = createObject("component", application.baseURL & "models.AuditLogModel");

    if (structKeyExists(url, "method")) {
        switch (url.method) {
            case "save-user":
                saveUser();
                break;
            case "complete-registration":
                completeRegistration();
                break;
            case "set-password":
                setPassword();
                break;
            case "get-users":
                getUsers();
                break;
            case "user-update":
                updateUser();
                break;
            default:
                writeOutput(serializeJSON({ "success": false, "message": "Unknown method: " & url.method }));
                break;
        }
    }

    function saveUser() {
        registration_token = createUUID();
        token_expiry = dateAdd("h", 24, now());
        var userData = {
            firstName: form.firstName,
            lastName: form.lastName,
            email: form.email,
            role: form.role,
            accessLevel: form.accessLevel,
            registration_token: registration_token,
            token_expiry: token_expiry,
            is_registered: false
        };
        // Check if email already exists
        var emailExists = variables.userModel.emailExists(userData.email);
        if (emailExists) {
            writeOutput(serializeJSON({ "success": false, "message": "Email already exists." }));
            return;
        }
        var userResponse = variables.userModel.saveUser(userData);
        // sendRegistrationEmail(userData, registration_token); // uncomment for sending email to user
        var auditAction = "User Created By Admin";
        var auditDetails = "User " & userData.firstName & " " & userData.lastName & " (" & userData.email & ") created with role ID " & userData.role & " and access level ID " & userData.accessLevel;
        var auditData = {
            user_id: session.user.user_id,
            role_id: session.user.role_id,
            action: auditAction,
            entity_type: "Users",
            access_level_id: session.user.access_level_id,
            details: auditDetails
        };
        variables.auditLogModel.saveAuditLog(auditData);
        writeOutput(serializeJSON(userResponse));
    }

    function sendRegistrationEmail(userData, registration_token) {
        var mailSubject = "Your Account Has Been Created";
        var mailBody = "
            Hello #userData.firstName# #userData.lastName#,<br><br>
            Your account has been created by the admin.<br>
            Please use the following link to complete your registration and set your password:<br>
            <a href='#application.baseURL#?page=complete-registration&token=#registration_token#'>Complete Registration</a><br><br>
            This link will expire in 24 hours.<br><br>
            If you did not expect this email, please ignore it.<br><br>
            Regards,<br>
            Admin Team
        ";
        cfmail(
            to = "amrutha.s@techversantinfotech.com",
            from = "saranyakumar.g@techversantinfotech.com",
            subject = mailSubject,
            type = "html"
        ) {
            writeOutput(mailBody);
        }
    }

    function completeRegistration() {
        var userData = variables.userModel.getUserByToken(url.token);
        if (userData.recordCount > 0) {
            if (userData.is_registered == 1) {
                location(url="?page=errors&status_code=3", addToken=false);
            } else if (now() > userData.token_expiry) {
                location(url="?page=errors&status_code=1", addToken=false);
            } else {
                location(url="?page=set-password&url.token=#url.token#", addToken=false);
            }
        } else {
            location(url="?page=errors&status_code=2", addToken=false);
        }
    }

    function setPassword() {
        var userData = variables.userModel.getUserByToken(form.token);
        if (userData.recordCount > 0) {
            if (form.password == form.repeatPassword) {
                var userData = {
                    password: hmac(form.password, application.secretKey, "HMACSHA256"),
                    registration_token: form.token
                };
                var userResponse = variables.userModel.setPassword(userData);
                writeOutput(serializeJSON(userResponse)); 
            } else {
                writeOutput("Password and repeat password do not match");
            }
        }
    }

    function updateUser() {
        variables.userData = variables.userModel.getUserById(url.id);
        // return variables.userData;
        // writeDump(userData);abort;
    }

    function getUsers() {
        var type = structKeyExists(url, "type") ? url.type : "all";
        var draw = url.draw;
        var start = url.start;
        var length = url.length;
        var searchValue = structKeyExists(url, "search[value]") ? url["search[value]"] : "";
        var orderColumnIndex = structKeyExists(url, "order[0][column]") ? url["order[0][column]"] : "0";
        var orderDir = structKeyExists(url, "order[0][dir]") ? url["order[0][dir]"] : "asc";
        var columnMap = ["user_id", "first_name", "last_name", "email", "role", "access_level", "is_registered"];
        var orderColumn = columnMap[orderColumnIndex + 1];
        var totalRecords = variables.userModel.getTotalUserCount(session.user.user_id, type);
        if(searchValue != ""){
            var filteredRecords = variables.userModel.getFilteredUserCount(searchValue, session.user.user_id, type);
        } else {
            var filteredRecords = totalRecords;
        }
        var users = variables.userModel.getUsers(draw, start, length, searchValue, orderColumn, orderDir, totalRecords, filteredRecords, session.user.user_id, type);
        var data = [];
        for (var i=1; i <= users.recordCount; i++) {
            var user = {
                "user_id": users["USER_ID"][i],
                "first_name": users["FIRST_NAME"][i],
                "last_name": users["LAST_NAME"][i],
                "email": users["EMAIL"][i],
                "role": users["ROLE"][i],
                "access_level": users["ACCESS_LEVEL"][i],
                "is_registered": users["IS_REGISTERED"][i]
            };
            var editAction = "#application.baseURL#?page=user-update&id=#user.user_id#";
            var viewAction = "#application.baseURL#?page=view-user&id=#user.user_id#";
            var actions = '
                <button class="edit-btn" title="Edit User" onclick="window.location.href=''#editAction#''">
                    <i class="icon cil-pencil"></i>
                </button>
                <button class="delete-btn" title="Delete" onclick="deleteUser(#user.user_id#)">
                    <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop"></i>
                </button>
            ';
            arrayAppend(data, {
                "user_id": user.user_id,
                "first_name": user.first_name,
                "last_name": user.last_name,
                "email": user.email,
                "role": user.role,
                "access_level": user.access_level,
                "is_registered": user.is_registered ? "Completed" : "Pending",
                "actions": actions
            });
        }
        writeOutput(serializeJSON({
            "draw": draw,
            "recordsTotal": totalRecords,
            "recordsFiltered": filteredRecords,
            "data": data
        }));
    }
    // gkuh vkht fbbt xljq
</cfscript>


