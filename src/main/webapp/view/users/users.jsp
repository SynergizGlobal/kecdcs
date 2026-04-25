	
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
	<link rel="icon" href="/ircondcs/resources/images/favicon-16x16.png" type="image/x-icon">
    <title>Admin Users</title>  <link href="/ircondcs/resources/css/critical.min.css" rel='stylesheet' type='text/css'>
	
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
    <script src=" /ircondcs/resources/js/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- <link href="/ircondcs/resources/js/vendors/select2/dist/css/select2.min.css" rel="stylesheet"> -->
   	 <script src=" /ircondcs/resources/js/jquery.validate.min.js"></script>
   	
    <!-- Custom CSS Style -->
    <!-- <link href="/ircondcs/resources/css/custom-style.css" rel="stylesheet"> -->
    
     <!-- <link href="/ircondcs/resources/css/style.css" rel="stylesheet"> -->
    <!-- <link href="/ircondcs/resources/css/materialize.css" rel="stylesheet"> -->
    <!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css"> --> <!-- <link rel="stylesheet" href="/ircondcs/resources/css/darkmode.css"> --> <!-- <link rel="stylesheet" href="/ircondcs/resources/css/darkmode.css"> -->
    
    
    <!-- Datatables -->
    <!-- <link href="/ircondcs/resources/js/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet"> -->
    <!-- <link href="/ircondcs/resources/js/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet"> --><!-- <link rel="stylesheet" href="/ircondcs/resources/css/darkmode.css"> -->
	
    <!-- <link href="/ircondcs/resources/css/darkmode.css" rel="stylesheet"> -->
        
	   <style>
	   	/* .form-horizontal .control-label{
	   		text-align: left!important;
	   	} */
	   	.form-margin{
	   		margin-bottom: 15px!important;
	   	} 
	   	.modal-header {
		    padding: 15px;
		    border-bottom: 1px solid #e5e5e5;
		    background-color: #f27935;
		    color: #fff;
		}
		.close{
			opacity: .9;
			color: #fff;
		}
		.modal-footer{
			border-top: none;
		}
		.btn-danger{
			margin-top: 0px;
		}
		
		.dropdown-menu-action {
		    top: 248%;
		}
		
		

	   </style>
	   
	   <style>
		.btn{
			margin-bottom: 0px;
		}
		
		.modal-open .modal {
			overflow-y: hidden!important;
		}
		
	</style>	
	<style>
	   	/* .form-horizontal .control-label{
	   		text-align: left!important;
	   	} */
	   	.form-margin{
	   		margin-bottom: 15px!important;
	   	} 
	   	.modal-header {
		    padding: 15px;
		    border-bottom: 1px solid #e5e5e5;
		    background-color: #f27935;
		    color: #fff;
		}
		.close{
			opacity: .9;
			color: #fff;
		}
		.modal-footer{
			border-top: none;
		}
		.btn-danger{
			margin-top: 0px;
		}
		.toolbar {
		    float:left;
		    margin-top: 1px;
		}
		@media only screen and (max-width: 767px){
    		.toolbar {margin-left: 40px;}
		}
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
                  <div class="col-md-6 col-sm-6 col-xs-6"><h4>Users</h4></div>
                  <div class="col-md-6 col-sm-6 col-xs-6"><a href="<%=request.getContextPath() %>/createUser" class="btn btn-theme btn-sm btn-min-block crate-btn"><i class="fa fa-plus"></i>Add</a></div>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <!-- heading -->
          
          
           		<div class="row ">
                  <c:if test="${not empty error}">
	              	<div class="alert alert-danger alert-dismissible col-md-4 col-md-offset-4">
					  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					  ${error}
					</div>
	              </c:if>
	              
	              <c:if test="${not empty success  }">
	              	<div class="alert alert-success alert-dismissible col-md-4 col-md-offset-4">
					  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					  ${success}
					</div>
	              </c:if>
                </div>
               
          
