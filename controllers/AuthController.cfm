<cfif structKeyExists(url, "method")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>

    // Get the user model
    variables.userModel = createObject("component", application.baseURL & "models.UserModel");

    if (structKeyExists(url, "method")) {
        switch (url.method) {
            case "login":
                login();
                break;
            case "logout":
                logout();
                break;
        }
    }

    function login() {
        var loginData = {
            username: form.username,
            password: hmac(form.password, application.secretKey, "HMACSHA256")
        };
        var userData = variables.userModel.authenticate(loginData.username, loginData.password);
        if(userData.recordCount > 0){
            if(userData.is_registered == 0) {
                writeOutput(serializeJSON({ "SUCCESS": false, "message": "User registration in progress. Please complete registration." }));
            } else{
                session.user = {
                    user_id: userData.user_id,
                    first_name: userData.first_name,
                    last_name: userData.last_name,
                    email: userData.email,
                    role: userData.role,
                    access_level: userData.access_level
                };
                writeOutput(serializeJSON({ "SUCCESS": true, "message": "Login successful" }));
            }
        } else {
            writeOutput(serializeJSON({ "SUCCESS": false, "message": "Invalid username or password" }));
        }
    }

    function logout() {
        structDelete(session, "user");
        writeOutput(serializeJSON({ "SUCCESS": true, "message": "Logout successful" }));
    }
</cfscript>