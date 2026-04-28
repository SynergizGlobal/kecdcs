		

<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 		
		<!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu navbar-fixed-top">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

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
				
				
              </ul>
               
            </nav>
            
           
            
            
          </div>
        </div>
        <!-- /top navigation -->
        
       <div class="clearfix"></div>
	   
	   
        
<script>
   
    
    function setUserIconImage(ele) {	
 		ele.src=" /kecdcs/resources/images/user-icon.png";
		return true;
	}
	
	
	
	
    
     
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

 
