<cfoutput><!-- CoreUI and necessary plugins-->
    <script src="assets/coreui/node_modules/@coreui/coreui/dist/js/coreui.bundle.min.js"></script>
    <script>
      const header = document.querySelector('header.header');
      
      document.addEventListener('scroll', () => {
        if (header) {
          header.classList.toggle('shadow-sm', document.documentElement.scrollTop > 0);
        }
      });
      </script>
      
    <!-- Plugins and scripts required by this view-->
    <script src="assets/coreui/node_modules/@coreui/chartjs/dist/js/coreui-chartjs.js"></script>
    <script src="assets/coreui/node_modules/@coreui/utils/dist/umd/index.js"></script>
    <script src="assets/coreui/js/main.js"></script>
    <script src="assets/coreui/js/toasts.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
  </cfoutput>