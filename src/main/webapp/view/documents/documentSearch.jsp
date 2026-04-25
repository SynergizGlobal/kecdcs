
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
										<!-- <li><a href="documents?folderId=0&levelId=1">Home</a></li> -->
										 <c:if test="${DOC_SEARCH_TYPE eq 'C' }">
											<li><a href="corresDocumentSearch">Home > Correspondance</a></li>
										</c:if>
										<c:if test="${DOC_SEARCH_TYPE eq 'D' }">
											<li><a href="drawingsDocumentSearch">Home > Drawings</a></li>
										</c:if>	
										<c:if test="${DOC_SEARCH_TYPE eq 'A' }">
											<li><a href="documentSearch">Home > Other Documents</a></li>
										</c:if>		
										<c:if test="${DOC_SEARCH_TYPE eq 'F' }">
											<li><a href="documents?folderId=0&levelId=1">Home</a></li>
										</c:if>	
										
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
								<div class="col-md-8 col-sm-8 col-xs-12 text-right">
									<button type="button" onclick="showNewUploadDocument('<%=(String) session.getAttribute("USER_ID")%>')"
										class="btn btn-danger modify">Document Upload</button>
									<button type="button" class="btn btn-danger modify" <c:if test="${DOC_SEARCH_TYPE eq 'F'}">  style="background-color: #171616;"</c:if>>
										<a href="documents?folderId=0&levelId=1" style="color: white;">Folders</a>
									</button>
									<button type="button" class="btn btn-danger modify" <c:if test="${DOC_SEARCH_TYPE eq 'A'}">  style="background-color: #171616;"</c:if>>
										<a href="documentSearch" style="color: white;" >Other Documents</a>
									</button>
									<button type="button" class="btn btn-danger modify" <c:if test="${DOC_SEARCH_TYPE eq 'D'}">  style="background-color: #171616;"</c:if>>
										<a href="drawingsDocumentSearch" style="color: white;">Drawings</a>
									</button>
									<button type="button" class="btn btn-danger modify" <c:if test="${DOC_SEARCH_TYPE eq 'C'}">  style="background-color: #171616;"</c:if>>
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


				<!-- ------------------table data ------------------------------------------------------------------------------------>

				<div class="clearfix"></div>
				
				<div class="row" style="margin-bottom: 20px;">
				
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
						
						<!--  Search start -->
						<div id="level1SearchDiv" class="col-md-2 col-sm-2 col-xs-6">
						<fieldset>
								<div class="form-group">
									<label class="col-sm-8 col-xs-8 control-label labelsize"
										for="level1search">Folder level 1</label>
									<div class="col-sm-10 col-xs-10">
										<select id="l1_folder_id_search_fk" name="l1_folder_id_search_fk"
											class="form-control chosen-select"
											onchange="getSearchFoldersForLevel('l1_folder_id_search_fk','l2_folder_id_search_fk','2');getDocsList()">
											<option value="0">--Select Level--</option>
											<c:forEach var="level" items="${Level1Ids }">
												<option value="${level.folderId }">${level.levelDescription }</option>
											</c:forEach>
										</select> <span id="level1IdError"
											style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
									</div>
								</div>
						</fieldset>
						</div>
								<!-- Text input-->
						<div id="level2SearchDiv"  class="col-md-2 col-sm-2 col-xs-6">								
						<fieldset>								
								<div class="form-group">
									<label class="col-sm-10 col-xs-10 control-label labelsize"
										for="level2search">Folder level 2</label>
									<div class="col-sm-10 col-xs-10">
										<select id="l2_folder_id_search_fk" name="l2_folder_id_search_fk"
											class="form-control chosen-select"
											onchange="getSearchFoldersForLevel('l2_folder_id_search_fk','l3_folder_id_search_fk','3');getDocsList()">
											<option value="0">--Select Level--</option>
											<c:forEach var="level" items="${Level2Ids }">
												<option value="${level.folderId }">${level.levelDescription }</option>
											</c:forEach>
											
										</select> <span id="level2IdError"
											style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
									</div>
								</div>
						</fieldset>
						</div>
						
						<div id="level3SearchDiv"  class="col-md-2 col-sm-2 col-xs-6">
							<fieldset>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-10 col-xs-10 control-label labelsize"
											for="level3search">Folder level 3</label>
										<div class="col-sm-10 col-xs-10">
											<select id="l3_folder_id_search_fk" name="l3_folder_id_search_fk"
												class="form-control chosen-select"
												onchange="getSearchFoldersForLevel('l3_folder_id_search_fk','l4_folder_id_search_fk','4');getDocsList()">
												<option value="0">--Select Level--</option>
												<c:forEach var="level" items="${Level3Ids }">
													<option value="${level.folderId }">${level.levelDescription }</option>
												</c:forEach>
											</select> <span id="level3IdError"
												style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
										</div>
									</div>
							</fieldset>		
						</div>				
						<div class="col-md-2 col-sm-2 col-xs-6">
							<fieldset>
								<div class="form-group">
									<label class="col-sm-8 col-xs-8 control-label labelsize"
										for="searchDocType">Document Type</label>
									<div class="col-sm-10 col-xs-10">
										<select id="document_type_search_fk" name="document_type_search_fk"
											class="form-control chosen-select" onchange="getDocsList();">
											<option value="0">--Select Document Type--</option>
											<c:forEach var="dataVal" items="${documentType }">
												<option value="${dataVal.key }">${dataVal.value }</option>
											</c:forEach>
										</select>									
									</div>
								</div>
							</fieldset>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-6">
							<fieldset>
								<div class="form-group">
									<label class="col-sm-8 col-xs-8 control-label labelsize"
										for="textinput">Structure Type</label>
									<div class="col-sm-10 col-xs-10">
										<select id="structure_type_search_fk" name="structure_type_search_fk"
											class="form-control chosen-select" onchange=";getDocsList();">
											<option value="0">--Select Structure Type--</option>
											<c:forEach var="dataVal" items="${structureType }">
												<option value="${dataVal.key }">${dataVal.value }</option>
											</c:forEach>
										</select>								
									</div>
								</div>
							</fieldset>
						</div>
						<div class="col-md-3 col-sm-2 col-xs-6">
							<fieldset>
								<div class="form-group">
									<label class="col-sm-8 col-xs-8 control-label labelsize"
										for="textinput">TAGS</label>
									<div class="col-sm-12 col-xs-12">
										<select id="tags_search_fk" name="tags_search_fk" multiple="multiple"
											class="form-control chosen-select" onchange=";getDocsList();">
											<option value="0">--Select Tag Type--</option>
											<c:forEach var="dataVal" items="${tagsType }">
												<option value="${dataVal.key }">${dataVal.value }</option>
											</c:forEach>
										</select>									
									</div>
								</div>
							</fieldset>	
						</div>
						
						<div class="col-md-1 col-sm-2 col-xs-6">
							<fieldset>
								<div class="form-group">
								</br>	<button type="button" class="btn btn-danger modify">
										<a href="corresDocumentSearch" style="color: white;" >Clear Filter</a>
									</button>
									<!-- <button type="button" class="btn btn-danger modify">
										<a href="#" onclick="getDocsList()" style="color: white;" >Search</a>
									</button>	 -->							
			                	</div>
							</fieldset>
						</div>
					</div>
				</div>
		                <!--  Search start -->
		                
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								                
							<div class="x_content">
								<table id="datatable-documents"
									class="table table-striped table-bordered dt-responsive"
									cellspacing="0" width="100%">
									<thead style="color: white; background: #1B3D8F;">
										<tr>
											<th style="min-width: 25%"><label>Folder</label></th>
											<th style="min-width: 25%"><label>Title</label></th>
											<th><label for="tblDocNo">Document No.</label></th>
											<th><label for="tblDocType">Document Type</label></th>
											<th><label>Structure Type</label></th>
											<th><label>Date</label></th>
											<th style="width: 3%" data-orderable="false"><label style="text-align: center;">Action</label></th>
										</tr>
									</thead>
									<tbody id="documentsTable">
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>

				<form action="" id="docForm" name="docForm" method="post"
					class="form-horizontal" role="form"></form>


				<!-- ------------------table data ------------------------------------------------------------------------------------>



			</div>
			<!-- /page content -->

			<!--  Model Starts -->

			<div id="viewPreviewModal" class="modal fade bs-example-modal-sm"
				tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-lg ">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Document Preview</h4>
						</div>
						<form action="docViewForm" id="docViewForm" name="docViewForm"
							method="post" class="form-horizontal" role="form">
							<div class="modal-body">
								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<iframe id="displayFrame" name="displayFrame" src=""
											width="800" height="500"></iframe>
									</div>
									<input type="hidden" id="document_id" name="document_id" />
								</div>
							</div>
							<div class="modal-footer"></div>
						</form>
					</div>
				</div>
			</div>

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
	      
		});
		
		$('document').ready(function() {
			$('textarea').each(function() {
				$(this).val($(this).val().trim());
			});
		});

		function viewAttachment(docId){
 	    		$('#viewPreviewModal').modal('show');
 	    		$('#docViewForm')[0].reset();
 	    		document.getElementById("displayFrame").src = "";
  	    	var params = {docId:docId};
  	    	$("#loadingImg").show();
  			$.ajax({url : "<%=request.getContextPath()%>/viewAttachment",type:'post',data:params,success : function(data){
  				if($.trim(data) != ''){
	        		var encodedUrl = encodeURIComponent(data);
	        		document.getElementById("displayFrame").src = "https://docs.google.com/viewer?embedded=true&url="+ encodedUrl;
  					$("#loadingImg").hide();
  				}else{
  					$("#loadingImg").hide();
  				}
  				
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
  	        }});
 	  		}
          </script>

			<script type="text/javascript">
					function printDocument(docId){
			  	    	var params = {docId:docId};
			  	    	$("#loadingImg").show();
			  			$.ajax({url : "<%=request.getContextPath()%>/printDocument",type:'post',data:params,success : function(data){
			  				if($.trim(data) != ''){
			  					$("#loadingImg").hide();
			  				}else{
			  					$("#loadingImg").hide();
			  				}
			  				
			  			},error: function (jqXHR, exception) {
			  				$("#loadingImg").hide();
			  	            getErrorMessage(jqXHR, exception);
			  	        }});
		  	  		}
	            </script>

			<div id="showMoveDocumentModal"
				class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg ">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Move Document</h4>
						</div>
						<form action="moveDocument" id="docMovForm" name="docMovForm"
							method="post" class="form-horizontal" role="form">
							<div class="modal-body">

								<div class="col-md-8 col-sm-8 col-xs-12">
									<fieldset>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Title</label>
											<div class="col-sm-8 col-xs-8">
												<label
													class="col-sm-8 col-xs-8 control-label-left labelsize"
													for="docName"></label>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Folder Level 1<sup style='color: #FF0000'>*</sup></label>
											<div class="col-sm-8 col-xs-8">
												<select id="l1_folder_id_fk" name="l1_folder_id_fk"
													class="form-control chosen-select" 
													onchange="getFoldersForLevel('l1_folder_id_fk','l2_folder_id_fk')">
													<option value="0">--Select Level--</option>
													<c:forEach var="level" items="${Level1Ids }">
														<option value="${level.folderId }">${level.levelDescription }</option>
													</c:forEach>
												</select> <span id="level1IdError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Folder Level 2</label>
											<div class="col-sm-8 col-xs-8">
												<select id="l2_folder_id_fk" name="l2_folder_id_fk"
													class="form-control chosen-select"
													onchange="getFoldersForLevel('l2_folder_id_fk','l3_folder_id_fk')">
													<option value="0">--Select Level--</option>
												</select> <span id="level2IdError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Folder Level 3</label>
											<div class="col-sm-8 col-xs-8">
												<select id="l3_folder_id_fk" name="l3_folder_id_fk"
													class="form-control chosen-select"
													onchange="getFoldersForLevel('l3_folder_id_fk','l4_folder_id_fk')">
													<option value="0">--Select Level--</option>
												</select> <span id="level3IdError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Folder Level 4</label>
											<div class="col-sm-8 col-xs-8">
												<select id="l4_folder_id_fk" name="l4_folder_id_fk"
													class="form-control chosen-select">
													<option value="0">--Select Level--</option>
												</select> <span id="level4IdError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-12 col-xs-12"></div>
										</div>

									</fieldset>
								</div>
								<input type="hidden" id="moveDocId" name="docId" />
								<input type="hidden" id="appFlow" name="appFlow" value="docSearch"/>
								<div class="row">
									<div class="col-md-8 col-sm-8 col-xs-12">
										<fieldset>
											<a href="#"
												onclick="modalDialogClose('showMoveDocumentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
											<button type="submit" class="btn btn-danger modify">
												<i class="fa fa-check-circle"></i>Move
											</button>
										</fieldset>
									</div>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
					function showMoveDocument(docId, userId){
		  	    		$('#showMoveDocumentModal').modal('show');
		  	    		$('#docMovForm')[0].reset();
		  	    		moveFormReset();
			  	    	var params = {docId:docId,userId:userId};
			  	    	$("#loadingImg").show();
			  			$.ajax({url : "<%=request.getContextPath()%>/showMoveDocument",type:'post',data:params,success : function(data){
			  				if($.trim(data) != ''){
			  					$("label[for='docName']").text(data.documentUpload.title);
			  					$("#moveDocId").val(data.documentUpload.document_id);
			  					loadFolderSelectBox('l1_folder_id_fk',data.parentFolders);
			  					$("#loadingImg").hide();
			  				}else{
			  					$("#loadingImg").hide();
			  				}
			  			},error: function (jqXHR, exception) {
			  				$("#loadingImg").hide();
			  	            getErrorMessage(jqXHR, exception);
		  	        	}});
		  	  		}
					
					function moveFormReset(){
						document.getElementById("level1IdError").innerHTML="";
					 	$("label[for='l1_folder_id_fk']").text("");
					}
					
					function loadFolderSelectBox(child, valFolder){
						var options = "";
		   		    	options = options + '<option value="0" >--Select Level--</option>';
		   		    	$.each(valFolder,function(key,val){
		   		    		options = options + '<option value='+val.folderId+' >'+val.levelDescription+'</option>'
		   		    	});
		   		    	$("#l1_folder_id_fk").empty();
		   		    	$("#l1_folder_id_fk").append(options);	
		   		    	/* $('.searchable').select2(); */
		   		    	$("#l1_folder_id_fk").trigger("chosen:updated");
					}
					
					function getFoldersForLevel(parent, child){
						 var folderId = $("#"+parent).val();
						 var myParams = {folderId:folderId};
			 	 		$.ajax({
							type: "POST",
				   		    dataType : 'json',
				   		 	data:myParams,
							url : "./getFoldersForLevel",
				   		    success : function(result){
				   		    	var options = "";
				   		    	options = options + '<option value="" >--Select Level--</option>';
				   		    	$.each(result,function(key,val){
				   		    		options = options + '<option value='+val.folderId+' >'+val.levelDescription+'</option>'
				   		    	});
				   		    	$("#"+child).empty();
				   		    	$("#"+child).append(options);
				   		    	/* $('.searchable').select2(); */
				   		    	$("#"+child).trigger("chosen:updated");
							},error: function (jqXHR, exception) {
								alert(exception);
					            getErrorMessage(jqXHR, exception);
					        }
						});
				   	}
					
					function getFoldersForLevelUsingParantValue(parentVal, child){
						 var folderId = parentVal;
						 var myParams = {folderId:folderId};
			 	 		$.ajax({
							type: "POST",
				   		    dataType : 'json',
				   		 	data:myParams,
							url : "./getFoldersForLevel",
				   		    success : function(result){
				   		    	var options = "";
				   		    	options = options + '<option value="0" >--Select Level--</option>';
				   		    	$.each(result,function(key,val){
				   		    		options = options + '<option value='+val.folderId+' >'+val.levelDescription+'</option>'
				   		    	});
				   		    	$("#"+child).empty();
				   		    	$("#"+child).append(options);
				   		    	/* $('.searchable').select2(); */
				   		    	$("#"+child).trigger("chosen:updated");
							},error: function (jqXHR, exception) {
								alert(exception);
					            getErrorMessage(jqXHR, exception);
					        }
						});
				   	}
					
					function getSearchFoldersForLevel(parent, child, level){
						var rootFolder='${curFolder}';
						if(level == '3'){
							$("#l3_folder_id_search_fk").val('0');
						}
						if(level == '2'){
							$("#l2_folder_id_search_fk").val('0');
						}						
						 var folderId = $("#"+parent).val();
						 var myParams = {folderId:folderId, level:level, rootFolder: rootFolder};
			 	 		$.ajax({
							type: "POST",
				   		    dataType : 'json',
				   		 	data:myParams,
							url : "./getSearchFoldersForLevel",
				   		    success : function(result){
				   		    	var options = "";
				   		    	options = options + '<option value="0" >--Select Level--</option>';
				   		    	$.each(result,function(key,val){
				   		    		options = options + '<option value='+val.folderId+' >'+val.levelDescription+'</option>'
				   		    	});
				   		    	$("#"+child).empty();
				   		    	$("#"+child).append(options);
				   		    	/* $('.searchable').select2(); */
				   		    	$("#"+child).trigger("chosen:updated");
							},error: function (jqXHR, exception) {
								alert(exception);
					            getErrorMessage(jqXHR, exception);
					        }
						});
				   	}
					
					function getLevel2Folders(parentVal, child){
						 var folderId = parentVal;
						 var myParams = {folderId:folderId};
			 	 		$.ajax({
							type: "POST",
				   		    dataType : 'json',
				   		 	data:myParams,
							url : "./getLevel2Folders",
				   		    success : function(result){
				   		    	var options = "";
				   		    	options = options + '<option value="0" >--Select Level--</option>';
				   		    	$.each(result,function(key,val){
				   		    		options = options + '<option value='+val.folderId+' >'+val.levelDescription+'</option>'
				   		    	});
				   		    	$("#"+child).empty();
				   		    	$("#"+child).append(options);
				   		    	/* $('.searchable').select2(); */
				   		    	$("#"+child).trigger("chosen:updated");
							},error: function (jqXHR, exception) {
								alert(exception);
					            getErrorMessage(jqXHR, exception);
					        }
						});
				   	}
					
				  $(document).ready(function() {
					   $('#docMovForm').validate({
							ignore: ":hidden:not(.chosen-select)",
						    rules: {
						     		"l1_folder_id_fk":{
				                		required:true,
				                		minStrict: 2,
				                	    number: true
				                	} 
						     	},
						    messages: {
			                	"l1_folder_id_fk":{
					     			required:'Level 1 required'
			        			}
						   	}, errorPlacement:function(error, element){
						   		    if (element.attr("id") == "l1_folder_id_fk" ){
									 	document.getElementById("level1IdError").innerHTML="";
									 	error.appendTo('#level1IdError');
						            }else{
						            	error.insertAfter(element);
						            } 
							       
						    },submitHandler:function(form){
						    	form.submit();
						    }
						});   			  	
								
					 });
					
				  $.validator.addMethod('minStrict', function (value, el, param) {
					  //alert(value +","+ param);
					    return value > param;
					});
	            </script>


			<div id="showEmailAttachmentModal"
				class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg ">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Email Document</h4>
						</div>
						<form action="sendMailFromSearch" id="docSendMailForm"
							name="docSendMailForm" method="post" class="form-horizontal"
							role="form">
							<div class="modal-body">

								<div class="col-md-8 col-sm-8 col-xs-12">
									<fieldset>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Title</label>
											<div class="col-sm-8 col-xs-8">
												<label
													class="col-sm-8 col-xs-8 control-label-left labelsize"
													for="docName"></label>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">To</label>
											<div class="col-sm-8 col-xs-8">
												<input type="text" id="toAddress" name="toAddress"
													value="${mailDetails.toAddress }" autocomplete="off"
													maxlength="100" class="form-control"> <span
													id="toAddressError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">CC</label>
											<div class="col-sm-8 col-xs-8">
												<input type="text" id="ccAddress" name="ccAddress"
													value="${mailDetails.ccAddress }" autocomplete="off"
													maxlength="100" class="form-control">
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Subject</label>
											<div class="col-sm-8 col-xs-8">
												<input type="text" id="subject" name="subject"
													value="${mailDetails.subject }" autocomplete="off"
													maxlength="100" class="form-control"> <span
													id="subjectError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Description</label>
											<div class="col-sm-8 col-xs-8">
												<textarea id="message" name="message" rows="5" cols="132"
													class="form-control">
														</textarea>
												<span id="messageError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

									</fieldset>
								</div>
								<div class="row">
									<div class="col-md-8 col-sm-8 col-xs-12">
										<fieldset>
											<a href="#"
												onclick="modalDialogClose('showEmailAttachmentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
											<button type="submit" class="btn btn-danger modify">
												<i class="fa fa-check-circle"></i>Send
											</button>
										</fieldset>
									</div>
								</div>
								<input type="hidden" id="emailDocId" name="docId" />
							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
						function showEmailAttachment(docId, userId){
			  	    		$('#showEmailAttachmentModal').modal('show');
			  	    		$('#docSendMailForm')[0].reset();
			  	    		sendMailFormReset();
				  	    	var params = {docId:docId,userId:userId};
				  	    	$("#loadingImg").show();
				  			$.ajax({url : "<%=request.getContextPath()%>/showEmailAttachment",type:'post',data:params,success : function(data){
				  				if($.trim(data) != ''){
				  					$("label[for='docName']").text(data.documentUpload.title);
				  					$("#emailDocId").val(data.documentUpload.document_id);
				  					$("#loadingImg").hide();
				  				}else{
				  					$("#loadingImg").hide();
				  				}
				  				
				  			},error: function (jqXHR, exception) {
				  				$("#loadingImg").hide();
				  	            getErrorMessage(jqXHR, exception);
			  	        	}});
			  	  		}
						
						function sendMailFormReset(){
							try {
								$("#toAddress").val("");
								$("#subject").val("");
								$("#message").val("");
								$("#ccAddress").val("");
							} catch (e){} 
														
							document.getElementById("toAddressError").innerHTML="";
						 	document.getElementById("subjectError").innerHTML="";
						 	document.getElementById("messageError").innerHTML="";
						 	$("label[for='toAddress']").text("");
						 	$("label[for='subject']").text("");
						 	$("label[for='message']").text("");
						}
						
						  $(document).ready(function() {
							   $('#docSendMailForm').validate({
									ignore: ":hidden:not(.chosen-select)",
								    rules: {
								     		"toAddress":{
						                		required:true
								     		},
								     		"subject":{
						                		required:true
						                	},
								     		"message":{
						                		required:true
						                	}
								     		
								     	},
								    messages: {
					                	"toAddress":{
							     			required:'Address required'
							     		},
							     		"subject":{
							     			required:'Subject required'
					                	},
							     		"message":{
							     			required:'Message Required'
					                	}
								   	}, errorPlacement:function(error, element){
								   		    if (element.attr("id") == "toAddress" ){
											 	document.getElementById("toAddressError").innerHTML="";
											 	error.appendTo('#toAddressError');
								   		    } else if (element.attr("id") == "subject" ){
												 	document.getElementById("subjectError").innerHTML="";
												 	error.appendTo('#subjectError');
								   		    } else if (element.attr("id") == "message" ){
											 	document.getElementById("messageError").innerHTML="";
											 	error.appendTo('#messageError');
									        }else{
								            	error.insertAfter(element);
								            } 
									       
								    },submitHandler:function(form){
								    	form.submit();
								    }
								});   			  	
										
							 });
						
					</script>

			<div id="showShareDocumentModal"
				class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg ">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Share Document</h4>
						</div>
						<form action="shareDocument" id="docShareForm" name="docShareForm"
							method="post" class="form-horizontal" role="form">
							<div class="modal-body">

								<div class="col-md-8 col-sm-8 col-xs-12">
									<fieldset>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Title</label>
											<div class="col-sm-8 col-xs-8">
												<label
													class="col-sm-8 col-xs-8 control-label-left labelsize"
													for="docName"></label>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">To</label>
											<div class="col-sm-8 col-xs-8">
												<select id="user_id_fk" name="user_id_fk"
													class="form-control  chosen-select">
												</select>
											</div>
										</div>

									</fieldset>
								</div>
								<div class="row">
									<div class="col-md-8 col-sm-8 col-xs-12">
										<fieldset>
											<a href="#"
												onclick="modalDialogClose('showShareDocumentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
											<button type="submit" class="btn btn-danger modify">
												<i class="fa fa-check-circle"></i>Share
											</button>
										</fieldset>
									</div>

									<input type="hidden" id="shareDocId" name="docId" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
						function showShareDocument(docId, userId){
			  	    		$('#showShareDocumentModal').modal('show');
			  	    		$('#docShareForm')[0].reset();
				  	    	var params = {docId:docId,userId:userId};
				  	    	$("#loadingImg").show();
				  			$.ajax({url : "<%=request.getContextPath()%>/showShareDocument",type:'post',data:params,success : function(data){
				  				if($.trim(data) != ''){
				  					$("label[for='docName']").text(data.documentUpload.title);
				  					$("#shareDocId").val(data.documentUpload.document_id);
				  					loadUserSelectBox('user_id_fk', data.users);
				  					$("#loadingImg").hide();
				  				}else{
				  					$("#loadingImg").hide();
				  				}
				  				
				  			},error: function (jqXHR, exception) {
				  				$("#loadingImg").hide();
				  	            getErrorMessage(jqXHR, exception);
			  	        	}});
			  	  		}
						function loadUserSelectBox(child, valFolder){
							var options = "";
			   		    	options = options + '<option value="0" >--Select User--</option>';
			   		    	$.each(valFolder,function(key,val){
			   		    		options = options + '<option value='+val.userId+' >'+val.userName+'</option>'
			   		    	});
			   		    	$("#"+child).empty();
			   		    	$("#"+child).append(options);		
			   		    	/* $('.searchable').select2(); */
			   		    	$("#"+child).trigger("chosen:updated");
						}
						
						  $(document).ready(function() {
							   $('#docShareForm').validate({
									ignore: ":hidden:not(.chosen-select)",
								    rules: {
								     		"user_id_fk":{
						                		required:true,
						                		minStrict: 2,
						                	    number: true
						                	} 
								     	},
								    messages: {
					                	"user_id_fk":{
							     			required:'User required'
					        			}
								   	}, errorPlacement:function(error, element){
								   		    if (element.attr("id") == "user_id_fk" ){
											 	document.getElementById("user_id_fkError").innerHTML="";
											 	error.appendTo('#user_id_fkError');
								            }else{
								            	error.insertAfter(element);
								            } 
									       
								    },submitHandler:function(form){
								    	form.submit();
								    }
								});   			  	
										
							 });
						
					</script>

			<div id="showDocumentModal" class="modal fade bs-example-modal-sm"
				tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-lg ">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Document</h4>
						</div>
						<form action="viewDocument" id="docViewForm" name="docViewForm"
							method="post" class="form-horizontal" role="form">
							<div class="modal-body">

								<div class="col-md-6 col-sm-6 col-xs-12">
									<fieldset>

										<!-- Text input-->

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Folder</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="detailsFolder"></label>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="document_no_lbl">Document Number</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="document_no_val"></label>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Title</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="title"></label>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Owner</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="owner_user_id_fk"></label>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Approver</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="userName"></label>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Date Modified</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="modified_date"></label>
										</div>

									</fieldset>

								</div>
								<!-- /.col-lg-12 -->


								<div class="col-md-6 col-sm-6 col-xs-12">
									<fieldset>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Document Type</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="document_type_fk"></label>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">TAGS</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="tags_fk"></label>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Structure Type</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="structure_type_fk"></label>
										</div>

										<!-- Text input-->
										<div class="form-group" id="versionNoDiv">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="versionNumberLbl">Version Number</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="version_number"></label>
										</div>

										<div class="form-group" id="subjectDiv">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="subjectLbl">Subject</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="subjectUpload"></label>
										</div>

										<!-- <div class="form-group" id="refNoDiv">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="revisonNumberLbl">Reference Number</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="reference_no"></label>
										</div> -->

										<!-- Text input-->
										<!-- <div class="form-group">
									<label class="col-sm-4 col-xs-4 control-label labelsize"
										for="textinput">Date Modified</label> <label
										class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
										for="modified_date"></label>
								</div> -->

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Location</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="location"></label>
										</div>

									</fieldset>
								</div>
								<!-- /.col-lg-12 -->

								<div class="row">
									<div class="col-md-8 col-sm-8 col-xs-12">
										<fieldset>
											<a href="#" onclick="modalDialogClose('showDocumentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
										</fieldset>
									</div>

									<input type="hidden" id="viewDocId" name="docId" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
						function showDocument(docId, userId){
			  	    		$('#showDocumentModal').modal('show');
			  	    		$('#docViewForm')[0].reset();
				  	    	var params = {docId:docId,userId:userId};
				  	    	$("#loadingImg").show();
				  			$.ajax({url : "<%=request.getContextPath()%>/showDocument",type:'post',
				  				
				  				data:params,success : function(data){
				  				if($.trim(data) != ''){
				  					$("label[for='title']").text(data.documentUpload.title);
				  					$("label[for='tags_fk']").text(data.documentUpload.tagsVal);
				  					$("label[for='document_type_fk']").text(data.documentUpload.documentTypeVal);
				  					$("label[for='location']").text(data.documentUpload.location);
				  					$("label[for='document_no_val']").text(data.documentUpload.document_no);
				  					
				  					/* $("label[for='owner_user_id_fk']").text(data.documentUpload.created_by); */
				  					var ownerUser = data.users.find( ({userId}) => userId === data.documentUpload.owner_user_id_fk);
				  					var ownerUserName = ownerUser != null ? ownerUser.userName : "";
				  					$("label[for='owner_user_id_fk']").text(ownerUserName);
				  					var approverUser = data.users.find( ({userId}) => userId === data.documentUpload.approver_user_id_fk);
				  					var approverUserName = approverUser != null ? approverUser.userName : "";
				  					/* $("label[for='userName']").text(data.documentUpload.created_by); */
				  					$("label[for='userName']").text(approverUserName);
				  					$("label[for='modified_date']").text(data.documentUpload.modified_date);
				  					$("label[for='approval_date']").text(data.documentUpload.approval_date);
				  					
				  					$("label[for='structure_type_fk']").text(data.documentUpload.structureTypeVal);
				  					
				  					var lblBreadCrumbTxt = data.documentUpload.l1_folder_id_val;
				  					if(data.documentUpload.l2_folder_id_val != null) {
				  						var folder2 = data.parentFolders.find( ({folderId}) => folderId === data.documentUpload.l2_folder_id_fk);
					  					var level2Id = folder2 != null ? folder2.levelId : "";
				  						lblBreadCrumbTxt = lblBreadCrumbTxt + " > " + level2Id + " "+ data.documentUpload.l2_folder_id_val;
				  					} 
				  					if(data.documentUpload.l3_folder_id_val != null) {
				  						var folder3 = data.parentFolders.find( ({folderId}) => folderId === data.documentUpload.l3_folder_id_fk);
					  					var level3Id = folder3 != null ? folder3.levelId : "";
				  						lblBreadCrumbTxt = lblBreadCrumbTxt + " > "  + level3Id + " "+  data.documentUpload.l3_folder_id_val;
				  					} 
				  					if(data.documentUpload.l4_folder_id_val != null) {
				  						var folder4 = data.parentFolders.find( ({folderId}) => folderId === data.documentUpload.l4_folder_id_fk);
					  					var level4Id = folder4 != null ? folder4.levelId : "";
				  						lblBreadCrumbTxt = lblBreadCrumbTxt + " > " +  level4Id + " "+ data.documentUpload.l4_folder_id_val;
				  					}
				  					$("label[for='detailsFolder']").text(lblBreadCrumbTxt);
				  					
				  					/* $("label[for='l1_folder_id_val']").text(data.documentUpload.l1_folder_id_val);
				  					$("label[for='l2_folder_id_val']").text(data.documentUpload.l2_folder_id_val);
				  					$("label[for='l3_folder_id_val']").text(data.documentUpload.l3_folder_id_val);
				  					$("label[for='l4_folder_id_val']").text(data.documentUpload.l4_folder_id_val); */
				  					
				  					$("#viewDocId").val(data.documentUpload.document_id);
				  					
				  					if(data.documentUpload.l1_folder_id_val.toLowerCase().includes("correspond")){
				  						$("label[for='reference_no']").text(data.documentUpload.reference_no);
				  						$("label[for='document_no_lbl']").text("Letter No");
				  						$("label[for='subjectUpload']").text(data.documentUpload.subject);
				  						
				  			  			//$("#refNoDiv").show();
				  			  			$("#versionNoDiv").hide();
				  			  			$("#subjectDiv").show();
				  			  		
				  					} else {
				  						$("label[for='version_number']").text(data.documentUpload.version_number);
				  						$("label[for='document_no_lbl']").text("Document Number");
				  			  			//$("#refNoDiv").hide();
				  			  			$("#versionNoDiv").show();
				  			  			$("#subjectDiv").hide();
				  					}
				  					$("#loadingImg").hide();
				  				}else{
				  					$("#loadingImg").hide();
				  				}
				  				
				  			},error: function (jqXHR, exception) {
				  				$("#loadingImg").hide();
				  	            getErrorMessage(jqXHR, exception);
			  	        	}});
				  			$("#loadingImg").hide();
			  	  		}
						function loadSelectBox(child, valFolder){
							var options = "";
			   		    	options = options + '<option value="0" >--Select User--</option>';
			   		    	$.each(valFolder,function(key,val){
			   		    		options = options + '<option value='+val.userId+' >'+val.userName+'</option>'
			   		    	});
			   		    	$("#"+child).empty();
			   		    	$("#"+child).append(options);		
			   		    	/* $('.searchable').select2(); */
			   		    	$("#"+child).trigger("chosen:updated");
						}
						
					</script>


			<div id="showRenameDocumentModal"
				class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg ">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Rename Document</h4>
						</div>
						<form action="renameDocument" id="docRenameForm"
							name="docRenameForm" method="post" class="form-horizontal"
							role="form">
							<div class="modal-body">

								<div class="col-md-8 col-sm-8 col-xs-12">
									<fieldset>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Title</label>
											<div class="col-sm-8 col-xs-8">
												<label
													class="col-sm-8 col-xs-8 control-label-left labelsize"
													for="title"></label>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">New Title</label>
											<div class="col-sm-8 col-xs-8">
												<input type="text" id="title" name="title" value=""
													autocomplete="off" maxlength="98" class="form-control">
												<span id="titleRenameError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

									</fieldset>
								</div>
								<div class="row">
									<div class="col-md-8 col-sm-8 col-xs-12">
										<fieldset>
											<a href="#"
												onclick="modalDialogClose('showRenameDocumentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
											<button type="submit" class="btn btn-danger modify">
												<i class="fa fa-check-circle"></i>Rename
											</button>
										</fieldset>
									</div>
								</div>
								<input type="hidden" id="renameDocId" name="docId" />
							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
						function showRenameDocument(docId, userId){
			  	    		$('#showRenameDocumentModal').modal('show');
			  	    		$('#docRenameForm')[0].reset();
				  	    	var params = {docId:docId,userId:userId};
				  	    	$("#loadingImg").show();
				  			$.ajax({url : "<%=request.getContextPath()%>/showRenameDocument",type:'post',data:params,success : function(data){
				  				if($.trim(data) != ''){
				  					$("label[for='title']").text(data.documentUpload.title);
				  					$("label[for='docName']").text(data.documentUpload.document_name);
				  					$("#renameDocId").val(data.documentUpload.document_id);
				  					$("#loadingImg").hide();
				  				}else{
				  					$("#loadingImg").hide();
				  				}
				  				
				  			},error: function (jqXHR, exception) {
				  				$("#loadingImg").hide();
				  	            getErrorMessage(jqXHR, exception);
			  	        	}});
			  	  		}
						  $(document).ready(function() {
							   $('#renameDocument').validate({
									ignore: ":hidden:not(.chosen-select)",
								    rules: {
								     		"title":{
						                		required:true
								     		}
								     	},
								    messages: {
					                	"title":{
							     			required:'Title required'
							     		}
								   	}, errorPlacement:function(error, element){
								   		    if (element.attr("id") == "title" ){
											 	document.getElementById("titleRenameError").innerHTML="";
											 	error.appendTo('#titleRenameError');
								   		    }else{
								            	error.insertAfter(element);
								            } 
									       
								    },submitHandler:function(form){
								    	form.submit();
								    }
								});   			  	
										
							 });
						
					</script>

			<div id="showRevisionDocumentModal"
				class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg ">
					<div class="modal-content"  style="overflow-y: scroll;height: 400px;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Document Correspondence</h4>
						</div>
						<form id="docRevisionForm" name="docRevisionForm" method="post"
							class="form-horizontal" role="form">
							<div class="modal-body">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="x_panel">
										<div class="x_content">
											<table id="datatable-revisions"
												class="table table-striped table-bordered dt-responsive"
												style="width: 100%">
												<thead style="color: white; background: #1B3D8F;">
													<tr>
														<th>Folder</th>
														<th>Title</th>
														<th>Document Number</th>
														<th>Created Date</th>
														<th>Download</th>
													</tr>
												</thead>
												<tbody id="revisionsTable">
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<fieldset>
											<a href="#"
												onclick="modalDialogClose('showRevisionDocumentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
										</fieldset>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
					    function showDocumentTracks(docId,userId){
			  	    		$('#showRevisionDocumentModal').modal('show');
			  	    		$('#docRevisionForm')[0].reset();
							$('#datatable-revisions').dataTable().fnClearTable();
				 			$('#datatable-revisions').dataTable().fnDestroy();
							var table = $('#datatable-revisions').DataTable({"order": [[ 0, "desc" ]], "pageLength": 10,  "lengthMenu": [[5, 10], [5, 10]] }).rows().remove().draw();
							$("#loadingImg").show();
							$.ajax({url : "<%=request.getContextPath()%>/getCorrespondenceTracks?docId="+docId+"&userId="+userId,success : function(data){
								if(data != null && data != ''){
					            	$.each(data.versionOrRevisions,function(key,val){
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
									            val.modifiedTS,
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
					</script>

			<div id="showVersionsDocumentModal"
				class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg ">
					<div class="modal-content" style="overflow-y: scroll;height: 500px;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Document Versions</h4>
						</div>
						<form action="newVersionDocumentUpload" id="docVersionForm"
							name="docVersionForm" method="post" enctype="multipart/form-data"
							class="form-horizontal" role="form">
							<div class="modal-body">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<label
										class="col-sm-8 col-xs-8 .control-label-center labelsize"
										for="docVersionBreadCrumb">${breadCrumbTxt}</label>
										<div id="showVersionDiv1">
											<button type="button" onclick="addVersion()"
												class="btn btn-danger modify" style="float: right;">
												<i class="fa fa-check-circle"></i>Add Version
											</button>
										</div>										
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12" id="addVersionDiv">
									<fieldset>

										<div class="form-group">
											<label class="col-sm-2 col-xs-2 control-label-left labelsize"
												for="textinput">Title</label> <label
												class="col-sm-8 col-xs-8 control-label-left labelsize value-color"
												for="addVertitle">${documentUpload.title }</label>
										</div>

										<div class="form-group">
											<label class="col-sm-2 col-xs-2 control-label-left labelsize"
												for="addVversionNumber">Version Number</label>
											<div class="col-sm-8 col-xs-8">
												<input type="number" id="version_number_add"
													name="version_number" value="" autocomplete="off" min="1"  onblur="validateVersionNo(this.value)"
													maxlength="10" class="form-control"> <span
													id="version_numberAddError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-2 col-xs-2 control-label-left labelsize"
												for="textinput">Approver</label>
											<div class="col-sm-8 col-xs-8">
												<select id="verapprover_user_id_fk"
													name="approver_user_id_fk"
													class="form-control  chosen-select">
												</select> <span id="verapprover_user_id_fkError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 col-xs-2 control-label-left labelsize"
												for="textinput">Attach File</label>
											<div class="col-sm-8 col-xs-8">
												<input type="file" id="verAttachFile" name="attachFile"
													class="form-control"> <span id="verAttachFileError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

									</fieldset>
								</div>
								<div class="row" id="addVersionBtnDiv">
									<div class="col-md-8 col-sm-8 col-xs-8">
										<fieldset>
											<a href="#"
												onclick="modalDialogClose('showVersionsDocumentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
											<button type="submit" class="btn btn-danger modify">
												<i class="fa fa-check-circle"></i>Add
											</button>
										</fieldset>
									</div>
								</div>

								<div class="col-md-12 col-sm-12 col-xs-12" id="showVersionDiv">
									<div class="x_panel">
										<div class="x_content">
											<table id="datatable-version"
												class="table table-striped table-bordered dt-responsive "
												style="width: 100%">
												<thead style="color: white; background: #1B3D8F;">
													<tr>
														<th>Title</th>
														<th>Version Number</th>
														<th>Created By</th>
														<th>Created Date</th>
														<th>Status</th>
														<th>Option</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody id="versionTable">
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="row" id="showVersionBtnDiv">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<fieldset>
											<a href="#"
												onclick="versionModalDialogClose('showVersionsDocumentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
											<!-- <button type="button" onclick="addVersion()"
										class="btn btn-danger modify">
										<i class="fa fa-check-circle"></i>Add Version
									</button> -->
										</fieldset>
									</div>
								</div>
								<input type="hidden" id="appFlow" name="appFlow" value="docSearch"/>
								<input type="hidden" id="versionDocId" name="docId" />
								<input type="hidden" id="versionDocNo" name="docNo" />
							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				    	$(document).ready(function(){
				    		$("#addVersionDiv").hide();
				      		$("#addVersionBtnDiv").hide();
				    		
				    		$("#showVersionDiv").show();
				      		$("#showVersionBtnDiv").show();
				      		$("#showVersionDiv1").show();				      		
				    	});
				    	
				    	function addVersion(){
				    		sendDocVersionFormReset();
				    		$("#addVersionDiv").show();
				      		$("#addVersionBtnDiv").show();
				    		
				    		$("#showVersionDiv").hide();
				      		$("#showVersionBtnDiv").hide();
				      		$("#showVersionDiv1").hide();
				    	}
				    	
						 function versionModalDialogClose(dialogId){
							$("#"+dialogId).modal('hide');
						 }
				    	
						function showDocumentVersions(docId, userId, breadCrumbTxt, editable){
			  	    		$('#showVersionsDocumentModal').modal('show');
			  	    		$('#docVersionForm')[0].reset();
			  	    		sendDocVersionFormReset();
							$("#addVersionDiv").hide();
							
					      	$("#addVersionBtnDiv").hide();
					    		
					    	$("#showVersionDiv").show();
					      	$("#showVersionBtnDiv").show();	
					      	$("#showVersionDiv1").show();
					      	
					      	
					      	if(editable == '1'){
					      		$("#showVersionDiv1").show();
					      	} else {
					      		$("#showVersionDiv1").hide();
					      	}
					      	
					      	$("label[for='docVersionBreadCrumb']").text(breadCrumbTxt);
					      	var lblFullBreadCrumbTxt = "'"+breadCrumbTxt+"'";
					      	
				  	    	var params = {docId:docId,userId:userId};

							$('#datatable-version').dataTable().fnClearTable();
				 			$('#datatable-version').dataTable().fnDestroy();
							var table = $('#datatable-version').DataTable({"order": [[ 0, "desc" ]], "pageLength": 10,  "lengthMenu": [[5, 10], [5, 10]] }).rows().remove().draw();

				  	    	$("#loadingImg").show();
				  			$.ajax({url : "<%=request.getContextPath()%>/showDocumentVersions",type:'post',data:params,success : function(data){
				  				if($.trim(data) != ''){
				  					$("label[for='addVertitle']").text(data.documentUpload.document_name);
				  					$("label[version_numberfor='docName']").text(data.documentUpload.document_name);
				  					$("label[for='docVersion']").text(data.documentUpload.version_number);
				  					$("#versionDocId").val(data.documentUpload.document_id);
				  					$("#versionDocNo").val(data.documentUpload.document_no);
				  					loadVerApprSelectBox('verapprover_user_id_fk',data.users);
					            	$.each(data.versionOrRevisions,function(key,val){
					            		var actOrDeactive = '';
					            		var status = 'Active';
					            		var options = '<a href="#" onClick="downloadAttachment('+val.document_id+')"><i class="fa fa-download" style="color:blue"></i></a>';
					            		if(val.soft_delete_status_id_fk == 2){
					            			actOrDeactive = '<a href="#" onClick="doActiveOrInactive('+val.document_id+',1,'+lblFullBreadCrumbTxt+')" class="btn btn-default modify">Make Active</a>';
					            			status = 'Inactive';
					            			options = options + '&nbsp;&nbsp;<a href="#" onClick="showVersionDeleteDocument('+val.document_id+')"><i class="fa fa-trash" style="color:red"></i></a>';
					            		}
					            		options = options + '';
				                        table.row.add( [
				                        	val.title,
								            val.version_number,
								            val.created_by,
								            val.created_date,
								            status,
								            options,
								            actOrDeactive
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
						
						function loadVerApprSelectBox(child, valFolder){
							var options = "";
			   		    	options = options + '<option value="0" >--Select Approver--</option>';
			   		    	$.each(valFolder,function(key,val){
			   		    		options = options + '<option value='+val.userId+' >'+val.userName+'</option>'
			   		    	});
			   		    	$("#verapprover_user_id_fk").empty();
			   		    	$("#verapprover_user_id_fk").append(options);	
			   		    	/* $('.searchable').select2(); */
			   		    	$("#verapprover_user_id_fk").trigger("chosen:updated");
						}
						
						function sendDocVersionFormReset(){
							document.getElementById("verAttachFileError").innerHTML="";
						 	$("label[for='verAttachFile']").text("");
						 	document.getElementById("version_numberAddError").innerHTML="";
						 	$("label[for='version_numberAddError']").text("");
						}

					  $(document).ready(function() {
						   $('#docVersionForm').validate({
								ignore: ":hidden:not(.chosen-select)",
							    rules: {
						     		"attachFile":{
				                		required:true
				                	},
				                	"version_number":{
				                		required:true
				                	}
						     	},
						    messages: {
					     		"attachFile":{
			                		required: 'Attach the document'
			                	},
			                	"version_number":{
			                		required: 'Version number required'
			                	}
						   	}, errorPlacement:function(error, element){
						   		    if (element.attr("id") == "attachFile" ){
									 	document.getElementById("verAttachFileError").innerHTML="";
									 	error.appendTo('#verAttachFileError');
						   		    } else if (element.attr("id") == "version_number" ){
									 	document.getElementById("version_numberAddError").innerHTML="";
									 	error.appendTo('#version_numberAddError');
								    }else{
						            	error.insertAfter(element);
						            } 
							       
						    },submitHandler:function(form){
						    	form.submit();
						    }
						   });
						 });
						
					</script>


			<div id="showUploadDocumentModal"
				class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg ">
					<div class="modal-content" style="overflow-y: scroll;height: 500px;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Document Upload</h4>
						</div>
						<form action="documentUpload" id="documentUploadForm"
							name="documentUploadForm" method="post"
							enctype="multipart/form-data" class="form-horizontal" role="form">
							<input type="hidden" id="appFlow" name="appFlow" value="docSearch"/>
						<%-- 	<input type="hidden" id="l1_folder_id_fk" name="l1_folder_id_fk"
								value="${l1_folder_id_fk}"> <input type="hidden"
								id="l2_folder_id_fk" name="l2_folder_id_fk"
								value="${l2_folder_id_fk}"> <input type="hidden"
								id="l3_folder_id_fk" name="l3_folder_id_fk"
								value="${l3_folder_id_fk}"> <input type="hidden"
								id="l4_folder_id_fk" name="l4_folder_id_fk"
								value="${l4_folder_id_fk}"> <input type="hidden"
								id="l1_folder_id_val_docs" name="l1_folder_id_val_docs"
								value="${l1_folder_id_val}"> --%>
								
								
							<div class="modal-body">

								<div class="col-md-6 col-sm-6 col-xs-12">
									<fieldset>
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Folder Level 1<sup style='color: #FF0000'>*</sup></label>
											<div class="col-sm-8 col-xs-8">
												<select id="l1_folder_id_fk_search" name="l1_folder_id_fk"
													class="form-control chosen-select" 
													onchange="getFoldersForLevel('l1_folder_id_fk_search','l2_folder_id_fk_search');setRevisonSearch('l1_folder_id_fk_search');">
													<option value="">--Select Level--</option>
													<c:forEach var="level" items="${Level1Ids }">
														<option value="${level.folderId }">${level.levelDescription }</option>
													</c:forEach>
												</select> <span id="level1SearchIdError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Folder Level 2<sup style='color: #FF0000'>*</sup></label>
											<div class="col-sm-8 col-xs-8">
												<select id="l2_folder_id_fk_search" name="l2_folder_id_fk"
													class="form-control chosen-select"
													onchange="getFoldersForLevel('l2_folder_id_fk_search','l3_folder_id_fk_search')">
													<option value="">--Select Level--</option>
												</select> <span id="level2SearchIdError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Folder Level 3</label>
											<div class="col-sm-8 col-xs-8">
												<select id="l3_folder_id_fk_search" name="l3_folder_id_fk"
													class="form-control chosen-select"
													onchange="getFoldersForLevel('l3_folder_id_fk_search','l4_folder_id_fk_search')">
													<option value="0">--Select Level--</option>
												</select> <span id="level3IdError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Folder Level 4</label>
											<div class="col-sm-8 col-xs-8">
												<select id="l4_folder_id_fk_search" name="l4_folder_id_fk"
													class="form-control chosen-select">
													<option value="0">--Select Level--</option>
												</select> <span id="level4IdError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Title<sup style='color: #FF0000'>*</sup></label>
											<div class="col-sm-8 col-xs-8">
												<input type="text" id="title_update" name="title" value=""
													autocomplete="off" maxlength="98" class="form-control">
												<span id="titleError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Document Type</label>
											<div class="col-sm-7 col-xs-7">
												<select id="type_update" name="document_type_fk"
													class="form-control chosen-select">
													<option value="0">--Select Document Type--</option>
													<c:forEach var="dataVal" items="${documentType }">
														<option value="${dataVal.key }">${dataVal.value }</option>
													</c:forEach>
												</select>
												<!-- <input type="text" id="type_update" name="document_type_fk"
											value="" autocomplete="off"
											maxlength="98" class="form-control"> -->
												<span id="typeError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
											<div class="col-sm-1 col-xs-1 col-md-1">
												<i class="fa fa-plus" aria-hidden="true" onclick="addDocumentType()" style="padding-top:5px"></i>
											</div>											
											
										</div>

										<!-- Text input-->
										<div class="form-group" id="versionNoUploadDiv">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="versionNumberUploadLbl">Version Number<sup style='color: #FF0000'>*</sup></label>
											<div class="col-sm-8 col-xs-8">
												<input type="number" id="version_number_upload"
													name="version_number" value="" autocomplete="off" min="1"
													maxlength="10" class="form-control"> <span
													id="version_numberUploadError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group" id="subjectUploadDiv">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="subjectUploadLbl">Subject</label>
											<div class="col-sm-8 col-xs-8">
												<input type="text" id="subject_upload" name="subject"
													value="" autocomplete="off" min="1" maxlength="50"
													class="form-control"> <span id="subjectUploadError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

									</fieldset>
								</div>

								<div class="col-md-6 col-sm-6 col-xs-12">
									<fieldset>

										<div class="form-group" id="updateDocNoDiv">
											<label class="col-sm-3 col-xs-3 control-label labelsize" style="padding-right: 0px;"
												for="documentNoLable">Document Number</label>
												<label class="col-sm-1 col-xs-1" style="padding-left: 0px;"
												for="#"><sup style='color: #FF0000'>*</sup></label>
												
											<div class="col-sm-8 col-xs-8">
												<input type="text" id="document_no_update"
													name="document_no" value="" autocomplete="off"
													maxlength="98" class="form-control"
													onblur="validateDocumentNo(this.value)"> <span
													id="document_noError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">TAGS</label>
											<div class="col-sm-7 col-xs-7 col-md-7">
												<select id="tags_update" name="tags_fk"
													class="form-control chosen-select" multiple="multiple">
													<option value="0">--Select Tag Type--</option>
													<c:forEach var="dataVal" items="${tagsType }">
														<option value="${dataVal.key }">${dataVal.value }</option>
													</c:forEach>
												</select>

												<!-- <input type="text" id="tags_update" name="tags_fk"
											value="" autocomplete="off"
											maxlength="100" class="form-control"> -->
												<span id="tagsError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
											<div class="col-sm-1 col-xs-1 col-md-1">
												<i class="fa fa-plus" aria-hidden="true" onclick="addTags()" style="padding-top:5px"></i>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Revision Type</label>
											<div class="col-sm-7 col-xs-7 col-md-7">
												<select id="revision_type_update" name="revision_type_fk"
													class="form-control chosen-select">
													<option value="0">--Select Revision Type--</option>
													<c:forEach var="dataVal" items="${revisionType }">
														<option value="${dataVal.key }">${dataVal.value }</option>
													</c:forEach>
												</select>

												<!-- <input type="text" id="revision_type_update" name="revision_type_fk"
											value="" autocomplete="off"
											maxlength="98" class="form-control"> -->
												<span id="revision_typeError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
											<div class="col-sm-1 col-xs-1 col-md-1">
												<i class="fa fa-plus" aria-hidden="true" onclick="addRevisionType()" style="padding-top:5px"></i>
											</div>
											
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Approver</label>
											<div class="col-sm-8 col-xs-8">
												<select id="approver_user_id_fk_update"
													name="approver_user_id_fk"
													class="form-control chosen-select">
												</select> <span id="approver_user_id_fkError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Location</label>
											<div class="col-sm-8 col-xs-8">
												<input type="text" id="location_update" name="location"
													value="" autocomplete="off" maxlength="98"
													class="form-control"> <span id="locationError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-4 control-label labelsize"
												for="textinput">Structure Type</label>
											<div class="col-sm-7 col-xs-7 col-md-7">
												<select id="structure_type_update" name="structure_type_fk"
													class="form-control chosen-select">
													<option value="0">--Select Structure Type--</option>
													<c:forEach var="dataVal" items="${structureType }">
														<option value="${dataVal.key }">${dataVal.value }</option>
													</c:forEach>
												</select>
												<!-- <input type="text" id="structure_type_update" name="structure_type_fk"
											value="" autocomplete="off"
											maxlength="100" class="form-control"> -->
												<span id="structure_typeError"
													style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
											</div>
											<div class="col-sm-1 col-xs-1 col-md-1">
												<i class="fa fa-plus" aria-hidden="true" onclick="addStructType()" style="padding-top:5px"></i>
											</div>									
											
										</div>

									</fieldset>
								</div>

								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="form-group" id="referenceNoDiv">
										<div class="col-sm-12 col-xs-12">
											<label class="control-label labelsize mb-5"
												for="versionNumberLbl">References</label>
											<table id="datatable-referenceNbr" class="mdl-data-table"
												style="width: 100%">
												<thead style="color: white; background: #1B3D8F;">
													<tr>
														<th>Level1</th>
														<th>Level2</th>
														<th>Level3</th>
														<th>Level4</th>
														<th>Dcoument</th>
														<th class="text-center">Action</th>
													</tr>
												</thead>
												<tbody id="referenceNbrTableBody">

												</tbody>
											</table>
											<!-- <table class="mdl-data-table">
											<tbody>                                          
												<tr>
													<td style="text-align: right; padding-top: 5px;"><a href="javascript:void(0);" onclick="addLevel()"class="btn waves-effect waves-light bg-m t-c "> <i class="fa fa-plus"></i></a> </td>
												</tr>
											</tbody>
										</table> -->
											<div class="pull-right shadowbox add-row">
												<a href="javascript:void(0);" onclick="addLevel()"
													class="btn waves-effect waves-light bg-m t-c "> <i
													class="fa fa-plus"></i></a>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="form-group">
										<div class="col-sm-12 col-xs-12">
											<label class="control-label labelsize" for="textinput">Attach
												File<sup style='color: #FF0000'>*</sup></label> <input type="file" id="docFormAttachFile"
												name="attachFile" class="form-control"> <span
												id="docFormAttachFileError"
												style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-8 col-sm-8 col-xs-12">
										<fieldset>
											<a href="#"
												onclick="modalDialogClose('showUploadDocumentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
											<button type="submit" class="btn btn-danger modify">
												<i class="fa fa-check-circle"></i>Upload
											</button>
										</fieldset>
									</div>
								</div>

							</div>
							<input type="hidden" id="referenceNbrTblRowCount" value="0">
							<input type="hidden" id="updateDocId" name="docId" />
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
					function showNewUploadDocument(userId){
		  	    		$('#showUploadDocumentModal').modal('show');
		  	    		$('#documentUploadForm')[0].reset();
		  	    		docUploadFormReset();
		  	    		$("#updateDocNoDiv").show();
		  	    		setRevison();
			  	    	$("#loadingImg").show();
			  			$.ajax({url : "<%=request.getContextPath()%>/showUploadDocument?userId="+userId,type:'post',success : function(data){
			  				if($.trim(data) != ''){
			  					loadApprSelectBox('approver_user_id_fk_update',data.users);
			  					/* $('.searchable').select2(); */
			  					$("#approver_user_id_fk_update").trigger("chosen:updated");
			  					$("#loadingImg").hide();
			  				}else{
			  					$("#loadingImg").hide();
			  				}
			  			},error: function (jqXHR, exception) {
			  				$("#loadingImg").hide();
			  	            getErrorMessage(jqXHR, exception);
		  	        	}});
		  	  		}
					
					function validateDocumentNo(selVal){
			  	    	$("#loadingImg").show();
			  			$.ajax({url : "<%=request.getContextPath()%>/validateDocumentNo?docNo="+selVal,type:'post',success : function(data){
			  				if($.trim(data) != '' && data != 'failed'){
			  					document.getElementById("document_noError").innerHTML="Document no already exists";
			  					$("#loadingImg").hide();
			  				}else{
			  					document.getElementById("document_noError").innerHTML="";
			  					$("#loadingImg").hide();
			  				}
			  			},error: function (jqXHR, exception) {
			  				$("#loadingImg").hide();
			  	            getErrorMessage(jqXHR, exception);
		  	        	}});
		  	  		}
					
					function validateVersionNo(selVal){
						var docNo = $("#versionDocNo").val();
						if($.trim(docNo) != '' && $.trim(selVal) != ''){
							$("#loadingImg").show();
				  			$.ajax({url : "<%=request.getContextPath()%>/validateVersionNo?docNo="+docNo+"&versionNo="+selVal,type:'post',success : function(data){
				  				if($.trim(data) != '' && data != 'failed'){
				  					document.getElementById("version_numberAddError").innerHTML="Invalid Version number";
				  					document.getElementById("version_number_add").value="";
				  					$("#loadingImg").hide();
				  				}else{
				  					document.getElementById("version_numberAddError").innerHTML="";
				  					$("#loadingImg").hide();
				  				}
				  			},error: function (jqXHR, exception) {
				  				$("#loadingImg").hide();
				  	            getErrorMessage(jqXHR, exception);
			  	        	}});
						}
		  	  		}
					

					function showUploadDocument(docId, userId){
		  	    		$('#showUploadDocumentModal').modal('show');
		  	    		$('#documentUploadForm')[0].reset();
		  	    		docUploadFormReset();
		  	    		setRevison();
			  	    	var params = {docId:docId,userId:userId};
			  	    	$("#loadingImg").show();
			  			$.ajax({url : "<%=request.getContextPath()%>/showDocument",type:'post',
			  				data:params,success : function(data){
			  				if($.trim(data) != ''){
			  					loadApprSelectBox('approver_user_id_fk_update',data.users, data.documentUpload.approver_user_id_fk);
			  					$("#title_update").val(data.documentUpload.title);
			  					$("#tags_update").val(data.documentUpload.tags_fk);
			  					$("#type_update").val(data.documentUpload.document_type_fk);
			  					$("#location_update").val(data.documentUpload.location);
			  					$("#document_no_update").val(data.documentUpload.document_no);
			  					$("#revision_type_update").val(data.documentUpload.revision_type_fk);
			  					$("#version_number_upload").val(data.documentUpload.version_number);
			  					$("#subject_upload").val(data.documentUpload.subject);
			  					$("#approver_user_id_fk_update").val(data.documentUpload.approver_user_id_fk);
			  					$("#updateDocId").val(data.documentUpload.document_id);
			  					
			  					try {
				  					var options = "";
					   		    	$("#structure_type_update option").each(function() {
					  					  if($(this).val() == data.documentUpload.structure_type_fk) {
					  						options = options + '<option value='+$(this).val()+' selected = "selected">'+$(this).text()+'</option>'
					  					  } else {
					  						options = options + '<option value='+$(this).val()+'>'+$(this).text()+'</option>'				  						  
					  					  }                     
					  				});
					   		    	$("#structure_type_update").empty();
					   		    	$("#structure_type_update").append(options);	
					   		    	$("#structure_type_update").trigger("chosen:updated");

					   		    	options = '';
					   		    	$("#revision_type_update option").each(function() {
					  					  if($(this).val() == data.documentUpload.revision_type_fk) {
					  						options = options + '<option value='+$(this).val()+' selected = "selected">'+$(this).text()+'</option>'
					  					  } else {
					  						options = options + '<option value='+$(this).val()+'>'+$(this).text()+'</option>'				  						  
					  					  }                     
					  				});
					   		    	$("#revision_type_update").empty();
					   		    	$("#revision_type_update").append(options);	
					   		    	$("#revision_type_update").trigger("chosen:updated");

					   		    	options = '';
					   		    	$("#tags_update option").each(function() {
					  					  if(data.documentUpload.tags_fk != null && data.documentUpload.tags_fk.includes($(this).val())) {
					  						options = options + '<option value='+$(this).val()+' selected = "selected">'+$(this).text()+'</option>'
					  					  } else {
					  						options = options + '<option value='+$(this).val()+'>'+$(this).text()+'</option>'				  						  
					  					  }                     
					  				});
					   		    	$("#tags_update").empty();
					   		    	$("#tags_update").append(options);	
					   		    	$("#tags_update").trigger("chosen:updated");
					   		    	
					   		    	options = '';
					   		    	$("#type_update option").each(function() {
					  					  if($(this).val() == data.documentUpload.document_type_fk) {
					  						options = options + '<option value='+$(this).val()+' selected = "selected">'+$(this).text()+'</option>'
					  					  } else {
					  						options = options + '<option value='+$(this).val()+'>'+$(this).text()+'</option>'				  						  
					  					  }                     
					  				});
					   		    	$("#type_update").empty();
					   		    	$("#type_update").append(options);	
					   		    	$("#type_update").trigger("chosen:updated");
				  				} catch (e){
				  					console.log(e);
				  				}
			  					
			  					try {
			  						loadReferences(data.documentUpload.document_id, userId);
				  				} catch (e){
				  					console.log(e);
				  				}
			  					$("#updateDocNoDiv").hide();
			  					$("#loadingImg").hide();
			  				}else{
			  					$("#loadingImg").hide();
			  				}
			  				
			  			},error: function (jqXHR, exception) {
			  				$("#loadingImg").hide();
			  	            getErrorMessage(jqXHR, exception);
		  	        	}});
		  	  		}
					
					function addLevel(){
						var rowNo = $("#referenceNbrTblRowCount").val();
						var rNo = Number(rowNo)+1;
						var refRow = '<tr id="referenceNbrTblRow'+rNo+'">'
								+'<td>'
								+'<select id="ref_l1_folder_id_fk'+rNo+'" name="ref_l1_folder_id_fk" class="form-control  chosen-select" onchange="getRefFoldersForLevel('+rNo+',2)">'
								+ '<option value="0" >--Select Level--</option>'
								+'</select>'
								+'</td>'
								+'<td>'
								+'<select id="ref_l2_folder_id_fk'+rNo+'" name="ref_l2_folder_id_fk" class="form-control  chosen-select" onchange="getRefFoldersForLevel('+rNo+',3)">'
								+ '<option value="0" >--Select Level--</option>'
								+'</select>'
								+'</td>'
								+'<td>'
								+'<select id="ref_l3_folder_id_fk'+rNo+'" name="ref_l3_folder_id_fk" class="form-control  chosen-select" onchange="getRefFoldersForLevel('+rNo+',4)">'
								+ '<option value="0" >--Select Level--</option>'
								+'</select>'
								+'</td>'
								+'<td>'
								+'<select id="ref_l4_folder_id_fk'+rNo+'" name="ref_l4_folder_id_fk" class="form-control  chosen-select">'
								+ '<option value="0" >--Select Level--</option>'
								+'</select>' 
								+'</td>'
								+'<td>'
								+'<select id="reference_no'+rNo+'" name="reference_no" class="form-control  chosen-select">'
								+ '<option value="0" >--Select File--</option>'
								+'</select>'
								+'</td>'
								+'<td class="text-center"><a  class="btn waves-effect waves-light red t-c" onclick="removeLevel('+rNo+');"> <i class="fa fa-close"></i></a></td></tr>';
								
						$('#referenceNbrTableBody').append(refRow);
						$("#referenceNbrTblRowCount").val(rNo);
						
						applySearchableStyle();
						getRefParentFoldersForLevel('ref_l1_folder_id_fk'+rNo);
					}
					
					function loadReferences(docId, userId){
						$.ajax({url : "<%=request.getContextPath()%>/getCorrespondenceDocumentList?docId="+docId+"&userId="+userId,success : function(data){
							if(data != null && data != ''){
								var rowNo = 0;
				            	$.each(data.versionOrRevisions,function(key,val){
									var rNo = Number(rowNo)+1;
									var refRow = '<tr id="referenceNbrTblRow'+rNo+'">'
											+'<td>'
											+'<select id="ref_l1_folder_id_fk'+rNo+'" name="ref_l1_folder_id_fk" class="form-control  chosen-select" onchange="getRefFoldersForLevel('+rNo+',2)">'
											+ getFolderOptions(val.l1Folder, val.l1_folder_id_fk)
											+'</select>'
											+'</td>'
											+'<td>'
											+'<select id="ref_l2_folder_id_fk'+rNo+'" name="ref_l2_folder_id_fk" class="form-control  chosen-select" onchange="getRefFoldersForLevel('+rNo+',3)">'
											+ getFolderOptions(val.l2Folder, val.l2_folder_id_fk)
											+'</select>'
											+'</td>'
											+'<td>'
											+'<select id="ref_l3_folder_id_fk'+rNo+'" name="ref_l3_folder_id_fk" class="form-control  chosen-select" onchange="getRefFoldersForLevel('+rNo+',4)">'
											+ getFolderOptions(val.l3Folder, val.l3_folder_id_fk)
											+'</select>'
											+'</td>'
											+'<td>'
											+'<select id="ref_l4_folder_id_fk'+rNo+'" name="ref_l4_folder_id_fk" class="form-control  chosen-select">'
											+ getFolderOptions(val.l4Folder, val.l4_folder_id_fk)
											+'</select>'
											+'</td>'
											+'<td>'
											+'<select id="reference_no'+rNo+'" name="reference_no" class="form-control  chosen-select">'
											+ getDocumentOptions(val.refDocumentList, val.document_id)
											+'</select>'
											+'</td>'
											+'<td class="text-center"><a  class="btn waves-effect waves-light red t-c" onclick="removeLevel('+rNo+');"> <i class="fa fa-close"></i></a></td></tr>';
											$('#referenceNbrTableBody').append(refRow);
									rowNo= rNo;
											
								});
				            	applySearchableStyle();
								$("#referenceNbrTblRowCount").val(rowNo);
								$("#loadingImg").hide();
							}else{
								$("#loadingImg").hide();
							}
						},error: function (jqXHR, exception) {
							$("#loadingImg").hide();
				        }});						
					}
					
					function applySearchableStyle(){
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
					}
					
					function getFolderOptions(result, selOption){
		   		    	var options = '<option value="0" >--Select Level--</option>';
		   		    	if(result != null){
			   		    	$.each(result,function(key,val){
			   		    		if(selOption == val.folderId){
			   		    			options = options + '<option value='+val.folderId+' selected="selected">'+val.levelDescription+'</option>'				   		    			
			   		    		} else {
			   		    			options = options + '<option value='+val.folderId+' >'+val.levelDescription+'</option>'	
			   		    		}
			   		    	});
		   		    	}
		   		    	return options;
					}
					
					function getDocumentOptions(result, selOption){
		   		    	var options = '<option value="0" >--Select Document--</option>';
		   		    	if(result != null){
			   		    	$.each(result,function(key,val){
			   		    		if(val.title != ""){
				   		    		if(selOption == val.document_id){
				   		    			options = options + '<option value='+val.document_id+' selected="selected">'+val.document_no +' - ' + val.title+'</option>'				   		    			
				   		    		} else {
				   		    			options = options + '<option value='+val.document_id+'>'+val.document_no +' - ' + val.title +'</option>'	
				   		    		}
			   		    		}
			   		    	});			
		   		    	}
		   		    	return options;
					}
					function docUploadFormReset(){
					 	document.getElementById("titleError").innerHTML="";
					 	document.getElementById("document_noError").innerHTML="";
					 	document.getElementById("docFormAttachFileError").innerHTML="";
					 	document.getElementById("version_numberUploadError").innerHTML="";
					 	document.getElementById("level1SearchIdError").innerHTML="";
					 	document.getElementById("level2SearchIdError").innerHTML="";
					 	
					 	$("label[for='docFormAttachFile']").text("");
					 	$("label[for='title_update']").text("");
					 	$("label[for='document_no_update']").text("");
					 	$("label[for='version_number_upload']").text("");
					 	
						$('#referenceNbrTableBody').empty();
						$("#referenceNbrTblRowCount").val(0);
						
	  					var options = "";
		   		    	$("#structure_type_update option").each(function() {
	  						options = options + '<option value='+$(this).val()+'>'+$(this).text()+'</option>'				  						  
		  				});
		   		    	$("#structure_type_update").empty();
		   		    	$("#structure_type_update").append(options);	
		   		    	$("#structure_type_update").trigger("chosen:updated");

		   		    	options = '';
		   		    	$("#revision_type_update option").each(function() {
	  						options = options + '<option value='+$(this).val()+'>'+$(this).text()+'</option>'				  						  
		  				});
		   		    	$("#revision_type_update").empty();
		   		    	$("#revision_type_update").append(options);	
		   		    	$("#revision_type_update").trigger("chosen:updated");

		   		    	options = '';
		   		    	$("#tags_update option").each(function() {
	  						options = options + '<option value='+$(this).val()+'>'+$(this).text()+'</option>'				  						  
		  				});
		   		    	$("#tags_update").empty();
		   		    	$("#tags_update").append(options);	
		   		    	$("#tags_update").trigger("chosen:updated");
		   		    	
		   		    	options = '';
		   		    	$("#type_update option").each(function() {
	  						options = options + '<option value='+$(this).val()+'>'+$(this).text()+'</option>'				  						  
		  				});
		   		    	$("#type_update").empty();
		   		    	$("#type_update").append(options);	
		   		    	$("#type_update").trigger("chosen:updated");
						
					}
					  
					function removeLevel(rowNo){
						$("#referenceNbrTblRow"+rowNo).remove();
					}
					
					function getRefFoldersForLevel(curRowNo, child){
						 var folderId = $("#ref_l1_folder_id_fk"+curRowNo).val();
						 var childCmp = '';
						 if(child == '2'){
							 childCmp = "ref_l2_folder_id_fk"+curRowNo;
							 $("#ref_l3_folder_id_fk"+curRowNo).empty();
							 $("#ref_l3_folder_id_fk"+curRowNo).append('<option value="0" >--Select Level--</option>');
							 $("#ref_l4_folder_id_fk"+curRowNo).empty();
							 $("#ref_l4_folder_id_fk"+curRowNo).append('<option value="0" >--Select Level--</option>');
						 } 
						 if(child == '3'){
							 folderId = $("#ref_l2_folder_id_fk"+curRowNo).val();
							 childCmp = "ref_l3_folder_id_fk"+curRowNo;
							 $("#ref_l4_folder_id_fk"+curRowNo).empty();
							 $("#ref_l4_folder_id_fk"+curRowNo).append('<option value="0" >--Select Level--</option>');
						 }
						 if(child == '4'){
							 folderId = $("#ref_l3_folder_id_fk"+curRowNo).val();
							 childCmp = "ref_l4_folder_id_fk"+curRowNo;
						 } 
						 var myParams = {folderId:folderId};
			 	 		$.ajax({
							type: "POST",
				   		    dataType : 'json',
				   		 	data:myParams,
							url : "./getFoldersForLevel",
				   		    success : function(result){
				   		    	var options = "";
				   		    	options = options + '<option value="0" >--Select Level--</option>';
				   		    	$.each(result,function(key,val){
			   		    			options = options + '<option value='+val.folderId+' >'+val.levelDescription+'</option>'	
				   		    	});
				   		    	$("#"+childCmp).empty();
				   		    	$("#"+childCmp).append(options);
				   		    	$("#"+childCmp).trigger("chosen:updated");
							},error: function (jqXHR, exception) {
								alert(exception);
					            getErrorMessage(jqXHR, exception);
					        }
						});
			 	 		getRefDocumentsForLevel(curRowNo, child, '');
				   	}

					function getRefDocumentsForLevel(curRowNo, child, selOption){
						 var childCmp = "reference_no"+curRowNo;
						 var folderId = $("#ref_l1_folder_id_fk"+curRowNo).val();
						 if(child == '2'){
							 folderId = $("#ref_l1_folder_id_fk"+curRowNo).val();
						 } else  if(child == '3'){
							 folderId = $("#ref_l2_folder_id_fk"+curRowNo).val();
						 } else if(child == '4'){
							 folderId = $("#ref_l3_folder_id_fk"+curRowNo).val();
						 } else {
							 folderId = $("#ref_l4_folder_id_fk"+curRowNo).val();
						 } 
						 var myParams = {folderId:folderId,levelId:child};
			 	 		$.ajax({
							type: "POST",
				   		    dataType : 'json',
				   		 	data:myParams,
							url : "./getRefDocumentsForLevel",
				   		    success : function(result){
				   		    	var options = "";
				   		    	options = options + '<option value="0" >--Select Document--</option>';
				   		    	$.each(result,function(key,val){
				   		    		if(val.title != ""){
					   		    		if(selOption == val.folderId){
					   		    			options = options + '<option value='+val.document_id+' selected="selected">'+val.document_no +' - ' + val.title+'</option>'				   		    			
					   		    		} else {
					   		    			options = options + '<option value='+val.document_id+'>'+val.document_no +' - ' + val.title +'</option>'	
					   		    		}
				   		    		}
				   		    	});
				   		    	$("#"+childCmp).empty();
				   		    	$("#"+childCmp).append(options);
				   		    	/* $('.searchable').select2(); */
				   		    	/* $("#"+childCmp).chosen(".chosen-select"); */
				   		    	$("#"+childCmp).trigger("chosen:updated");
							},error: function (jqXHR, exception) {
					            getErrorMessage(jqXHR, exception);
					        }
						});
				   	}
					
					function getRefParentFoldersForLevel(parent){
						var userId = '<%=(String) session.getAttribute("USER_ID")%>';
			 	 		$.ajax({
							type: "POST",
				   		    dataType : 'json',
							url : "./getRefParentFoldersForLevel?userId="+userId,
				   		    success : function(result){
				   		    	var options = "";
				   		    	options = options + '<option value="0" >--Select Level--</option>';
				   		    	$.each(result,function(key,val){
			   		    			options = options + '<option value='+val.folderId+' >'+val.levelDescription+'</option>'	
				   		    	});
				   		    	$("#"+parent).empty();
				   		    	$("#"+parent).append(options);
				   		    	$("#"+parent).trigger("chosen:updated");
							},error: function (jqXHR, exception) {
								alert(exception);
					            getErrorMessage(jqXHR, exception);
					        }
						});
				   	}

					function setRevison(){
				  		var folderText = '${breadCrumbTxt}';
				  		if(folderText.toLowerCase().includes("correspond")){
				  			$("label[for='documentNoLable']").text("Letter No");
				  			$("#referenceNoDiv").show();
				  			$("#versionNoUploadDiv").hide();
				  			$("#subjectUploadDiv").show();
				  		} else {
				  			$("label[for='documentNoLable']").text("Document Number");
				  			$("#referenceNoDiv").hide();
				  			$("#versionNoUploadDiv").hide();
				  			$("#subjectUploadDiv").hide();
				  			
				  		}
				  	}		
					
					function setRevisonSearch(parent){
				  		var folderText = $("#"+parent+"  option:selected").text();
				  		if(folderText.toLowerCase().includes("correspond")){
				  			$("label[for='documentNoLable']").text("Letter No");
				  			$("#referenceNoDiv").show();
				  			$("#versionNoUploadDiv").hide();
				  			$("#subjectUploadDiv").show();
				  		} else {
				  			$("label[for='documentNoLable']").text("Document Number");
				  			$("#referenceNoDiv").hide();
				  			$("#versionNoUploadDiv").hide();
				  			$("#subjectUploadDiv").hide();
				  		}
				  	}
					
					function loadApprSelectBox(child, valFolder, selOption){
						var options = "";
		   		    	options = options + '<option value="0" >--Select Approver--</option>';
		   		    	$.each(valFolder,function(key,val){
		   		    		if(selOption == val.userId){
		   		    			options = options + '<option value='+val.userId+' selected = "selected">'+val.userName+'</option>'
		   		    		} else {
		   		    			options = options + '<option value='+val.userId+' >'+val.userName+'</option>'	
		   		    		}
		   		    	});
		   		    	$("#approver_user_id_fk_update").empty();
		   		    	$("#approver_user_id_fk_update").append(options);	
		   		    	$("#approver_user_id_fk_update").trigger("chosen:updated");
					}
					
					  $(document).ready(function() {
						   $('#documentUploadForm').validate({
								ignore: ":hidden:not(.chosen-select)",
							    rules: {
							     		"title":{
					                		required:true
							     		},
							     		"document_no":{
					                		required:true
					                	},
							     		"attachFile":{
					                		//required:true
							     			required: function(){
						                        return $("#updateDocId").val().length <= 0;
							     			}					                		
					                	},
					                	"version_number":{
					                		required:true
					                	},
					                	"l1_folder_id_fk":{
					                		required:true
					                	},"l2_folder_id_fk":{
					                		required:true
					                	} 
							     	},
							    messages: {
						     		"title":{
				                		required: 'Title required'
						     		},
						     		"document_no":{
				                		required: 'Doucment No required'
						     		},
						     		"attachFile":{
				                		required: 'Attach the document'
				                	},
				                	"version_number":{
				                		required: 'Version Number required'
				                	},
				                	"l1_folder_id_fk":{
						     			required:'Level 1 required'
				        			},
				        			"l2_folder_id_fk":{
						     			required:'Level 2 required'
				        			}
							   	}, errorPlacement:function(error, element){
							   		    if (element.attr("id") == "title" ){
										 	document.getElementById("titleError").innerHTML="";
										 	error.appendTo('#titleError');
							   		    } else if (element.attr("id") == "type" ){
											 	document.getElementById("typeError").innerHTML="";
											 	error.appendTo('#typeError');
							   		    } else if (element.attr("id") == "attachFile" ){
										 	document.getElementById("attachFileError").innerHTML="";
										 	error.appendTo('#attachFileError');
							   		    } else if (element.attr("id") == "version_number" ){
										 	document.getElementById("version_numberUploadError").innerHTML="";
										 	error.appendTo('#version_numberUploadError');
							   		    } else if (element.attr("id") == "l1_folder_id_fk_search" ){
											 	document.getElementById("level1SearchIdError").innerHTML="";
											 	error.appendTo('#level1SearchIdError');
								   		} else if (element.attr("id") == "l2_folder_id_fk_search" ){
											 	document.getElementById("level2SearchIdError").innerHTML="";
											 	error.appendTo('#level2SearchIdError');
								        }else{
							            	error.insertAfter(element);
							            } 
								       
							    },submitHandler:function(form){
							    	form.submit();
							    }
							});   			  	
									
						 });
	            </script>


			<div id="showBulkUploadDocumentModal"
				class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-md ">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Document Bulk Upload</h4>
						</div>
						<div class="modal-body">

							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<fieldset>
										<form action="fileUpload" id="fileForm" name="fileForm"
											method="post" enctype="multipart/form-data" class="dropzone"
											role="form">
											<div>
												<div id="divFileForm"
													class="dz-default dz-message file-dropzone text-center well col-sm-12">
													<span class="glyphicon glyphicon-paperclip"></span> <span>
														To attach files, drag and drop here</span><br> <span>OR</span><br>
													<span>Just Click</span>
												</div>
											</div>
										</form>
									</fieldset>
								</div>
							</div>
							<div class="row">&nbsp;</div>
							<div class="row">
								<div class="col-md-8 col-sm-8 col-xs-12">
									<form action="documentBulkUpload" id="documentBulkUploadForm"
										name="documentBulkUploadForm" method="post"
										class="form-horizontal" role="form">
										<input type="hidden" id="l1_folder_id_fk"
											name="l1_folder_id_fk" value="${l1_folder_id_fk}"> <input
											type="hidden" id="l2_folder_id_fk" name="l2_folder_id_fk"
											value="${l2_folder_id_fk}"> <input type="hidden"
											id="l3_folder_id_fk" name="l3_folder_id_fk"
											value="${l3_folder_id_fk}"> <input type="hidden"
											id="l4_folder_id_fk" name="l4_folder_id_fk"
											value="${l4_folder_id_fk}">

										<fieldset>
											<a href="#"
												onclick="modalDialogClose('showBulkUploadDocumentModal')"
												class="btn btn-default modify"><i class="fa fa-close"
												aria-hidden="true"></i>Cancel</a>
											<button type="submit" class="btn btn-danger modify">
												<i class="fa fa-check-circle"></i>Upload
											</button>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript">
					    function showBulkUploadDocument(){
			  	    		$('#showBulkUploadDocumentModal').modal('show');
			  	    		$('#fileForm')[0].reset();
			  	    		$('#documentBulkUploadForm')[0].reset();
					    }
					</script>
			`

			<div id="deleteDocumentModal" class="modal fade bs-example-modal-sm"
				tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Confirmation</h4>
						</div>
						<form action="deleteDocumentFromSearch" id="deleteDocumentForm"
							name="deleteDocumentForm" method="post">
							<div class="modal-body">
								<p>Are you sure you want to delete?</p>
								<input type="hidden" id="deleteDocId" name="docId" />
								<input type="hidden" id="appFlow" name="appFlow" value="docSearch"/>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-danger">
									<i class="fa fa-check-circle"></i>Ok
								</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal"
									onclick="modalDialogClose('deleteDocumentModal')">
									<i class="fa fa-times"></i>Cancel
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
			    function showDeleteDocument(docId){
		 	    		$('#deleteDocumentModal').modal('show');
		 	    		$('#deleteDocId').val(docId);
			    }
			</script>

			<div id="deleteVersionDocumentModal" class="modal fade bs-example-modal-sm"
				tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">Confirmation</h4>
						</div>
						<form action="deleteVersionDocument" id="deleteVersionDocumentForm"
							name="deleteVersionDocumentForm" method="post">
							<div class="modal-body">
								<p>Are you sure you want to delete document version?</p>
								<input type="hidden" id="deleteVersionDocId" name="docId" />
								<input type="hidden" id="appFlow" name="appFlow" value="docSearch"/>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-danger">
									<i class="fa fa-check-circle"></i>Ok
								</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal"
									onclick="modalDialogClose('deleteVersionDocumentModal')">
									<i class="fa fa-times"></i>Cancel
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
			    function showVersionDeleteDocument(docId){
		 	    		$('#deleteVersionDocumentModal').modal('show');
		 	    		$('#deleteVersionDocId').val(docId);
			    }
			</script>


	<div id="addTagsModal" class="modal fade bs-example-modal-sm"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">Add Tags</h4>
				</div>
				<form action="addTag" id="addTagForm"
					name="addTagForm" method="post">
					<div class="modal-body">
					<fieldset>
						<div class="form-group" id="addTagsDiv">
							<label class="col-sm-6 col-xs-6 control-label labelsize"
								for="addTagsLbl">TAG</label>
								<div class="col-sm-6 col-xs-6">
								<input type="text" id="nm_tag" name="nm_tag"
									value="" autocomplete="off" min="1"
									maxlength="50" class="form-control" onblur="validateTags(this.value)"> <span
									id="nm_tagError"
									style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
								</div>										
						</div>
					</fieldset>
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" onclick="createTags()">
							<i class="fa fa-check-circle"></i>Ok
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="modalDialogClose('addTagsModal')">
							<i class="fa fa-times"></i>Cancel
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="addDocumentTypeModal" class="modal fade bs-example-modal-sm"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">Add Document Type</h4>
				</div>
				<form action="addDocumentType" id="addDocumentForm"
					name="addDocumentForm" method="post">
					<div class="modal-body">
					<fieldset>
						<div class="form-group" id="addDocumentTypeDiv">
							<label class="col-sm-6 col-xs-6 control-label labelsize"
								for="addTagsLbl">Document Type</label>
								<div class="col-sm-6 col-xs-6">
								<input type="text" id="nm_documentType" name="nm_documentType"
									value="" autocomplete="off" min="1"
									maxlength="50" class="form-control" onblur="validateDocumentType(this.value)"> <span
									id="nm_documentTypeError"
									style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
								</div>										
						</div>
					</fieldset>
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" onclick="createDocumentType()">
							<i class="fa fa-check-circle"></i>Ok
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="modalDialogClose('addDocumentTypeModal')">
							<i class="fa fa-times"></i>Cancel
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="addRevisionTypeModal" class="modal fade bs-example-modal-sm"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">Add Revision Type</h4>
				</div>
				<form action="addRevisionType" id="addRevisionForm"
					name="addRevisionForm" method="post">
					<div class="modal-body">
					<fieldset>
						<div class="form-group" id="addRevisionTypeDiv">
							<label class="col-sm-6 col-xs-6 control-label labelsize"
								for="addRevisionLbl">Revision Type</label>
								<div class="col-sm-6 col-xs-6">
								<input type="text" id="nm_revisionType" name="nm_revisionType"
									value="" autocomplete="off" min="1"
									maxlength="50" class="form-control" onblur="validateRevisionType(this.value)"> <span
									id="nm_revisionTypeError"
									style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
								</div>										
						</div>
					</fieldset>
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" onclick="createRevisionType()">
							<i class="fa fa-check-circle"></i>Ok
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="modalDialogClose('addRevisionTypeModal')">
							<i class="fa fa-times"></i>Cancel
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="addStructTypeModal" class="modal fade bs-example-modal-sm"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">Add Struct Type</h4>
				</div>
				<form action="addStructType" id="addStructForm"
					name="addStructForm" method="post">
					<div class="modal-body">
					<fieldset>
						<div class="form-group" id="addStructTypeDiv">
							<label class="col-sm-6 col-xs-6 control-label labelsize"
								for="addStructLbl">Struct Type</label>
								<div class="col-sm-6 col-xs-6">
								<input type="text" id="nm_structType" name="nm_structType"
									value="" autocomplete="off" min="1"
									maxlength="50" class="form-control" onblur="validateStructType(this.value)"> <span
									id="nm_structTypeError"
									style="color: #1B3D8F !important; font-weight: 100 !important; font-size: 11px !important;"></span>
								</div>										
						</div>
					</fieldset>
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" onclick="createStructType()">
							<i class="fa fa-check-circle"></i>Ok
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="modalDialogClose('addStructTypeModal')">
							<i class="fa fa-times"></i>Cancel
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

			<!--  Model Ends -->
			<!-- /page content -->

			<div id="loadingImg" style="display: none;">
				<div
					style="position: fixed; left: 0; top: 0; z-index: 202; background-color: rgba(0, 0, 0, 0.5); width: 100%; Height: 100%;">
					<i class="fa fa-spinner fa-spin"
						style="font-size: 48px; color: red; position: fixed; margin-top: -24px%; margin-left: -24px; top: 50%; left: 50%;"></i>
				</div>
			</div>

		</div>
	</div>


	<form action="editFolder" name="getFolderForm" id="getFolderForm"
		method="post">
		<input type="hidden" name="folderId" id="folderId" /> <input
			type="hidden" name="createUser" id="createUser" />
	</form>

	<jsp:include page="./../layout/bottomNav.jsp"></jsp:include>

    <footer class="page-footer" style="margin: 0 auto;">
        <div class=" container text-center ">
            <p class="footer-text text-center ">Copyright <span id="year "><span id="year"></span>.</span> @<img src="/ircondcs/resources/images/logo.png " alt="ircon logo " class="footer-logo " style="height: 30px;"> | Designed &amp; Developed by
                <img src="/ircondcs/resources/images/synergiz.png " alt="synergiz logo " class="footer-logo " style="height: 30px;"></p>
        </div>
    </footer>
    	<script>
		$(document).ready(function() {
			$("#year").html(new Date().getFullYear());
		});
	</script>

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
    	$(document).ready(function(){
    		doSearchDisplaySetup();
			getDocsList();
    	});
    	
	    function doActiveOrInactive(docId,reqStatus, breadCrumbTxt){
	    	var userId = '<%= session.getAttribute("USER_NAME")%>';
	    	var docName = "";
  	    	var params = {docId:docId,reqStatus:reqStatus,userId:userId};
  	    	$("#loadingImg").show();
  			$.ajax({url : "<%=request.getContextPath()%>/doActiveOrInactive",type:'post',data:params,success : function(data){
  				$("#loadingImg").hide();
  				if($.trim(data) == 'success'){
  					showDocumentVersions(docId, userId, breadCrumbTxt,'1');
  				} 
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
  	        }});
	    	
		}
    	
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
	    
	    function doSearchDisplaySetup(){
	    	if(docSearchType == 'D' || docSearchType == 'C'){
	    		getFoldersForLevelUsingParantValue('${curFolder}','l2_folder_id_search_fk');
	    		getLevel2Folders('${curFolder}','l3_folder_id_search_fk');
	    		isDisplayParent = "false";
	    		$("#level1SearchDiv").hide();
		  		$("#level3SearchDiv").show();
		  		if(docSearchType == 'C'){
			  		$("label[for='level2search']").text("Correspondance Type");
			  		$("label[for='level3search']").text("Correspondance With");
		  		} else {
			  		$("label[for='level2search']").text("Drawings Type");
			  		$("label[for='level3search']").text("Drawings With");
		  		}
	    	} else {
	    		$("#level1SearchDiv").show();
		  		$("#level3SearchDiv").hide();
		  		$("label[for='level2search']").text("Folder Level 2");
		  		$("label[for='level3search']").text("Folder Level 3");
	    	}
	    }
	    
	    var isDisplayParent = "true";
	    var docSearchType = '<%=(String) session.getAttribute("DOC_SEARCH_TYPE")%>';
	    var searchURLParams = "";
	    var dataUrl = "<%=request.getContextPath()%>/getAllDocumentSearchList?";
	    function getDocsList(){
	    	if(docSearchType == 'D' || docSearchType == 'C'){
	    		isDisplayParent = "false";
	    	}	    	
	    	
	    	if(docSearchType == 'C'){
	    		$("label[for='searchDocType']").text('Letter Type');
	    		$("label[for='tblDocType']").text('Letter Type');
	    		$("label[for='tblDocNo']").text('Letter No.');
	    	} else {
	    		$("label[for='searchDocType']").text('Document Type');
	    		$("label[for='tblDocType']").text('Document Type');
	    		$("label[for='tblDocNo']").text('Document No.');
	    	}
	    	
	    	if(docSearchType == 'D'){
	    		$("#level3SearchDiv").hide();
	    	} 
	    	
	    	var loggedUserId = '<%=(String) session.getAttribute("USER_ID")%>';
        	var l1_folder_id_search = $("#l1_folder_id_search_fk").val();
        	var l2_folder_id_search = $("#l2_folder_id_search_fk").val();
        	var l3_folder_id_search = $("#l3_folder_id_search_fk").val();
        	var structure_type_search = $("#structure_type_search_fk").val();
        	var document_type_search_fk = $("#document_type_search_fk").val();
        	var tags_search = $("#tags_search_fk").val();
        	
        	this.searchURLParams = dataUrl +"l1_folder_id_search="+l1_folder_id_search+"&l2_folder_id_search="
        					+l2_folder_id_search+"&l3_folder_id_search="+l3_folder_id_search
        					+"&structure_type_search="+structure_type_search+"&document_type_search_fk="+document_type_search_fk
        					+"&tags_search="+tags_search;

			$('#datatable-documents').dataTable().fnClearTable();
 			$('#datatable-documents').dataTable().fnDestroy();
			var table = $('#datatable-documents').DataTable({"order": [[ 6, "desc" ]], "pageLength": 10,  "lengthMenu": [[5, 10, 25, 50], [5, 10, 25, 50]] }).rows().remove().draw();
			$("#loadingImg").show();
	   									
			$.ajax({url : this.searchURLParams,type:'post',success : function(data){
  				if($.trim(data) != ''){
  					$.each(data.documentList,function(key,val){
	            		var lblBreadCrumbTxt = val.l1_folder_id_val;
	            		var folderNavURL = val.l1_folder_id_fk+"&levelId=1";
	            		var lblFullBreadCrumbTxt = val.l1_folder_id_val;
	            		
	            		var folderDetails = "l1_folder_id="+val.l1_folder_id_fk;
	            		folderDetails = folderDetails + "&l2_folder_id="+val.l2_folder_id_fk;
	            		folderDetails = folderDetails + "&l3_folder_id="+val.l3_folder_id_fk;
	            		folderDetails = folderDetails + "&l4_folder_id="+val.l4_folder_id_fk;
	            		
	  					if(val.l2_folder_id_val != null) {
	  						var folder2 = data.parentFolders.find( ({folderId}) => folderId === val.l2_folder_id_fk);
		  					var level2Id = folder2 != null ? folder2.levelId : "";
		  					if(isDisplayParent == 'false'){
								lblBreadCrumbTxt =  level2Id + " "+ val.l2_folder_id_val;
							} else {
								lblBreadCrumbTxt = lblBreadCrumbTxt + " > " + level2Id + " "+ val.l2_folder_id_val;	
							}
		  					lblFullBreadCrumbTxt = lblFullBreadCrumbTxt + " > " + level2Id + " "+ val.l2_folder_id_val;	
		  					folderNavURL = val.l2_folder_id_fk+"&levelId=2";
	  					} 
	  					if(val.l3_folder_id_val != null) {
	  						var folder3 = data.parentFolders.find( ({folderId}) => folderId === val.l3_folder_id_fk);
		  					var level3Id = folder3 != null ? folder3.levelId : "";
	  						lblBreadCrumbTxt = lblBreadCrumbTxt + " > "  + level3Id + " "+  val.l3_folder_id_val;
	  						lblFullBreadCrumbTxt = lblFullBreadCrumbTxt + " > " + level3Id + " "+ val.l3_folder_id_val;	
	  						folderNavURL = val.l3_folder_id_fk+"&levelId=3";
	  					} 
	  					if(val.l4_folder_id_val != null) {
	  						var folder4 = data.parentFolders.find( ({folderId}) => folderId === val.l4_folder_id_fk);
		  					var level4Id = folder4 != null ? folder4.levelId : "";
	  						lblBreadCrumbTxt = lblBreadCrumbTxt + " > " +  level4Id + " "+ val.l4_folder_id_val;
	  						lblFullBreadCrumbTxt = lblFullBreadCrumbTxt + " > " + level4Id + " "+ val.l4_folder_id_val;	
	  						folderNavURL = val.l4_folder_id_fk+"&levelId=4";
	  					}
	  					
	  					var tsValue = val.modifiedTS;
		            	if(tsValue == '' || tsValue == null){
		            		tsValue = val.createdTS;
		            	}
		            	if(tsValue == '' || tsValue == null){
		            		tsValue = '';
		            	}
		            	lblFullBreadCrumbTxt = "'"+lblFullBreadCrumbTxt+"'";
		            	
		            	var oCount = 1;
		            	var hypLink = '<div class="dropdown">';
	            			hypLink = hypLink + '<a class="dropbtn"><img id="'+val.document_id+'" class="card-img-top" src="/ircondcs/resources/images/document.svg" alt="Files"></a>';
	            			hypLink = hypLink + '<div class="dropdown-content">';
	            			hypLink = hypLink + '<a href="#" onClick="viewAttachment('+val.document_id+')">'+(oCount++)+'. Preview</a>';
	            			if(val.flAllowDownload == 'Y'){ 
	            				hypLink = hypLink + '<a href="#" onClick="downloadAttachment('+val.document_id+')">'+(oCount++)+'. Download</a>';
	            			}
	            			hypLink = hypLink + '<a href="#" onClick="showEmailAttachment('+val.document_id+','+loggedUserId+')">'+(oCount++)+'. Email Document</a>';
	            			if(val.flAllowView == 'Y'){ 
	            				hypLink = hypLink + '<a href="#" onClick="showDocument('+val.document_id+','+loggedUserId+')">'+(oCount++)+'. Details</a>';
	            			}
	            			if(val.flCorrespondences == 'Y' && val.flAllowView == 'Y'){ 
	            				 hypLink = hypLink +'<a href="#" onClick="showDocumentTracks('+val.document_id+','+loggedUserId+')">'+(oCount++)+'. Track</a>';
	            			} else {
	            				if(val.flAllowEdit == 'Y'){ 
	            					hypLink = hypLink + '<a href="#" onClick="showDocumentVersions('+val.document_id+','+loggedUserId+','+lblFullBreadCrumbTxt+',1)">'+(oCount++)+'. View Versions</a>';
	            				} else if(val.flAllowView == 'Y') {
	            					hypLink = hypLink + '<a href="#" onClick="showDocumentVersions('+val.document_id+','+loggedUserId+','+lblFullBreadCrumbTxt+',2)">'+(oCount++)+'. View Versions</a>';
	            				}
	            			}
	            			if(val.flAllowEdit == 'Y'){ 
	            				hypLink = hypLink + '<a href="#" onClick="showMoveDocument('+val.document_id+','+loggedUserId+')">'+(oCount++)+'. Move</a>';
	            			}
	            			if(val.flAllowDelete == 'Y'){ 
	            				 hypLink = hypLink + '<a href="#" onClick="showDeleteDocument('+val.document_id+')">'+(oCount++)+'. Delete</a>';
	            			}
	            			
                        table.row.add( [
                        		//"<a href='gotoDocumentFolder?"+folderDetails+"&folderId="+folderNavURL+"'><span class='nowrap'>"+lblBreadCrumbTxt+"</span></a>",
                        		//"<span class='nowrap'>"+val.title+"</span>",
                        		"<a href='gotoDocumentFolder?"+folderDetails+"&folderId="+folderNavURL+"'><span>"+lblBreadCrumbTxt+"</span></a>",
                        		"<span>"+val.title+"</span>",
                        		val.document_no,
                        		val.documentTypeVal,
                        		//val.tagsVal,
                        		val.structureTypeVal,
                        		tsValue,
                        		hypLink
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
	        $("#loadingImg").hide();
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
	  
	  function modalDialogClose(dialogId){
			 $("#"+dialogId).modal('hide');
		 }
	  
		function addTags(){
			$('#addTagsModal').modal('show');
			document.getElementById("nm_tagError").innerHTML="";
			document.getElementById("nm_tag").value="";			
		}
	  
		function validateTags(selVal){
  	    	$("#loadingImg").show();
  			$.ajax({url : "<%=request.getContextPath()%>/validateTypes?typeTable=tags&typeValue="+selVal,type:'post',success : function(data){
  				if($.trim(data) != '' && data != 'failed'){
  					document.getElementById("nm_tagError").innerHTML="Already exists";
  					document.getElementById("nm_tag").value="";
  					document.getElementById("nm_tag").focus();
  					$("#loadingImg").hide();
  				}else{
  					document.getElementById("nm_tagError").innerHTML="";
  					$("#loadingImg").hide();
  				}
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
	        	}});
			}
		
		function createTags(){
			var nTags = $('#nm_tag').val();
			if($.trim(nTags) != ''){
	  	    	$("#loadingImg").show();
	  			$.ajax({url : "<%=request.getContextPath()%>/createTypeValues?typeTable=tags&typeValue="+nTags,type:'post',success : function(data){
	  				if($.trim(data) != '' && data != 'failed'){
	  					document.getElementById("nm_tagError").innerHTML="TAGS added";
	  					document.getElementById("nm_tag").value="";
	  					
   		    			var options ='<option value='+$.trim(data)+' selected = "selected">'+nTags+'</option>'
		   		    	$("#tags_update").append(options);	
		   		    	$("#tags_update").trigger("chosen:updated");	
		   		    	modalDialogClose('addTagsModal');
		   		    	
	  					$("#loadingImg").hide();
	  				}else{
	  					document.getElementById("nm_tagError").innerHTML="TAGS creation failed.";
	  					document.getElementById("nm_tag").focus();
	  					$("#loadingImg").hide();
	  				}
	  			},error: function (jqXHR, exception) {
	  				$("#loadingImg").hide();
	  	            getErrorMessage(jqXHR, exception);
		        }});
			} else {
				document.getElementById("nm_tagError").innerHTML="Please enter valid TAGS.";
				document.getElementById("nm_tag").focus();
			}
		}
		
		function addDocumentType(){
			$('#addDocumentTypeModal').modal('show');
			document.getElementById("nm_documentTypeError").innerHTML="";
			document.getElementById("nm_documentType").value="";			
		}
	  
		function validateDocumentType(selVal){
  	    	$("#loadingImg").show();
  	    	$.ajax({url : "<%=request.getContextPath()%>/validateTypes?typeTable=document_type&typeValue="+selVal,type:'post',success : function(data){
  				if($.trim(data) != '' && data != 'failed'){
  					document.getElementById("nm_documentTypeError").innerHTML="Already exists";
  					document.getElementById("nm_documentType").value="";
  					document.getElementById("nm_documentType").focus();
  					$("#loadingImg").hide();
  				}else{
  					document.getElementById("nm_documentTypeError").innerHTML="";
  					$("#loadingImg").hide();
  				}
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
	        	}}
  			);
		}
		
		function createDocumentType(){
			var nDocumentType = $('#nm_documentType').val();
			if($.trim(nDocumentType) != ''){
	  	    	$("#loadingImg").show();
	  	    	$.ajax({url : "<%=request.getContextPath()%>/createTypeValues?typeTable=document_type&typeValue="+nDocumentType,type:'post',success : function(data){
	  				if($.trim(data) != '' && data != 'failed'){
	  					document.getElementById("nm_documentTypeError").innerHTML="Document Type added.";
	  					document.getElementById("nm_documentType").value="";
	  					
   		    			var options ='<option value='+$.trim(data)+' selected = "selected">'+nDocumentType+'</option>'
		   		    	$("#type_update").append(options);	
		   		    	$("#type_update").trigger("chosen:updated");	
		   		    	modalDialogClose('addDocumentTypeModal');
		   		    	
	  					$("#loadingImg").hide();
	  				}else{
	  					document.getElementById("nm_documentTypeError").innerHTML="Document Type creation failed.";
	  					document.getElementById("nm_documentType").focus();
	  					$("#loadingImg").hide();
	  				}
	  			},error: function (jqXHR, exception) {
	  				$("#loadingImg").hide();
	  	            getErrorMessage(jqXHR, exception);
		        }});
			} else {
				document.getElementById("nm_documentTypeError").innerHTML="Please enter valid Document Type.";
				document.getElementById("nm_documentType").focus();
			}
		}
		
		function addRevisionType(){
			$('#addRevisionTypeModal').modal('show');
			document.getElementById("nm_revisionTypeError").innerHTML="";
			document.getElementById("nm_revisionType").value="";			
		}
	  
		function validateRevisionType(selVal){
  	    	$("#loadingImg").show();
  	    	$.ajax({url : "<%=request.getContextPath()%>/validateTypes?typeTable=revision_type&typeValue="+selVal,type:'post',success : function(data){
  				if($.trim(data) != '' && data != 'failed'){
  					document.getElementById("nm_revisionTypeError").innerHTML="Already exists";
  					document.getElementById("nm_revisionType").value="";
  					document.getElementById("nm_revisionType").focus();
  					$("#loadingImg").hide();
  				}else{
  					document.getElementById("nm_revisionTypeError").innerHTML="";
  					$("#loadingImg").hide();
  				}
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
	        	}}
  			);
		}
		
		function createRevisionType(){
			var nRevisionType = $('#nm_revisionType').val();
			if($.trim(nRevisionType) != ''){
	  	    	$("#loadingImg").show();
	  	    	$.ajax({url : "<%=request.getContextPath()%>/createTypeValues?typeTable=revision_type&typeValue="+nRevisionType,type:'post',success : function(data){
	  				if($.trim(data) != '' && data != 'failed'){
	  					document.getElementById("nm_revisionTypeError").innerHTML="Revision Type added.";
	  					document.getElementById("nm_revisionType").value="";
	  					
   		    			var options ='<option value='+$.trim(data)+' selected = "selected">'+nRevisionType+'</option>'
		   		    	$("#revision_type_update").append(options);	
		   		    	$("#revision_type_update").trigger("chosen:updated");	
		   		    	modalDialogClose('addRevisionTypeModal');
		   		    	
	  					$("#loadingImg").hide();
	  				}else{
	  					document.getElementById("nm_revisionTypeError").innerHTML="Revision Type creation failed.";
	  					document.getElementById("nm_revisionType").focus();
	  					$("#loadingImg").hide();
	  				}
	  			},error: function (jqXHR, exception) {
	  				$("#loadingImg").hide();
	  	            getErrorMessage(jqXHR, exception);
		        }});
			} else {
				document.getElementById("nm_revisionTypeError").innerHTML="Please enter valid Revision Type.";
				document.getElementById("nm_revisionType").focus();
			}
		}

		function addStructType(){
			$('#addStructTypeModal').modal('show');
			document.getElementById("nm_structTypeError").innerHTML="";
			document.getElementById("nm_structType").value="";			
		}
	  
		function validateStructType(selVal){
  	    	$("#loadingImg").show();
  	    	$.ajax({url : "<%=request.getContextPath()%>/validateTypes?typeTable=structure_type&typeValue="+selVal,type:'post',success : function(data){
  				if($.trim(data) != '' && data != 'failed'){
  					document.getElementById("nm_structTypeError").innerHTML="Already exists";
  					document.getElementById("nm_structType").value="";
  					document.getElementById("nm_structType").focus();
  					$("#loadingImg").hide();
  				}else{
  					document.getElementById("nm_structTypeError").innerHTML="";
  					$("#loadingImg").hide();
  				}
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
	        	}}
  			);
		}
		
		function createStructType(){
			var nStructType = $('#nm_structType').val();
			if($.trim(nStructType) != ''){
	  	    	$("#loadingImg").show();
	  	    	$.ajax({url : "<%=request.getContextPath()%>/createTypeValues?typeTable=structure_type&typeValue="+nStructType,type:'post',success : function(data){
	  				if($.trim(data) != '' && data != 'failed'){
	  					document.getElementById("nm_structTypeError").innerHTML="Structure Type added.";
	  					document.getElementById("nm_structType").value="";
	  					
   		    			var options ='<option value='+$.trim(data)+' selected = "selected">'+nStructType+'</option>'
		   		    	$("#structure_type_update").append(options);	
		   		    	$("#structure_type_update").trigger("chosen:updated");	
		   		    	modalDialogClose('addStructTypeModal');
		   		    	
	  					$("#loadingImg").hide();
	  				}else{
	  					document.getElementById("nm_structTypeError").innerHTML="Structure Type creation failed.";
	  					document.getElementById("nm_structType").focus();
	  					$("#loadingImg").hide();
	  				}
	  			},error: function (jqXHR, exception) {
	  				$("#loadingImg").hide();
	  	            getErrorMessage(jqXHR, exception);
		        }});
			} else {
				document.getElementById("nm_structTypeError").innerHTML="Please enter valid Structure Type.";
				document.getElementById("nm_structType").focus();
			}
		}
		
		function addTags(){
			$('#addTagsModal').modal('show');
			document.getElementById("nm_tagError").innerHTML="";
			document.getElementById("nm_tag").value="";			
		}
	  
		function validateTags(selVal){
  	    	$("#loadingImg").show();
  			$.ajax({url : "<%=request.getContextPath()%>/validateTypes?typeTable=tags&typeValue="+selVal,type:'post',success : function(data){
  				if($.trim(data) != '' && data != 'failed'){
  					document.getElementById("nm_tagError").innerHTML="Already exists";
  					document.getElementById("nm_tag").value="";
  					document.getElementById("nm_tag").focus();
  					$("#loadingImg").hide();
  				}else{
  					document.getElementById("nm_tagError").innerHTML="";
  					$("#loadingImg").hide();
  				}
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
	        	}});
			}
		
		function createTags(){
			var nTags = $('#nm_tag').val();
			if($.trim(nTags) != ''){
	  	    	$("#loadingImg").show();
	  			$.ajax({url : "<%=request.getContextPath()%>/createTypeValues?typeTable=tags&typeValue="+nTags,type:'post',success : function(data){
	  				if($.trim(data) != '' && data != 'failed'){
	  					document.getElementById("nm_tagError").innerHTML="TAGS added";
	  					document.getElementById("nm_tag").value="";
	  					
   		    			var options ='<option value='+$.trim(data)+' selected = "selected">'+nTags+'</option>'
		   		    	$("#tags_update").append(options);	
		   		    	$("#tags_update").trigger("chosen:updated");	
		   		    	modalDialogClose('addTagsModal');
		   		    	
	  					$("#loadingImg").hide();
	  				}else{
	  					document.getElementById("nm_tagError").innerHTML="TAGS creation failed.";
	  					document.getElementById("nm_tag").focus();
	  					$("#loadingImg").hide();
	  				}
	  			},error: function (jqXHR, exception) {
	  				$("#loadingImg").hide();
	  	            getErrorMessage(jqXHR, exception);
		        }});
			} else {
				document.getElementById("nm_tagError").innerHTML="Please enter valid TAGS.";
				document.getElementById("nm_tag").focus();
			}
		}
		
		function addDocumentType(){
			$('#addDocumentTypeModal').modal('show');
			document.getElementById("nm_documentTypeError").innerHTML="";
			document.getElementById("nm_documentType").value="";			
		}
	  
		function validateDocumentType(selVal){
  	    	$("#loadingImg").show();
  	    	$.ajax({url : "<%=request.getContextPath()%>/validateTypes?typeTable=document_type&typeValue="+selVal,type:'post',success : function(data){
  				if($.trim(data) != '' && data != 'failed'){
  					document.getElementById("nm_documentTypeError").innerHTML="Already exists";
  					document.getElementById("nm_documentType").value="";
  					document.getElementById("nm_documentType").focus();
  					$("#loadingImg").hide();
  				}else{
  					document.getElementById("nm_documentTypeError").innerHTML="";
  					$("#loadingImg").hide();
  				}
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
	        	}}
  			);
		}
		
		function createDocumentType(){
			var nDocumentType = $('#nm_documentType').val();
			if($.trim(nDocumentType) != ''){
	  	    	$("#loadingImg").show();
	  	    	$.ajax({url : "<%=request.getContextPath()%>/createTypeValues?typeTable=document_type&typeValue="+nDocumentType,type:'post',success : function(data){
	  				if($.trim(data) != '' && data != 'failed'){
	  					document.getElementById("nm_documentTypeError").innerHTML="Document Type added.";
	  					document.getElementById("nm_documentType").value="";
	  					
   		    			var options ='<option value='+$.trim(data)+' selected = "selected">'+nDocumentType+'</option>'
		   		    	$("#type_update").append(options);	
		   		    	$("#type_update").trigger("chosen:updated");	
		   		    	modalDialogClose('addDocumentTypeModal');
		   		    	
	  					$("#loadingImg").hide();
	  				}else{
	  					document.getElementById("nm_documentTypeError").innerHTML="Document Type creation failed.";
	  					document.getElementById("nm_documentType").focus();
	  					$("#loadingImg").hide();
	  				}
	  			},error: function (jqXHR, exception) {
	  				$("#loadingImg").hide();
	  	            getErrorMessage(jqXHR, exception);
		        }});
			} else {
				document.getElementById("nm_documentTypeError").innerHTML="Please enter valid Document Type.";
				document.getElementById("nm_documentType").focus();
			}
		}
		
		function addRevisionType(){
			$('#addRevisionTypeModal').modal('show');
			document.getElementById("nm_revisionTypeError").innerHTML="";
			document.getElementById("nm_revisionType").value="";			
		}
	  
		function validateRevisionType(selVal){
  	    	$("#loadingImg").show();
  	    	$.ajax({url : "<%=request.getContextPath()%>/validateTypes?typeTable=revision_type&typeValue="+selVal,type:'post',success : function(data){
  				if($.trim(data) != '' && data != 'failed'){
  					document.getElementById("nm_revisionTypeError").innerHTML="Already exists";
  					document.getElementById("nm_revisionType").value="";
  					document.getElementById("nm_revisionType").focus();
  					$("#loadingImg").hide();
  				}else{
  					document.getElementById("nm_revisionTypeError").innerHTML="";
  					$("#loadingImg").hide();
  				}
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
	        	}}
  			);
		}
		
		function createRevisionType(){
			var nRevisionType = $('#nm_revisionType').val();
			if($.trim(nRevisionType) != ''){
	  	    	$("#loadingImg").show();
	  	    	$.ajax({url : "<%=request.getContextPath()%>/createTypeValues?typeTable=revision_type&typeValue="+nRevisionType,type:'post',success : function(data){
	  				if($.trim(data) != '' && data != 'failed'){
	  					document.getElementById("nm_revisionTypeError").innerHTML="Revision Type added.";
	  					document.getElementById("nm_revisionType").value="";
	  					
   		    			var options ='<option value='+$.trim(data)+' selected = "selected">'+nRevisionType+'</option>'
		   		    	$("#revision_type_update").append(options);	
		   		    	$("#revision_type_update").trigger("chosen:updated");	
		   		    	modalDialogClose('addRevisionTypeModal');
		   		    	
	  					$("#loadingImg").hide();
	  				}else{
	  					document.getElementById("nm_revisionTypeError").innerHTML="Revision Type creation failed.";
	  					document.getElementById("nm_revisionType").focus();
	  					$("#loadingImg").hide();
	  				}
	  			},error: function (jqXHR, exception) {
	  				$("#loadingImg").hide();
	  	            getErrorMessage(jqXHR, exception);
		        }});
			} else {
				document.getElementById("nm_revisionTypeError").innerHTML="Please enter valid Revision Type.";
				document.getElementById("nm_revisionType").focus();
			}
		}

		function addStructType(){
			$('#addStructTypeModal').modal('show');
			document.getElementById("nm_structTypeError").innerHTML="";
			document.getElementById("nm_structType").value="";			
		}
	  
		function validateStructType(selVal){
  	    	$("#loadingImg").show();
  	    	$.ajax({url : "<%=request.getContextPath()%>/validateTypes?typeTable=structure_type&typeValue="+selVal,type:'post',success : function(data){
  				if($.trim(data) != '' && data != 'failed'){
  					document.getElementById("nm_structTypeError").innerHTML="Already exists";
  					document.getElementById("nm_structType").value="";
  					document.getElementById("nm_structType").focus();
  					$("#loadingImg").hide();
  				}else{
  					document.getElementById("nm_structTypeError").innerHTML="";
  					$("#loadingImg").hide();
  				}
  			},error: function (jqXHR, exception) {
  				$("#loadingImg").hide();
  	            getErrorMessage(jqXHR, exception);
	        	}}
  			);
		}
		
		function createStructType(){
			var nStructType = $('#nm_structType').val();
			if($.trim(nStructType) != ''){
	  	    	$("#loadingImg").show();
	  	    	$.ajax({url : "<%=request.getContextPath()%>/createTypeValues?typeTable=structure_type&typeValue="+nStructType,type:'post',success : function(data){
	  				if($.trim(data) != '' && data != 'failed'){
	  					document.getElementById("nm_structTypeError").innerHTML="Structure Type added.";
	  					document.getElementById("nm_structType").value="";
	  					
   		    			var options ='<option value='+$.trim(data)+' selected = "selected">'+nStructType+'</option>'
		   		    	$("#structure_type_update").append(options);	
		   		    	$("#structure_type_update").trigger("chosen:updated");	
		   		    	modalDialogClose('addStructTypeModal');
		   		    	
	  					$("#loadingImg").hide();
	  				}else{
	  					document.getElementById("nm_structTypeError").innerHTML="Structure Type creation failed.";
	  					document.getElementById("nm_structType").focus();
	  					$("#loadingImg").hide();
	  				}
	  			},error: function (jqXHR, exception) {
	  				$("#loadingImg").hide();
	  	            getErrorMessage(jqXHR, exception);
		        }});
			} else {
				document.getElementById("nm_structTypeError").innerHTML="Please enter valid Structure Type.";
				document.getElementById("nm_structType").focus();
			}
		}
		
	  
		$('document').ready(function() {
			$('textarea').each(function() {
				$(this).val($(this).val().trim());
			});
		});
	    
	</script>

</body>
</html>
