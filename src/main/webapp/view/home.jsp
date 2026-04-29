	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	    
	    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="/kecdcs/resources/images/favicon-16x16.png" type="image/x-icon">
    <title>KEC - Welcome</title>  <link href="/kecdcs/resources/css/critical.min.css" rel='stylesheet' type='text/css'>
	
	<!-- Google font -->
    <!-- <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> -->
    <!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,400italic,700,700italic' rel='stylesheet' type='text/css'> -->
	
    <!-- Bootstrap -->
    <!-- <link href="/kecdcs/resources/js/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- Font Awesome -->
    <!-- <link href="/kecdcs/resources/js/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"> -->
     <!-- iCheck -->
    <!-- <link href="/kecdcs/resources/js/vendors/iCheck/skins/flat/green.css" rel="stylesheet"> -->
    
     <!-- NProgress -->
    <!-- <link href="/kecdcs/resources/js/vendors/nprogress/nprogress.css" rel="stylesheet"> -->
    <!-- jQuery custom content scroller -->
    <!-- <link href="/kecdcs/resources/js/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/> -->
    
    <!-- Custom Theme Style -->
    <!-- <link href="/kecdcs/resources/css/custom.min.css" rel="stylesheet"> -->
       
    <!-- jQuery -->
    <script src=" /kecdcs/resources/js/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src=" /kecdcs/resources/js/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- <link href="/kecdcs/resources/js/vendors/select2/dist/css/select2.min.css" rel="stylesheet"> -->
	
	 <!-- Custom CSS Style -->
    <!-- <link href="/kecdcs/resources/css/custom-style.css" rel="stylesheet"> -->
    
     <!-- <link href="/kecdcs/resources/css/style.css" rel="stylesheet"> -->
    <!-- <link href="/kecdcs/resources/css/materialize.css" rel="stylesheet"> -->
    <!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css"> --> <!-- <link rel="stylesheet" href="/kecdcs/resources/css/darkmode.css"> --> <!-- <link rel="stylesheet" href="/kecdcs/resources/css/darkmode.css"> -->
  
  </head>

  <body class="nav-md scroll_hide">
    <div class="container body">
      <div class="main_container">
      
      
      <jsp:include page="./layout/sideNav.jsp"></jsp:include>
		
		<!-- page content -->
        <div class="right_col" role="main">
        
         
        
          <!-- heading -->
           <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">
                <div class="row x_title">
                  <h4>Home</h4>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div> 
          
          <!-- /heading -->
          
          <div class="clearfix"></div>		             
	          <div class="row" style="margin-bottom: 20px;">
	            <div class="col-md-12 col-sm-12 col-xs-12">
	              <div class="x_panel">
               		<div class="x_content">
	                <div class="row x_title ">
                
	                	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">                       
		                    <div class="crm-grid-main">
		                        <h4 class=" property-address-heading rotunda-heading load-doc-heading crm-heading">Tasks</h4>
							<div class="left_100">
								<div class="left_100 sec-chart-main">
									<div style="width:100%;">
										<canvas id="tasksChart"></canvas>
									</div>
									<br>
								</div>					  
							</div>
							</div>
						</div>
						
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">                       
		                    <div class="crm-grid-main">
		                        <h4 class=" property-address-heading rotunda-heading load-doc-heading crm-heading">Users</h4>
							<div class="left_100">
								<div class="left_100 sec-chart-main">
									<div style="width:100%;">
										<canvas id="usersChart"></canvas>
									</div>
									<br>
								</div>					  
							</div>
							</div>
						</div>
					
	                	<div class="clearfix"></div>
	              </div>
	            </div>
	          </div>
	       </div>
	     </div>
        
    	<div id="loadingImg" style="display: none;">
    		<div style="position: fixed; left: 0; top: 0; z-index: 202; background-color: rgba(0,0,0,0.5); width: 100%;Height: 100%;">
				<i class="fa fa-spinner fa-spin" style="font-size:48px;color:red; position:fixed; margin-top: -24px%;margin-left: -24px;top:50%;left: 50%;"></i>
			</div>
		</div>
        
     </div>
    </div>
 </div>   
    
    <jsp:include page="./layout/bottomNav.jsp"></jsp:include>
    
	
	<script src=" /kecdcs/resources/js/vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- FastClick -->
    <script src=" /kecdcs/resources/js/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src=" /kecdcs/resources/js/vendors/nprogress/nprogress.js"></script>
    <!-- jQuery custom content scroller -->
    <script src=" /kecdcs/resources/js/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src=" /kecdcs/resources/js/custom.min.js"></script>
    
    <!-- bootstrap-daterangepicker -->
    <script src=" /kecdcs/resources/js/vendors/moment/min/moment.min.js"></script>
    <script src=" /kecdcs/resources/js/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-daterangepicker -->
    
    <!-- Datatables -->
    <script src=" /kecdcs/resources/js/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src=" /kecdcs/resources/js/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src=" /kecdcs/resources/js/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src=" /kecdcs/resources/js/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    
    <!-- Datatables -->
    <script src=" /kecdcs/resources/js/Chart.min.js"></script>
    <script src=" /kecdcs/resources/js/Chart.bundle.min.js"></script>
    <script src=" /kecdcs/resources/js/utils.js"></script>
    <script>
		var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		var config = {
			type: 'line',
			data: {
				labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
				datasets: [{
					label: 'Pending',
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: [8, 12, 6, 4, 8, 19,25],
					fill: false,
				}, {
					label: 'Completed',
					fill: false,
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [12, 19, 3, 5, 2, 3,9],
				}]
			},
			options: {
				responsive: true,
				/* title: {
					display: true,
					text: 'Chart.js Line Chart'
				}, */
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: true/* ,
						scaleLabel: {
							display: true,
							labelString: 'Month'
						} */
					}],
					yAxes: [{
						display: true,
						/* scaleLabel: {
							display: true,
							labelString: 'Value'
						} */
					}]
				}
			}
		};
		
		var config2 = {
				type: 'line',
				data: {
					labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
					datasets: [{
						label: 'Active',
						backgroundColor: window.chartColors.blue,
						borderColor: window.chartColors.blue,
						data: [8, 12, 6, 4, 8, 19,25],
						fill: false,
					}, {
						label: 'In-Active',
						fill: false,
						backgroundColor: window.chartColors.red,
						borderColor: window.chartColors.red,
						data: [3, 1, 13, 14, 25, 16,4]
					}]
				},
				options: {
					responsive: true,
					/* title: {
						display: true,
						text: 'Chart.js Line Chart'
					}, */
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true/* ,
							scaleLabel: {
								display: true,
								labelString: 'Month'
							} */
						}],
						yAxes: [{
							display: true,
							/* scaleLabel: {
								display: true,
								labelString: 'Value'
							} */
						}]
					}
				}
			};

		window.onload = function() {
			var ctx = document.getElementById('tasksChart').getContext('2d');
			window.myLine = new Chart(ctx, config);
			
			var ctx2 = document.getElementById('usersChart').getContext('2d');
			window.myLine = new Chart(ctx2, config2);
		};
		

	</script>

	 
    </body>
</html>