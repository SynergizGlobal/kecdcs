	
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
    <title>IRCON</title>  <link href="/ircondcs/resources/css/critical.min.css" rel='stylesheet' type='text/css'>
	
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
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 6px 10px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}
.dropdown:hover .dropdown-content {display: block;}
 .dropdown:hover .dropbtn {color: blue;text-decoration: underline;} 
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
								<div class="col-md-6 col-sm-6 col-xs-6 d-none d-md-block">

									<ol class="breadcrumb">
										<li><a href="documents?folderId=0&levelId=1">Home</a></li>
										<c:if test="${not empty breadCrumbMenu['1']}">
											<li><a
												href="documents?levelId=1&folderId=${breadCrumbMenu['1'].folderId}">${breadCrumbMenu['1'].levelId}
													${breadCrumbMenu['1'].levelDescription}</a></li>
										</c:if>
										<c:if test="${not empty breadCrumbMenu['2']}">
											<li><a
												href="documents?levelId=2&folderId=${breadCrumbMenu['2'].folderId}">${breadCrumbMenu['2'].levelId}
													${breadCrumbMenu['2'].levelDescription}</a></li>
										</c:if>
										<c:if test="${not empty breadCrumbMenu['3']}">
											<li><a
												href="documents?levelId=3&folderId=${breadCrumbMenu['3'].folderId}">${breadCrumbMenu['3'].levelId}
													${breadCrumbMenu['3'].levelDescription}</a></li>
										</c:if>
										<c:if test="${not empty breadCrumbMenu['4']}">
											<li><a
												href="documents?levelId=4&folderId=${breadCrumbMenu['4'].folderId}">${breadCrumbMenu['4'].levelId}
													${breadCrumbMenu['4'].levelDescription}</a></li>
										</c:if>

									</ol>

								</div>
								<div class="col-md-6 col-sm-6 col-xs-12 text-right">
									<c:if test="${folderId ne '0' }">
										<button type="button" onclick="showNewUploadDocument('<%=(String) session.getAttribute("USER_ID")%>')"
											class="btn btn-danger modify">Document Upload</button>
										<button type="button" onclick="showBulkUploadDocument()"
											class="btn btn-danger modify">Bulk Upload</button>
									</c:if>
										<button type="button"
											class="btn btn-danger modify"><a href="documentSearch" style="color: white;">Search</a></button>											
								</div>
							</div>
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
	              
	              <c:if test="${not empty success}">
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
		                
		                	
		                
		                
		                  <table id="datatable-users" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
		                    <thead style="color: white;background: #f27935;">
		                      <tr>
		                      	<th>Folder</th>
		                        <th>Title</th>
		                        <th>Document No.</th>
		                        <th>Document Type</th>
		              	    	<th>Tags</th>
		              	    	<th>Structure Type</th>
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
          
          <form action="" id="docForm" name="docForm" method="post" class="form-horizontal" role="form">
          </form>
          
        
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
    
    
    <form action="editFolder" name="getFolderForm" id="getFolderForm" method="post">	
          <input type="hidden" name="folderId" id="folderId" />
          <input type="hidden" name="createUser" id="createUser" />
    </form>
     
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
			getDocsList();
    	});
    	
	    function downloadAttachment(docId){
	    	var docName = "";
  	    	var params = {docId:docId};
  	    	$("#loadingImg").show();
  			$.ajax({url : "<%=request.getContextPath()%>/getDocumentName",type:'post',data:params,success : function(data){
  				if($.trim(data) != ''){
  					docName = data;
  				} 
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
  	        }});
	    	
	    	$.ajax({
	    	    url: '<%=request.getContextPath()%>/downloadAttachment?docId='+docId,
	    	    data: {val: docId},
	    	    xhrFields: { 
	    	        responseType: 'blob'
	    	      },
	    	      success: function(blob){
	    	    	  $("#loadingImg").hide();
	    	          var link=document.createElement('a');
	    	          link.href=window.URL.createObjectURL(blob);
	    	          link.download=""+docName;
	    	          link.click();
	    	      },error: function (jqXHR, exception) {
	    				$("#loadingImg").hide();
	      	            getErrorMessage(jqXHR, exception);
	    	}});	    
		}

	    function getDocsList(){
			$('#datatable-users').dataTable().fnClearTable();
 			$('#datatable-users').dataTable().fnDestroy();
			var table = $('#datatable-users').DataTable({"order": [[ 0, "desc" ]]}).rows().remove().draw();
			$("#loadingImg").show();
			$.ajax({url : "<%=request.getContextPath()%>/getDocumentList",success : function(data){
				if(data != null && data != ''){
	            	$.each(data.documentList,function(key,val){
	            		var lblBreadCrumbTxt = val.l1_folder_id_val;
	  					if(val.l2_folder_id_val != null) {
	  						var folder2 = data.parentFolders.find( ({folderId}) => folderId === val.l2_folder_id_fk);
		  					var level2Id = folder2 != null ? folder2.levelId : "";
	  						lblBreadCrumbTxt = lblBreadCrumbTxt + " > " + level2Id + " "+ val.l2_folder_id_val;
	  					} 
	  					if(val.l3_folder_id_val != null) {
	  						var folder3 = data.parentFolders.find( ({folderId}) => folderId === val.l3_folder_id_fk);
		  					var level3Id = folder3 != null ? folder3.levelId : "";
	  						lblBreadCrumbTxt = lblBreadCrumbTxt + " > "  + level3Id + " "+  val.l3_folder_id_val;
	  					} 
	  					if(val.l4_folder_id_val != null) {
	  						var folder4 = data.parentFolders.find( ({folderId}) => folderId === val.l4_folder_id_fk);
		  					var level4Id = folder4 != null ? folder4.levelId : "";
	  						lblBreadCrumbTxt = lblBreadCrumbTxt + " > " +  level4Id + " "+ val.l4_folder_id_val;
	  					}
	  					
                        table.row.add( [
                        		lblBreadCrumbTxt,
                        		val.title,
                        		val.document_no,
                        		val.documentTypeVal,
                        		val.tagsVal,
                        		val.structureTypeVal,
					            '<a href="#" onClick="downloadAttachment('+val.document_id+')" class="btn btn-default modify">Download</a>'
					        ] ).draw( false );
	                        
					});
					$("#loadingImg").hide();
				}else{
					$("#loadingImg").hide();
				}
				
			},error: function (jqXHR, exception) {
				$("#loadingImg").hide();
	           // getErrorMessage(jqXHR, exception);
	        }});
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
	  
	    
	</script>
    
    </body>
</html>
        