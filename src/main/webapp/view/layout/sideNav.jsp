	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page session="true" %>

		
<div class="theme-deep-orange">
    
    
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="#" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="#" class="bars"></a>
                <a class="navbar-brand" href="home"><img src=" /kecdcs/resources/images/logo.png" width="100%" alt="Syntrack"/></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    
                    
                    <li class="">
                    	<a href="javascript:void(0);" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		                  	 <img style="margin-top: -3px;" src=" /kecdcs/resources/images/user-icon.png" onerror = "setUserIconImage(this);"/>
		                    
							 ${sessionScope.USER.userName }
		                    <span class=" fa fa-angle-down"></span>
		                  </a>
		                  
		                  <ul class="dropdown-menu dropdown-usermenu pull-right">
			                    <!-- <li><a href="profile"> Profile</a></li> -->
			                    <li><a href="logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
		                  </ul>
		                  
                    </li>
                    <!-- <li class="pull-right"><a href="#" class="js-right-sidebar" data-close="true"><i class="material-icons">more_vert</i></a></li> -->
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->	

   <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <div class="user-info">                
                
            </div>
            <div class="menu">
                <ul class="list">
                    <li><a href="home"><i class="fa fa-home"></i><span>Home</span></a></li>
                    <!-- <li><a href="templates"><i class="fa fa-briefcase"></i><span>Templates</span></a></li> -->
                    <li><a href="uploads"><i class="fa fa-upload"></i><span>Bulk Upload</span></a></li>
                    <!-- <li><a href="tasks"><i class="fa fa-file"></i><span>Tasks</span></a></li> -->
                    <li><a href="users"><i class="fa fa-user"></i><span>Users</span></a></li>
                    <!-- <li><a href="reports"><i class="fa fa-line-chart"></i><span>Reports</span></a></li> -->
                    <!-- <li><a href="input-sheet"><i class="fa fa-certificate"></i><span>Approve Input</span></a></li>
                     -->
                    <li><a href="javascript:void(0);" class="menu-toggle"><i class="fa fa-tasks"></i><span>Activities</span></a>
                         <ul class="ml-menu">
                             
                             <%-- <c:if test="${not empty accessList }">
		                    	<c:forEach var="template" items="${accessList }">
			                    	<li class="${fn:toLowerCase(template.templateName)}"><a href="${fn:toLowerCase(template.templateName)}">${template.templateName }</a></li>
		                    	</c:forEach>
			                 </c:if> --%>
			                 
			                 <li class="activities"><a class="menu-toggle" href="javascript:void(0);">Activities</a>
			                 	<ul class="ml-menu">
					                 <li><a href="activities">Activities</a></li>
					                 <li><a href="activity-status">Activity Status</a></li>
		                         </ul>
			                 </li>
			                 <!-- <li class="wbs"><a class="menu-toggle" href="javascript:void(0);">WBS</a>
			                 	<ul class="ml-menu">
					                 <li><a href="wbs">WBS</a></li>
					                 <li><a href="wbs-category">WBS Category</a></li>
		                         </ul>
			                 </li> -->
			                 <li class="contractors"><a class="menu-toggle" href="javascript:void(0);">Contractors</a>
			                 	<ul class="ml-menu">
					                 <li><a href="contractors">Contractors</a></li>
					                 <li><a href="company-type">Company Types</a></li>
					                 <li><a href="city">City</a></li>
					                 <li><a href="state">State</a></li>
		                         </ul>
			                 </li>
			                 <li class="issues"><a class="menu-toggle" href="javascript:void(0);">Issues</a>
			                 	<ul class="ml-menu">
					                 <li><a href="issues">Issues</a></li>
					                 <li><a href="issue-priority">Issue Priority</a></li>
					                 <li><a href="issue-status">Issue Status</a></li>
					                 <li><a href="issue-category">Issue Category</a></li>
		                         </ul>
			                 </li>
			                 <li class="ncr"><a class="menu-toggle" href="javascript:void(0);">NCR</a>
			                 	<ul class="ml-menu">
					                 <li><a href="ncr">NCR</a></li>
					                 <li><a href="ncr-priority">NCR Priority</a></li>
					                 <li><a href="ncr-stage">NCR Stage</a></li>
					                 <li><a href="ncr-category">NCR Category</a></li>
					                 <li><a href="ncr-issue-raised">NCR Issue Raised</a></li>
					                 <li><a href="ncr-type">NCR Type</a></li>
		                         </ul>
			                 </li>
			                 <li class="tenders"><a class="menu-toggle" href="javascript:void(0);">Tenders</a>
			                 	<ul class="ml-menu">
					                 <li><a href="tenders">Tenders</a></li>
					                 <li><a href="bid-status">Bid Status</a></li>
					                 <li><a href="funding-agency">Funding Agency</a></li>
					                 <li><a href="cost-based-classification">Cost based classification</a></li>
					                 <li><a href="contract-category">Contract Category</a></li>
					                 <li><a href="contract-type">Contract Type</a></li>
		                         </ul>
			                 </li>
			                 <li class="safety"><a class="menu-toggle" href="javascript:void(0);">Safety</a>
			                 	<ul class="ml-menu">
					                 <li><a href="safety">Safety</a></li>
					                 <li><a href="safety-category">Safety category</a></li>
					                 <li><a href="safety-root-cause">Safety root cause</a></li>
					                 <li><a href="safety-incident-status">Safety incident status</a></li>
					                 <li><a href="safety-likelihood">Safety likelihood</a></li>
					                 <li><a href="safety-impact">Safety impact</a></li>
					                 <li><a href="safety-severity">Safety severity</a></li>
					                 <li><a href="safety-department">Safety department</a></li>
		                         </ul>
			                 </li>
			                 <li class="risks"><a class="menu-toggle" href="javascript:void(0);">Risks</a>
			                 	<ul class="ml-menu">
					                 <li><a href="risks">Risks</a></li>
					                 <li><a href="risk-category">Risk category</a></li>
					                 <li><a href="risk-area">Risk area</a></li>
					                 <li><a href="risk-probability">Risk probability</a></li>
					                 <li><a href="risk-status">Risk status</a></li>
					                 <li><a href="risk-impact">Risk impact</a></li>
					                 <li><a href="risk-ranking">Risk ranking</a></li>
		                         </ul>
			                 </li>
			                 
			                 <li><a class="" href="locations">Locations</a>
                         </ul>
                    </li>
		           <li><a href="logout"><i class="fa fa fa-sign-out"></i><span>Logout</span></a></li>
                    
                </ul>
            </div>
        </aside>
        <!-- #END# Left Sidebar -->
    </section>		
		
 </div>	
 
       <%--  <jsp:include page="./topNav.jsp"></jsp:include> --%>
 
    <script src=" /kecdcs/resources/js/jquery.slimscroll.js"></script>    
    <script src=" /kecdcs/resources/js/waves.js"></script>
   	<script src=" /kecdcs/resources/js/admin.js"></script>


 <script>
	
	$(document).ready(function() {
		// get current URL path and assign 'active' class
		var pathname = window.location.pathname;
		var temp = pathname.split("/");
		var name = temp[temp.length-1];
		var test = "home templates uploads tasks users reports input-sheet";
		if(test.indexOf(name)){
			$('.list > li > a[href="'+name+'"]').parent().addClass('active');
		}
		
		/* if(test.indexOf(name) < 0 ){
			$('.'+name).addClass('active');
			$('.menu-toggle').addClass('active');
			$('.ml-menu').toggle(); 
		} */
		
	})

	
</script>
        
        <script>
        
	        function setErrorImage(ele) {	
		 		ele.src=" /kecdcs/resources/images/user-icon.png";
				return true;
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
