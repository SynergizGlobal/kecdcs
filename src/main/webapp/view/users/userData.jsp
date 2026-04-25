	
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
    <title>Document Upload</title>  <link href="/ircondcs/resources/css/critical.min.css" rel='stylesheet' type='text/css'>
	
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
    <!-- <link href="/ircondcs/resources/css/chosen.css" rel="stylesheet"> -->
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
	  <!-- <link href="/ircondcs/resources/css/jquery.datetimepicker.css" rel="stylesheet"> -->
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
		
		.static-text {
		    font-weight: normal;
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
                	<c:if test="${createUser eq true}">
                		<h4>Create New User</h4>
                	</c:if>
                	<c:if test="${updateUser eq true}">
                		<h4>User Details</h4>
                	</c:if>
                  	
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
		               
		                <div class="x_content">
		                
		                	<!-- <div class="useradd">											
								<button type="submit" class="btn btn-info" ><i class="fa fa-plus"></i>Edit</button>
			                </div> -->
		                
			                <div class="row">
					            <div class="col-md-12 col-sm-12 col-xs-12">
					              <div class="dashboard_graph">	
					              	<c:if test="${updateUser eq true}">				                
					                	<form action="userUpdate" id="userForm" name="userForm" method="post" class="form-horizontal" role="form">
									    <input type="hidden" name="userId" id="userId" value="${user.userId }"/>
					                </c:if>
					                <c:if test="${createUser eq true}">				                
					                	<form action="createNewUser" id="userForm" name="userForm" method="post" class="form-horizontal" role="form">
									</c:if>
					                  <div class="row userform">
			                             
									    <div class="col-md-6 col-sm-6 col-xs-12">
									        <fieldset>
									
									          <!-- Form Name -->
									          <!-- <legend>Address Details</legend> -->
									
									          <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Name</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="text" id="userName" name="userName" value="${user.userName }" autocomplete="off" maxlength="98" class="form-control">
									              <span id="userNameError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									
									          <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Mobile Number</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="number" id="mobileNumber" name="mobileNumber" value="${user.mobileNumber }"  autocomplete="off" maxlength="10" class="form-control">
									            	<span id="mobileNumberError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									
									          <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Email ID</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="email" id="emailId" name="emailId" value="${user.emailId }"  autocomplete="off" maxlength="100" class="form-control">
									              <span id="emailIdError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									          
									          <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Password</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="password" id="password" name="password" value="${user.password }"  autocomplete="off" maxlength="100" class="form-control">
									              <span id="passwordError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									          
									          <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Address 1</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="text" id="address1" name="address1" value="${user.address1 }"  autocomplete="off" maxlength="100" class="form-control">
									            	<span id="address1Error" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									          
									          <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Address 2</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="text" id="address2" name="address2" value="${user.address2 }"  autocomplete="off" maxlength="100" class="form-control">
									            	<span id="address2Error" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
													
											  <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">PasswordExpiryDays</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="number" id="passwordExpiryDays" name="passwordExpiryDays" value="${user.passwordExpiryDays }" autocomplete="off" maxlength="4" class="form-control">
									            	<span id="passwordExpiryDaysError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>		
																			          
									        </fieldset>
									      
									    </div><!-- /.col-lg-12 -->
											
											
										<div class="col-md-6 col-sm-6 col-xs-12">
									      <fieldset>
									
									          <!-- Form Name -->
									          <!-- <legend>Address Details</legend> -->
											 <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Role</label>
									            <div class="col-sm-8 col-xs-8">
									              <select id="roleId" name="roleId" class="form-control chosen-select">
												      <option value="">--Select Role--</option>
												      <c:forEach var="role" items="${rolesList }">
												      		<option value="${role.roleId }" <c:if test="${user.roleId eq role.roleId }">selected</c:if>>${role.roleName }</option>
												      </c:forEach>
												    </select>
												    <span id="roleIdError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									         </div>
									          
									          <!-- Text input-->
									          <div class="form-group">  
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Company Name</label>
									            <div class="col-sm-8 col-xs-8">
									              <select id="companyId" name="companyId" class="form-control chosen-select">
												      <option value="">--Select Company--</option>
												      <c:forEach var="company" items="${companyList }">
												      		<option value="${company.companyId }" <c:if test="${user.companyId eq company.companyId }">selected</c:if>>${company.companyName }</option>
												      </c:forEach>
												    </select>
												    <span id="companyIdError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									
									          
									
									          <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">User Status</label>
									            <div class="col-sm-8 col-xs-8">
									               <select id="statusId" name="statusId" class="form-control chosen-select">
												      <option value="">--Select Status--</option>
												      <c:forEach var="status" items="${statusList }">
												      		<option value="${status.statusId }" <c:if test="${user.statusId eq status.statusId }">selected</c:if>>${status.statusName }</option>
												      </c:forEach>
												    </select>
												    <span id="statusIdError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									          
									          <!-- Text input-->
									          <div class="form-group">   
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Rating</label>
									            <div class="col-sm-8 col-xs-8">
									              <select id="rating" name="rating" class="form-control chosen-select">
												      <option value="">--Select Rating--</option>
												      <option value="1" <c:if test="${user.rating eq '1' }">selected</c:if>>1</option>
												      <option value="2" <c:if test="${user.rating eq '2' }">selected</c:if>>2</option>
												      <option value="3" <c:if test="${user.rating eq '3' }">selected</c:if>>3</option>
												      <option value="4" <c:if test="${user.rating eq '4' }">selected</c:if>>4</option>
												      <option value="5" <c:if test="${user.rating eq '5' }">selected</c:if>>5</option>
												    </select>
												    <span id="ratingError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									          
									           <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">City</label>
									            <div class="col-sm-8 col-xs-8">
									              <select id="cityId" name="cityId" class="form-control chosen-select">
												      <option value="">--Select cityId--</option>
												      <c:forEach var="city" items="${cityList }">
												      		<option value="${city.cityId }" <c:if test="${user.cityId eq city.cityId }">selected</c:if>>${city.city }</option>
												      </c:forEach>
												    </select>
									            	<span id="cityIdError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									          
									          <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Zipcode</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="number" id="zipCode" name="zipCode" value="${user.zipCode }"   autocomplete="off" maxlength="6" class="form-control">
									              <span id="zipCodeError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div>
									          
									          <%-- <!-- Text input-->
									          <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Password Update Date</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="text" id="passwordUpdateDate" name="passwordUpdateDate" value="${user.passwordUpdateDate }" placeholder="Password Update Date" class="form-control">
									            	<span id="passwordUpdateDateError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									         </div>  --%>  	
									          
									          <!-- Text input-->
									         <%--  <div class="form-group">
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Tableau user ID</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="text" id="tableauUserId" name="tableauUserId" value="${user.tableauUserId }" placeholder="Tableau user ID" class="form-control">
									            	<span id="tableauUserIdError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									         </div>   
									         
									          <!-- Text input-->
									          <div class="form-group">  
									            <label class="col-sm-4 col-xs-4 control-label labelsize" for="textinput">Tableau password</label>
									            <div class="col-sm-8 col-xs-8">
									              <input type="text" id="tableauPassword" name="tableauPassword" value="${user.tableauPassword }"  placeholder="Tableau password" class="form-control">
									            	<span id="tableauPasswordError" style="color:#f27935!important;font-weight: 100!important;font-size: 11px!important;"></span>
									            </div>
									          </div> --%>					          
									        </fieldset>
									    </div><!-- /.col-lg-12 -->
									</div><!-- /.row -->
													
									<div class="row">
									  <div class="col-md-12 col-sm-12 col-xs-12">
			                    		<a href="users" class="btn btn-default modify"><i class="fa fa-arrow-left"></i>Back</a>
			                    		<c:if test="${createUser eq true}">	
											<button type="submit" class="btn btn-danger modify"><i class="fa fa-check-circle"></i>Create</button>
										</c:if>	
										<c:if test="${updateUser eq true}">	
											<button type="submit" class="btn btn-danger modify"><i class="fa fa-check-circle"></i>Update</button>
										</c:if>
									  </div>
									</div>
					                </form>
					                <div class="clearfix"></div>
					              </div>
					            </div>
					          </div>
		                  	
		                </div>
		              </div>
		            </div>
		          </div>
          
          
        
<!-- ------------------table data ------------------------------------------------------------------------------------>
          			
	                       
        </div>
        <!-- /page content -->
        
        
        
    	<div id="loadingImg" style="display: none;">
    		<div style="position: fixed; left: 0; top: 0; z-index: 202; background-color: rgba(0,0,0,0.5); width: 100%;Height: 100%;">
				<i class="fa fa-spinner fa-spin" style="font-size:48px;color:red; position:fixed; margin-top: -24px%;margin-left: -24px;top:50%;left: 50%;"></i>
			</div>
		</div>
        
     </div>
    </div>
    
   <%--  <jsp:include page="../layout/bottomNav.jsp"></jsp:include> --%>
   
    
    
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
    <script src=" /ircondcs/resources/js/chosen.jquery.js"></script>
    <script type="text/javascript" src=" /ircondcs/resources/js/jquery.validate.min.js"></script>
    <script src=" /ircondcs/resources/js/jquery.datetimepicker.full.min.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		var config = {
		      '.chosen-select'           : {},
		      '.chosen-select-deselect'  : {allow_single_deselect:true},
		      '.chosen-select-no-single' : {disable_search_threshold:10},
		      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
		      '.chosen-select-width'     : {width:"95%"}
		    }
		    for (var selector in config) {
		    	$(selector).chosen(config[selector]);
		    }
    		
    		/* $("#passwordUpdateDate").datetimepicker({
                timepicker:false,
                format:'d-m-Y',
                formatDate:'Y/m/d',
                minDate: '0' // minDate: '0'
              }); */
    		
    	});
	 
	  $(document).ready(function() {
			 $('#userForm').validate({
				 ignore: ":hidden:not(.chosen-select)",
			    rules: {
			     		"userName":{
			     			required:true
	                	},"mobileNumber":{
	                		required:true,
	                		digits:true
	                	},
	                	"emailId":{
			     			required:true,
			     			email:true
	                	},"address1":{
	                		required:true
	                	},
	                	"address2":{
			     			required:true
	                	},"cityId":{
	                		required:true
	                	},"zipCode":{
	                		required:true
	                	},
	                	"roleId":{
			     			required:true
	                	},
	                	"companyId":{
			     			required:true
	                	},"statusId":{
	                		required:true
	                	},
	                	"rating":{
			     			required:true
	                	},
	                	"password":{
			     			required:true
	                	},
	                	"passwordExpiryDays":{
			     			required:true
	                	}
			     	},
			    messages: {
			   			  "userName":{
			   			  	required:'User Name required'
			   			  },"mobileNumber":{
	                		required:'Mobile number required',
	                		digits:'Enter Only digits'
		                  },
		                	"emailId":{
				     			required:'Email required',
				     			email:'Invalid email'
		                	},"address1":{
		                		required:'Address1 required'
		                	},
		                	"address2":{
				     			required:'Address2 required'
		                	},"cityId":{
		                		required:'City required'
		                	},"zipCode":{
		                		required:'Zipcode required'
		                	},
		                	"roleId":{
				     			required:'Role required'
		                	},
		                	"companyId":{
				     			required:'Company required'
		                	},"statusId":{
		                		required:'Status required'
		                	},
		                	"rating":{
				     			required:'Rating required'
		                	},
		                	"password":{
				     			required:'Password required'
		                	},
		                	"passwordExpiryDays":{
				     			required:'PasswordExpiry Days required'
		                	}
			   	},errorPlacement:function(error, element){
			   		    if(element.attr("id") == "userName" ){
						 	document.getElementById("userNameError").innerHTML="";
						 	error.appendTo('#userNameError');
				        }else if (element.attr("id") == "mobileNumber" ){
						 	document.getElementById("mobileNumberError").innerHTML="";
						 	error.appendTo('#mobileNumberError');
			            }else if(element.attr("id") == "emailId" ){
							document.getElementById("emailIdError").innerHTML="";
							error.appendTo('#emailIdError');
				        }else if (element.attr("id") == "address1" ){
						 	document.getElementById("address1Error").innerHTML="";
						 	error.appendTo('#address1Error');
			            }else if (element.attr("id") == "address2" ){
						 	document.getElementById("address2Error").innerHTML="";
						 	error.appendTo('#address2Error');
			            }else if(element.attr("id") == "cityId" ){
							document.getElementById("cityIdError").innerHTML="";
							error.appendTo('#cityIdError');
				        }else if (element.attr("id") == "zipCode" ){
						 	document.getElementById("zipCodeError").innerHTML="";
						 	error.appendTo('#zipCodeError');
			            }else if(element.attr("id") == "roleId" ){
							document.getElementById("roleIdError").innerHTML="";
							error.appendTo('#roleIdError');
				        }else if (element.attr("id") == "companyId" ){
						 	document.getElementById("companyIdError").innerHTML="";
						 	error.appendTo('#companyIdError');
			            }else if(element.attr("id") == "statusId" ){
							document.getElementById("statusIdError").innerHTML="";
							error.appendTo('#statusIdError');
				        }else if (element.attr("id") == "rating" ){
						 	document.getElementById("ratingError").innerHTML="";
						 	error.appendTo('#ratingError');
			            }else if (element.attr("id") == "password" ){
						 	document.getElementById("passwordError").innerHTML="";
						 	error.appendTo('#passwordError');
			            }else if (element.attr("id") == "passwordExpiryDays" ){
						 	document.getElementById("passwordExpiryDaysError").innerHTML="";
						 	error.appendTo('#passwordExpiryDaysError');
			            }else{
			            	error.insertAfter(element);
			            } 
				       
			    },submitHandler:function(form){
			    	form.submit();
			    }
			});   			  	
					
		 });
	    
	    
	</script>
    
    </body>
</html>
        