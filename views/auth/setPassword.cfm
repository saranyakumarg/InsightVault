<cfinclude  template="../shared/head.cfm">
  <body>
  <cfoutput>
    <div id="appConfig" data-baseurl="#application.baseURL#"></div>
    <div class="bg-body-tertiary min-vh-100 d-flex flex-row align-items-center">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-6">
            <div class="card mb-4 mx-4">
              <div class="card-body p-4">
                <h5>InsightVault</h5>
                <p class="text-body-secondary">Set Password</p>
                <cfform action="" method="post" id="setPasswordForm">
                <cfinput class="form-control" type="hidden" name="token" value="#url.token#">
                  <div class="input-group mb-3">
                    <span class="input-group-text">
                      <svg class="icon">
                        <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg##cil-lock-locked"></use>
                      </svg>
                    </span>
                    <cfinput class="form-control" type="password" name="password" placeholder="Password" required="yes">
                  </div>
                  <div class="input-group mb-4">
                    <span class="input-group-text">
                      <svg class="icon">
                        <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg##cil-lock-locked"></use>
                      </svg>
                    </span>
                    <cfinput class="form-control" type="password" name="repeatPassword" placeholder="Repeat password" required="yes">
                  </div>
                  <button type="submit" class="btn btn-block btn-success">Submit</button>
                </cfform>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </cfoutput>
    <cfinclude  template="../shared/toast.cfm">
    <cfinclude  template="../shared/scripts.cfm">
    <script src="assets/js/setPassword.js"></script>
  </body>
</html>