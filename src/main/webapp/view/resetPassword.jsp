
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/ircondcs/resources/images/favicon-16x16.png"
	type="image/x-icon">
<title>IRCON</title>
<link href="/ircondcs/resources/css/critical.min.css" rel='stylesheet'
	type='text/css'>

<!-- Google font -->
<!-- <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> -->
<!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,400italic,700,700italic' rel='stylesheet' type='text/css'> -->

<!-- Bootstrap -->
<!-- <link href="/ircondcs/resources/js/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- Font Awesome -->
<!-- <link href="/ircondcs/resources/js/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"> -->
<!-- iCheck -->
<!-- <link href="/ircondcs/resources/js/vendors/iCheck/skins/flat/green.css" rel="stylesheet"> -->

<!-- NProgress -->
<!-- <link href="/ircondcs/resources/js/vendors/nprogress/nprogress.css" rel="stylesheet"> -->
<!-- jQuery custom content scroller -->
<!-- <link href="/ircondcs/resources/js/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/> -->
<!-- bootstrap-daterangepicker -->
<!-- <link href="/ircondcs/resources/js/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet"> -->

<!-- Custom Theme Style -->
<!-- <link href="/ircondcs/resources/css/custom.min.css" rel="stylesheet"> -->

<!-- jQuery -->
<script src=" /ircondcs/resources/js/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script
	src=" /ircondcs/resources/js/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- <link href="/ircondcs/resources/js/vendors/select2/dist/css/select2.min.css" rel="stylesheet"> -->
<script src=" /ircondcs/resources/js/jquery.validate.min.js"></script>

<!-- Custom CSS Style -->
<!-- <link href="/ircondcs/resources/css/custom-style.css" rel="stylesheet"> -->

<!-- <link href="/ircondcs/resources/css/style.css" rel="stylesheet"> -->
<!-- <link href="/ircondcs/resources/css/materialize.css" rel="stylesheet"> -->
<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css"> -->
<!-- <link rel="stylesheet" href="/ircondcs/resources/css/darkmode.css"> -->
<!-- <link rel="stylesheet" href="/ircondcs/resources/css/darkmode.css"> -->


<!-- Datatables -->
<!-- <link href="/ircondcs/resources/js/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="/ircondcs/resources/js/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="/ircondcs/resources/css/darkmode.css"> -->

<!-- <link href="/ircondcs/resources/css/darkmode.css" rel="stylesheet"> -->

<script src=" /ircondcs/resources/js/chosen.jquery.js"></script>


<style>
.form-margin {
	margin-bottom: 15px !important;
}

.modal-header {
	padding: 15px;
	border-bottom: 1px solid #e5e5e5;
	background-color: #1B3D8F;
	color: #fff;
}

.close {
	opacity: .9;
	color: #fff;
}

.modal-footer {
	border-top: none;
}

.btn-danger {
	margin-top: 0px;
}

.dropdown-menu-action {
	top: 248%;
}

.value-color {
	padding: 5px;
	font-weight: bold !important;
	color: #000;
}

table.table-bordered.dataTable tbody tr td {
    white-space: break-spaces;
}
.nowrap {
	white-space : nowrap;
}
.form-control {
	font-family: Arial, Helvetica, sans-serif;
}
</style>

<style>
.btn {
	margin-bottom: 0px;
}

.modal-open .modal {
	overflow-y: hidden !important;
}
</style>
<style>
.btn-danger {
	margin-top: 0px;
}

.toolbar {
	float: left;
	margin-top: 1px;
}

@media only screen and (max-width: 767px) {
	.toolbar {
		margin-left: 40px;
	}
}
</style>
<style>
.dropbtn {
	/* background-color: #4CAF50; */
	color: blue;
	padding: 10px;
	font-size: 12px;
	border: none;
	text-decoration: underline;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 170px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	padding: 10px;
	border: 1px solid #ccc;
	left:-60px
}

.dropdown-content a {
	color: black;
	padding: 6px 10px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	color: blue;
	text-decoration: underline;
}

.control-label-left {
	text-align: left;
	margin-bottom: 0;
	padding-top: 7px
}

