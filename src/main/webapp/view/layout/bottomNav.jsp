<%@page import="com.synergizglobal.ircondcs.model.User"%>
<%@page import="com.synergizglobal.ircondcs.model.Folder"%>
<%@page import="java.util.ArrayList"%>
<%
	User user = (User) session.getAttribute("USER");
%>
<div class="menu navbar-fixed-top" role="navigation" >
            <div class="container">
            <div class="row">
            <div class="col-md-3">  <div class="navbar-header" style="width: 550px;">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse.one">
                        <span class="sr-only">Toggle navigation</span> <i class="fa fa-bars"></i>
                    </button>
                    <!-- <a class="navbar-brand m" href="documents?folderId=0&levelId=1"> -->	
                    <a class="navbar-brand m " style="color: #fff;font-weight:bold; font-size: 20px;" href="corresDocumentSearch">
                  DFC Project, Package CTP12</a>
                </div></div>
             <div class="col-md-6 text-center"><div style=" color: #fff; padding: 10px; font-weight:bold; font-size: 20px; class="d-none d-md-block ">Document Management System</div></div>
              <div class="col-md-3">  <div class="collapse navbar-collapse one">
                    <!-- <ul class="nav navbar-nav navbar-right">
                        <li><a href="#" target="_blank">logo</a></li>
                    </ul> -->
                    <ul class="nav navbar-nav list navbar-right">                        

		                <li class="nav-item dropdown">
		                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"><i class="fa fa-user"></i><span><%=session.getAttribute("USER_NAME") %></span></a>
		                    <ul class="dropdown-menu">
		                    	<%if(user.getRoleName().equalsIgnoreCase("ADMIN")) { %>
			                        <li><a class="dropdown-item" href="#"  onclick="adminLogin()">Go to Admin</a></li>
			                     <%} %>
			                     <li><a class="" href="/ircondcs/resources/IRCON-DMS-USER-MANUAL-Final-V1.pdf" download="IRCON-DMS-USER-MANUAL-Final-V1.pdf">Manual</a></li>
			                     <li><a class="dropdown-item" href="reset-password">Reset password</a></li>
			                     <li><a class="dropdown-item" href="logout">Logout</a></li>
		                    </ul>
		                </li>
                        
                        <!-- <li><a href="logout"><i class="fa fa-user "></i><span>Logout</span></a></li> -->
                    </ul>
                </div><!--/.nav-collapse --></div>
            </div>
              
                
              
            </div>
        </div>
    <!-- bottom navigation bar ends here  -->
<script type="text/javascript">
        $(document).ready(function() {

            $(document).on('click', '.dropdown-menu', function(e) {
                e.stopPropagation();
            });

            // make it as accordion for smaller screens
            if ($(window).width() < 992) {
                $('.dropdown-menu a').click(function(e) {
                    e.preventDefault();
                    if ($(this).next('.submenu').length) {
                        $(this).next('.submenu').toggle();
                    }
                    $('.dropdown').on('hide.bs.dropdown', function() {
                        $(this).find('.submenu').hide();
                    })
                });
            }

        });
    </script>

    <style type="text/css">
        .dropdown-menu .dropdown-toggle:after {
            border-top: .3em solid transparent;
            border-right: 0;
            border-bottom: .3em solid transparent;
            border-left: .3em solid;
        }
        
        .dropdown-menu .dropdown-menu {
            margin-left: 0;
            margin-right: 0;
        }
        
        .dropdown-menu li {
            position: relative;
        }
        
        .nav-item .submenu {
            display: none;
            position: absolute;
            left: -90%;
            top: -7px;
        }
        
        .nav-item .submenu-left {
            right: 100%;
            left: auto;
        }
        
        .dropdown-menu>li:hover {
            background-color: #fffff
        }
        
        .dropdown-menu>li:hover>.submenu {
            display: block;
		    left: -253px;
		    top: 5px;
		    width: 252px;
        }
        .dropdown-menu>li>a {
			background-color: #1B3D8F!important;
		}
		.nav.navbar-right>li:hover>a {
			color: #fffff !important;
			background: #1B3D8F!important;
		}

		.dropdown-menu>li>a:hover,
		.dropdown-menu>li>a:focus {
			color: #1B3D8F;
		}
    </style>
    
     <form class="form-signin" name="loginForm" id="loginForm" method="post">
         <input type="hidden" id="userId" name="userId" maxlength="50" value="<%=user.getEmailId() %>"  placeholder="Login Id" class="form-control">
         <input type="hidden" id="password" Name="password" maxlength="20" value="<%=user.getPassword() %>" placeholder="Password" class="form-control">
     </form>

     <script>
	 function adminLogin(){
	 	document.getElementById('loginForm').action = "https://www.syntrackpro.com/ircondcsadmin/login";
		document.getElementById('loginForm').submit();
	 }
     </script>