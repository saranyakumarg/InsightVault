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
            case "complete-registration":
                completeRegistration();
                break;
            case "set-password":
                setPassword();
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
                    role_id: userData.role_id,
                    access_level_id: userData.access_level_id,
                    access_level: userData.access_level
                };
                writeOutput(serializeJSON({ "SUCCESS": true, "message": "Login successful" }));
            }
        } else {
            writeOutput(serializeJSON({ "SUCCESS": false, "message": "Invalid username or password" }));
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

    function logout() {
        structDelete(session, "user");
        writeOutput(serializeJSON({ "SUCCESS": true, "message": "Logout successful" }));
    }
</cfscript>