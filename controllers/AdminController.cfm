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
        var userResponse = variables.userModel.saveUser(userData);
        // sendRegistrationEmail(userData, registration_token); // uncomment for sending email to user
        var auditAction = "User Created By Admin";
        var auditDetails = "User " & userData.firstName & " " & userData.lastName & " (" & userData.email & ") created with role ID " & userData.role & " and access level ID " & userData.accessLevel;
        var auditData = {
            user_id: userResponse.user_id, // replaced with session.user_id after login
            role_id: userData.role,         // replaced with session.role_id after login
            action: auditAction,
            entity_type: "Users",
            access_level_id: userData.accessLevel, // replaced with session.access_level_id after login
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
    // gkuh vkht fbbt xljq
</cfscript>