<!-- ------------------table data ------------------------------------------------------------------------------------>

		          <div class="clearfix"></div>
		          <div class="row" style="margin-bottom: 20px;">
		            <div class="col-md-12 col-sm-12 col-xs-12">
		              <div class="x_panel">
		                <!-- <div class="x_title w2n_title">
		                  <h2>Tasks List</h2>
		                  <ul class="nav navbar-right panel_toolbox">
		                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
		                    </li>
		                  </ul>
		                  <div class="clearfix"></div>
		                </div> -->
		                <div class="x_content">
		                
		                	<!-- <div class="useradd">	
		                		<form action="createUser" name="createUserForm" id="createUserForm" method="post">
							          <button type="submit" class="btn btn-info" ><i class="fa fa-plus"></i>Add</button>
							    </form>
			                </div> -->
		                
		                
		                  <table id="datatable-users" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
		                    <thead style="color: white;background: #f27935;">
		                      <tr>
		                        <th>Name</th>
		                        <th>Mobile</th>
		                        <th>Email</th>
		                        <th>Role</th>
		                        <th>Company</th>
		                        <th>Status</th>
		                        <th>Action</th>
		                      </tr>
		                    </thead>
		                    <tbody id="usersTable">
		                    	
			                      
		                    </tbody>
		                  </table>
		
		                </div>
		              </div>
		            </div>
		          </div>
          
          
        
<!-- ------------------table data ------------------------------------------------------------------------------------>
          			
	                            	
	                          
					
					<div id="deleteModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
					    <div class="modal-dialog modal-sm">
					        <div class="modal-content">
			            	  <div class="modal-header">
			            	   		<button type="button" class="close" data-dismiss="modal">×</button>
                                    <h4 class="modal-title">Confirmation </h4>
                              </div>
                              <form action="deleteUser" id="deleteUserForm" name="deleteUserForm" method="post">
		                          <div class="modal-body">
		                           	<p>Are you sure you want to delete?</p>
		                           	<input type="hidden" id="deleteUserId" name="userId" />
		                          </div>
		                          <div class="modal-footer">
					                   <button type="submit" class="btn btn-danger" ><i class="fa fa-check-circle"></i>Ok</button>
					                   <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelDelete()"><i class="fa fa-times"></i>Cancel</button>
					              </div>
				              </form>
						   </div>
					    </div>
					</div>
          
          
          
          
          
    <!-- ------------------Roles table data ------------------------------------------------------------------------------------>
    
          
          <!-- heading -->
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">
                <div class="row x_title">
                  <div class="col-md-6 col-sm-6 col-xs-6"><h4>Roles</h4></div>
                  <div class="col-md-6 col-sm-6 col-xs-6"><a href="javascript:void(0);"  class="btn btn-theme btn-sm btn-min-block crate-btn" data-toggle="modal" data-target="#addRoleModal"><i class="fa fa-plus"></i>Add</a></div>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <!-- heading -->
          

		          <div class="clearfix"></div>
		          <div class="row" style="margin-bottom: 40px;">
		            <div class="col-md-12 col-sm-12 col-xs-12">
		              <div class="x_panel">
		                <div class="x_content">		                
		                
		                  <table id="datatable-roles" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
		                    <thead style="color: white;background: #f27935;">
		                      <tr>
		                        <th>Role Id</th>
		                        <th>Role Name</th>
		                        <th>Action</th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                    		                      
		                    </tbody>
		                  </table>
		
		                </div>
		              </div>
		            </div>
		          </div>
          
          
        