.control-label-center {
	text-align: ceneter;
	margin-bottom: 0;
	padding-top: 7px;
	color: gray;
}

.add-row {
	box-shadow: 0 0 13px 1px #ddd !important;
    width: 82px;
    padding-left: 20px;
}

th {
	padding-left: 3px;
}

label.error{color:red!important;font-size: 11px!important;}

</style>


</head>

<body class="nav-md">

	<div class="container body">
		<div class="main_container">


			<%-- <jsp:include page="../layout/sideNav.jsp"></jsp:include> --%>

			<!-- page content -->
			<div class="right_col" role="main">


				<!-- heading -->
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard_graph">
							<div class="row x_title">
								<div class="col-md-4 col-sm-4 col-xs-4 d-none d-md-block">

									<ol class="breadcrumb">
											
										<li><a href="javascript:void(0);">Home > Reset Password</a></li>
									</ol>

								</div>
								<div class="col-md-8 col-sm-8 col-xs-12 text-right">
									<button type="button" onclick="showNewUploadDocument('<%=(String) session.getAttribute("USER_ID")%>')"
										class="btn btn-danger modify">Document Upload</button>
									<button type="button" class="btn btn-danger modify">
										<a href="documents?folderId=0&levelId=1" style="color: white;">Folders</a>
									</button>
									<button type="button" class="btn btn-danger modify">
										<a href="documentSearch" style="color: white;" >Other Documents</a>
									</button>
									<button type="button" class="btn btn-danger modify">
										<a href="drawingsDocumentSearch" style="color: white;">Drawings</a>
									</button>
									<button type="button" class="btn btn-danger modify">
										<a href="corresDocumentSearch" style="color: white;" >Correspondance</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- heading -->


				<div class="row ">
					<c:if test="${not empty error}">
						<div
							class="alert alert-danger alert-dismissible col-md-4 col-md-offset-4">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							${error}
						</div>
					</c:if>

					<c:if test="${not empty success}">
						<div
							class="alert alert-success alert-dismissible col-md-4 col-md-offset-4">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							${success}
						</div>
					</c:if>
				</div>


				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard_graph">
							<div class="row x_title">
							
								<form action="<%=request.getContextPath()%>/change-password" id="passwordResetForm" name="passwordResetForm" method="post">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-xs-4"></div>
										<div class="col-md-4 col-sm-4 col-xs-4">
												<div class="form-group">
													<label class="col-md-4 col-sm-4 col-xs-4 control-label labelsize" for="oldPassword">Old Password</label>
													<div class="col-md-8 col-sm-8 col-xs-8">
														<input type="password" id="oldPassword" name="oldPassword" class="form-control" autocomplete="off">
				                                    	<span id="oldPasswordError" ></span>
													</div>
												</div>
		
												<div class="form-group">
													<label class="col-md-4 col-sm-4 col-xs-4 control-label labelsize" for="newPassword">New Password</label>
													<div class="col-md-8 col-sm-8 col-xs-8">
														<input type="password" id="newPassword" name="newPassword" class="form-control" autocomplete="off" pattern="^\d*(\.\d{0,2})?$">
				                                    	<span id="newPasswordError" ></span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-4 col-sm-4 col-xs-4 control-label labelsize" for="confirmPassword">Confirm Password</label>
													<div class="col-md-8 col-sm-8 col-xs-8">
														<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" autocomplete="off">
				                                    	<span id="confirmPasswordError" ></span>
													</div>
												</div>
												
												<div class="form-group">
													<a href="<%=request.getContextPath() %>/reset-password" class="btn btn-default modify"><i class="fa fa-close" aria-hidden="true"></i>Cancel</a>
													<button type="submit" class="btn btn-danger modify">
														<i class="fa fa-check-circle"></i>Change Password
													</button>
												</div>
										</div>
										</div>
										
								</form>
							
							
								
							</div>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>
				
				

			</div>
			<!-- /page content -->

		</div>
	</div>



	<jsp:include page="./layout/bottomNav.jsp"></jsp:include>

    <footer class="page-footer" style="margin: 0 auto;">
        <div class=" container text-center ">
            <p class="footer-text text-center ">Copyright <span id="year "><span id="year"></span>.</span> @<img src="/ircondcs/resources/images/logo.png " alt="ircon logo " class="footer-logo " style="height: 30px;"> | Designed &amp; Developed by
                <img src="/ircondcs/resources/images/synergiz.png " alt="synergiz logo " class="footer-logo " style="height: 30px;"></p>
        </div>
    </footer>
    

	<script
		src=" /ircondcs/resources/js/vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- FastClick -->
	<script
		src=" /ircondcs/resources/js/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src=" /ircondcs/resources/js/vendors/nprogress/nprogress.js"></script>
	<!-- jQuery custom content scroller -->
	<script
		src=" /ircondcs/resources/js/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src=" /ircondcs/resources/js/custom.min.js"></script>

	<!-- bootstrap-daterangepicker -->
	<script src=" /ircondcs/resources/js/vendors/moment/min/moment.min.js"></script>
	<script
		src=" /ircondcs/resources/js/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-daterangepicker -->

	<!-- Datatables -->
	<script
		src=" /ircondcs/resources/js/vendors/datatables.net/js/jquery.dataTables.js"></script>
	<script
		src=" /ircondcs/resources/js/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src=" /ircondcs/resources/js/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src=" /ircondcs/resources/js/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>

	<!-- Datatables -->

	<script type="text/javascript">
		   //form validations
		    $(document).ready(function() {		    	
				 //$("#year").html(new Date().getFullYear());
				 $('#passwordResetForm').validate({
				    rules: {
				     		"oldPassword":{
				     			required:true
		                	},"newPassword":{
		                		required:true,
		                		minlength: 8,
		                		maxlength: 20,
		                        mypassword: true
		                	},"confirmPassword":{
		                		required:true,
		                		minlength: 8,
		                		maxlength: 20,
		                		equalTo: "#newPassword"
		                	}
				     	},
				    messages: {
				   			  "oldPassword":{
				   			  	required:'Old Password Required'
				   			  },"newPassword":{
		                		required:'New Password Required',
		                		minlength: "Your password must be at least 8 characters long",
		                		maxlength: "Your password must be at most 20 characters long"
			                  },"confirmPassword":{
		                		required:'Confirm Password Required',
		                		minlength: "Your password must be at least 8 characters long",
		                		maxlength: "Your password must be at most 20 characters long",
		                		equalTo: "Confirm password must be same as New Password"
			                  }
				   	},errorPlacement:function(error, element){
					       if(element.attr("id") == "oldPassword" ){
							 document.getElementById("oldPasswordError").innerHTML="";
							 error.appendTo('#oldPasswordError');
					        }else if (element.attr("id") == "newPassword" ){
							 document.getElementById("newPasswordError").innerHTML="";
							 error.appendTo('#newPasswordError');
				            }else if (element.attr("id") == "confirmPassword" ){
								 document.getElementById("confirmPasswordError").innerHTML="";
								 error.appendTo('#confirmPasswordError');
					        }else{error.insertAfter(element);} 
					       
				    },invalidHandler: function (form, validator) {
	                     var errors = validator.numberOfInvalids();
	                     if (errors) {
	                         var position = validator.errorList[0].element;
	                         jQuery('html, body').animate({
	                             scrollTop:jQuery(validator.errorList[0].element).offset().top - 100
	                         }, 1000);
	                     }
	                 },submitHandler:function(form){
				    	form.submit();
				    }
				});  
				 
				 
				 
				jQuery.validator.addMethod("mypassword", function(value, element) {
					  // allow any non-whitespace characters as the host part
					  return this.optional( element ) || /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/.test( value );
				}, 'Password should contain minimum 1 uppercase letter, 1 lowercase letter, 1 number & 1 special character');
				
			});
		   
		    $('select').change(function(){
	    	    if ($(this).val() != ""){
	    	        $(this).valid();
	    	    }
	    	});
	        
	        $('input').change(function(){
	    	    if ($(this).val() != ""){
	    	        $(this).valid();
	    	    }
	    	});
					
		    
		</script>

</body>
</html>
