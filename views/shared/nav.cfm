  <cfoutput>
    <div class="sidebar sidebar-dark sidebar-fixed border-end" id="sidebar">
      <div class="sidebar-header border-bottom">
        <div class="sidebar-brand">
          InsightVault
        </div>
        <button class="btn-close d-lg-none" type="button" data-coreui-theme="dark" aria-label="Close" onclick="coreui.Sidebar.getInstance(document.querySelector(&quot;##sidebar&quot;)).toggle()"></button>
      </div>
      <ul class="sidebar-nav" data-coreui="navigation" data-simplebar>
        <li class="nav-item"><a class="nav-link" href="#application.baseURL#?page=admin-dashboard">
          <svg class="nav-icon">
            <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg##cil-speedometer"></use>
          </svg> Dashboard</a>
        </li>
        <li class="nav-group"><a class="nav-link nav-group-toggle" href="##">
          <svg class="nav-icon">
              <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg##cil-notes"></use>
            </svg> Contents</a>
          <ul class="nav-group-items compact">
            <li class="nav-item"><a class="nav-link" href="#application.baseURL#?page=content-all"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> All</a></li>
            <li class="nav-item"><a class="nav-link" href="#application.baseURL#?page=content-all"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> Approval Pending</a></li>
          </ul>
        </li>
        <li class="nav-group"><a class="nav-link nav-group-toggle" href="##">
          <svg class="nav-icon">
            <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg##cil-puzzle"></use>
          </svg> Users</a>
          <ul class="nav-group-items compact">
            <li class="nav-item"><a class="nav-link" href="#application.baseURL#?page=users-all"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> All</a></li>
            <li class="nav-item"><a class="nav-link" href="#application.baseURL#?page=users-all"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> Approval Pending</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link" href="charts.html">
          <svg class="nav-icon">
            <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg##cil-layers"></use>
          </svg> Categories</a>
        </li>
        <li class="nav-item"><a class="nav-link" href="charts.html">
          <svg class="nav-icon">
            <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg##cil-cursor"></use>
          </svg> Tags</a>
        </li>
      </ul>
      <div class="sidebar-footer border-top d-none d-md-flex">     
        <button class="sidebar-toggler" type="button" data-coreui-toggle="unfoldable"></button>
      </div>
    </div>
  </cfoutput>