<!-- ------------------Roles table data ------------------------------------------------------------------------------------>
          			
          			<div id="addRoleModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
					    <div class="modal-dialog modal-sm">
					        <div class="modal-content">
			            	  <div class="modal-header">
			            	   		<button type="button" class="close" data-dismiss="modal">×</button>
                                    <h4 class="modal-title">Add Role </h4>
                              </div>
                              <form action="addRole" id="addRoleForm" name="addRoleForm" method="post">
		                          <div class="modal-body">
		                            <input type="text" name="roleName" required="required" autocomplete="off" class="form-control"/>
		                          </div>
		                          <div class="modal-footer">
					                   <button type="submit" class="btn btn-danger" ><i class="fa fa-check-circle"></i>Add</button>
					                   <button type="button" class="btn btn-default" data-dismiss="modal" ><i class="fa fa-times"></i>Cancel</button>
					              </div>
				              </form>
						   </div>
					    </div>
					</div>
	                
	                <div id="editRoleModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
					    <div class="modal-dialog modal-sm">
					        <div class="modal-content">
			            	  <div class="modal-header">
			            	   		<button type="button" class="close" data-dismiss="modal">×</button>
                                    <h4 class="modal-title">Update Role </h4>
                              </div>
                              <form action="updateRole" id="updateRoleForm" name="updateRoleForm" method="post">
		                          <div class="modal-body">
		                            <input type="text" id="roleName" name="roleName" required="required" autocomplete="off" class="form-control" />
		                           	<input type="hidden" id="roleId" name="roleId" />
		                          </div>
		                          <div class="modal-footer">
					                   <button type="submit" class="btn btn-danger" ><i class="fa fa-check-circle"></i>Update</button>
					                   <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelRoleUpdate()"><i class="fa fa-times"></i>Cancel</button>
					              </div>
				              </form>
						   </div>
					    </div>
					</div>
					            	
	                          
					
					<div id="deleteRoleModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
					    <div class="modal-dialog modal-sm">
					        <div class="modal-content">
			            	  <div class="modal-header">
			            	   		<button type="button" class="close" data-dismiss="modal">×</button>
                                    <h4 class="modal-title">Confirmation </h4>
                              </div>
                              <form action="deleteRole" id="deleteRoleForm" name="deleteRoleForm" method="post">
		                          <div class="modal-body">
		                           	<p>Are you sure! you want to delete role permanently?</p>
		                           	<input type="hidden" id="deleteRoleId" name="roleId" />
		                          </div>
		                          <div class="modal-footer">
					                   <button type="submit" class="btn btn-danger" ><i class="fa fa-check-circle"></i>Delete</button>
					                   <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelRoleDelete()"><i class="fa fa-times"></i>Cancel</button>
					              </div>
				              </form>
						   </div>
					    </div>
					</div>
          
          
          
          
          
          
        </div>
        <!-- /page content -->
        
        
        
    	<div id="loadingImg" style="display: none;">
    		<div style="position: fixed; left: 0; top: 0; z-index: 202; background-color: rgba(0,0,0,0.5); width: 100%;Height: 100%;">
				<i class="fa fa-spinner fa-spin" style="font-size:48px;color:red; position:fixed; margin-top: -24px%;margin-left: -24px;top:50%;left: 50%;"></i>
			</div>
		</div>
        
     </div>
    </div>
    
    
    <form action="getUser" name="getUserForm" id="getUserForm" method="post">	
          <input type="hidden" name="userId" id="userId" />
          <input type="hidden" name="createUser" id="createUser" />
    </form>
    
    <%-- <jsp:include page="../layout/bottomNav.jsp"></jsp:include> --%>
    
   
    
    
    <jsp:include page="./../layout/bottomNav.jsp"></jsp:include>
    
    
    
    
    
	
	<script src=" /ircondcs/resources/js/vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- FastClick -->
    <script src=" /ircondcs/resources/js/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src=" /ircondcs/resources/js/vendors/nprogress/nprogress.js"></script>
    <!-- jQuery custom content scroller -->
    <script src=" /ircondcs/resources/js/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src=" /ircondcs/resources/js/custom.min.js"></script>
    
    <!-- bootstrap-daterangepicker -->
    <script src=" /ircondcs/resources/js/vendors/moment/min/moment.min.js"></script>
    <script src=" /ircondcs/resources/js/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-daterangepicker -->
    
    <!-- Datatables -->
    <script src=" /ircondcs/resources/js/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src=" /ircondcs/resources/js/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src=" /ircondcs/resources/js/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src=" /ircondcs/resources/js/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    
    <!-- Datatables -->
    
    
    <script type="text/javascript">
    	$(document).ready(function(){
			getUsersList();
			getRoles();
    	});
	    
	    function getUsersList(){
			$('#datatable-users').dataTable().fnClearTable();
 			$('#datatable-users').dataTable().fnDestroy();
			var table = $('#datatable-users').DataTable({"order": [[ 0, "desc" ]]}).rows().remove().draw();
			//var myParams = {dates : dates,statusId:statusId}
			$("#loadingImg").show();
			$.ajax({url : "<%=request.getContextPath()%>/getUsersList",success : function(data){
				if(data != null && data != ''){
	            	$.each(data,function(key,val){
	            			var userId = "'"+val.userId+"'";
		                        	
		                        	var actions = '<div class="btn-group">'
		                        		+'<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">'
		                        		+'Select <span class="caret"></span></button>'
		                        		+'<ul class="dropdown-menu dropdown-menu-action" role="menu">'
		                        		+'<li><a href="javascript:void(0);" onclick="getUser('+userId+');">Edit</a></li>'
		                        		+'<li><a href="javascript:void(0);" onclick="deleteUser('+userId+');">Delete</a></li>'
		                        		+'</ul>'
		                        		+'</div>';
		                        	
		                        	
	                        table.row.add( [
								            val.userName,
								            val.mobileNumber,
								            val.emailId,
								            val.roleName,
								            val.companyName,
								            val.status,
								            actions
								        ] ).draw( false );
					});
					$("#loadingImg").hide();
				}else{
					$("#loadingImg").hide();
				}
				
			},error: function (jqXHR, exception) {
				$("#loadingImg").hide();
	            getErrorMessage(jqXHR, exception);
	        }});
	    }
	    
	    function getUser(userId){
	    	$("#userId").val(userId);
	    	$("#getUserForm").submit();
	    }
	    
	    function deleteUser(userId){
	    	$("#deleteUserId").val(userId);
	    	$('#deleteModal').modal('show');
	    }
	    
	    function cancelDelete(){
			$("#deleteUserId").val('');
	    }
	    
	    
	    
	    // This function is used to get error message for all ajax calls
	  function getErrorMessage(jqXHR, exception) {
		    var msg = '';
		    if (jqXHR.status === 0) {
		        msg = 'Not connect.\n Verify Network.';
		    } else if (jqXHR.status == 404) {
		        msg = 'Requested page not found. [404]';
		    } else if (jqXHR.status == 500) {
		        msg = 'Internal Server Error [500].';
		    } else if (exception === 'parsererror') {
		        msg = 'Requested JSON parse failed.';
		    } else if (exception === 'timeout') {
		        msg = 'Time out error.';
		    } else if (exception === 'abort') {
		        msg = 'Ajax request aborted.';
		    } else {
		        msg = 'Uncaught Error.\n' + jqXHR.responseText;
		    }
		    console.log(msg);
	 }
	    
	    
	  function getRoles(){
			$('#datatable-roles').dataTable().fnClearTable();
			$('#datatable-roles').dataTable().fnDestroy();
			var table = $('#datatable-roles').DataTable().rows().remove().draw();
			//var myParams = {dates : dates,statusId:statusId}
			$("#loadingImg").show();
			$.ajax({url : "<%=request.getContextPath()%>/getRoles",success : function(data){
				if(data != null && data != ''){
	            	$.each(data,function(key,val){
	            			var roleId = "'"+val.roleId+"'";
		                        	
                        	var actions = '<div class="btn-group">'
                        		+'<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">'
                        		+'Select <span class="caret"></span></button>'
                        		+'<ul class="dropdown-menu dropdown-menu-action" role="menu">'
                        		+'<li><a href="javascript:void(0);" onclick="getRole('+roleId+');">Edit</a></li>'
                        		+'<li><a href="javascript:void(0);" onclick="deleteRole('+roleId+');">Delete</a></li>'
                        		+'</ul>'
                        		+'</div>';
		                        	
		                        	
	                        table.row.add( [
								            val.roleId,
								            val.roleName,
								            actions
								        ] ).draw( false );
					});
					$("#loadingImg").hide();
				}else{
					$("#loadingImg").hide();
				}
				
			},error: function (jqXHR, exception) {
				$("#loadingImg").hide();
	            getErrorMessage(jqXHR, exception);
	        }});
	    }
	    
	  function getRole(roleId){
	    	$('#editRoleModal').modal('show');
	    	var params = {roleId:roleId};
	    	$("#loadingImg").show();
			$.ajax({url : "<%=request.getContextPath()%>/getRole",type:'post',data:params,success : function(data){
				if($.trim(data) != ''){
					 $("#roleId").val(data.roleId);
				     $("#roleName").val(data.roleName); 
					$("#loadingImg").hide();
				}else{
					$("#loadingImg").hide();
				}
				
			},error: function (jqXHR, exception) {
				$("#loadingImg").hide();
	            getErrorMessage(jqXHR, exception);
	        }});
	  }
	  
	  function cancelRoleUpdate(){
		    $("#roleId").val('');
	    	$("#roleName").val(''); 
	  }
	    
	  function deleteRole(roleId){
	   		$("#deleteRoleId").val(roleId);
	    	$('#deleteRoleModal').modal('show');
	  }
	    
	  function cancelRoleDelete(){
			$("#deleteRoleId").val('');
	  }
	    
	  
	    
	</script>
    
    </body>
</html>
        