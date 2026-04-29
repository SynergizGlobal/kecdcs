<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<fmt:setBundle basename="Placeholders" var="bndl"/>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="/kecdcs/resources/images/favicon-16x16.png" type="image/x-icon">
    <title>KEC - Login </title>  
	
	<!-- Google font -->
    <!-- <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> -->
    <!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,400italic,700,700italic' rel='stylesheet' type='text/css'> -->
	
    <!-- Bootstrap -->
    <!-- <link href="/kecdcs/resources/js/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- Font Awesome -->
    <!-- <link href="/kecdcs/resources/js/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"> -->
    
    <!-- NProgress -->
    <!-- <link href="/kecdcs/resources/js/vendors/nprogress/nprogress.css" rel="stylesheet"> -->
    <!-- <link href="/kecdcs/resources/css/animate.min.css" rel="stylesheet"> -->
    

    <!-- Custom Theme Style -->
    <!-- <link href="/kecdcs/resources/css/custom.min.css" rel="stylesheet"> -->
    <!-- Custom CSS Style -->
    
    <!-- <link href="/kecdcs/resources/css/critical.min.css" rel='stylesheet' type='text/css'> -->
    
    <!-- jQuery -->
    <script src=" /kecdcs/resources/js/vendors/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src=" /kecdcs/resources/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css">
    
    <style>
    	.login_content a:hover {
		    text-decoration: none!important;
		}
		a.btn.login-botton {
			background: #FF9800!important;
    		color: #fff!important;
		}
		p.psw a {			
    		margin: 0px 0px!important;
    		color: #000;
    		float: left;
    		font-size: 13px!important;
		}
		.backarrow a {
			color: #2b6cbf;
    		text-align: center;
    		font-size: 15px!important;
		}
		.backarrow i {
			color: #2b6cbf;
    		text-align: center;
    		font-size: 15px!important;
		}
		:root {
            --input-padding-x: .75rem;
            --input-padding-y: .75rem;
        }

        body {
            display: -ms-flexbox;
            display: -webkit-box;
            display: flex;
            padding-top: 40px;

        }

        .form-signin {
            width: 100%;
            max-width: 420px;
            padding: 15px;
            margin: 0 auto;
        }

        .form-label-group {
            position: relative;
            margin-bottom: 1rem;
        }

        .form-label-group>input,
        .form-label-group>label {
            padding: var(--input-padding-y) var(--input-padding-x);
        }

        .form-label-group>label {
            position: absolute;
            top: 0;
            left: 0;
            display: block;
            width: 100%;
            margin-bottom: 0;
            /* Override default `<label>` margin */
            line-height: 1.5;
            color: #495057;
            border: 1px solid transparent;
            border-radius: .25rem;
            transition: all .1s ease-in-out;
        }

        .form-label-group input::-webkit-input-placeholder {
            color: transparent;
        }

        .form-label-group input:-ms-input-placeholder {
            color: transparent;
        }

        .form-label-group input::-ms-input-placeholder {
            color: transparent;
        }

        .form-label-group input::-moz-placeholder {
            color: transparent;
        }

        .form-label-group input::placeholder {
            color: transparent;
        }

        .form-label-group input:not(:placeholder-shown) {
            padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
            padding-bottom: calc(var(--input-padding-y) / 3);
        }

        .form-label-group input:not(:placeholder-shown)~label {
            padding-top: calc(var(--input-padding-y) / 3);
            padding-bottom: calc(var(--input-padding-y) / 3);
            font-size: 12px;
            color: #777;
        }

        .loginbg {
            background-color: #EFF8F7;
        }
        .text-red{color:red;}
    </style>
    
    
  </head>

  <!-- <body  style="background-image: url(resources/images/login_bg1.jpg); overflow: hidden;"> -->
 <body class="">
  
  	<!-- <header id="header" class="clearfix" data-ma-theme="blue">
	  <ul class="h-inner">
	    <li class="hi-trigger ma-trigger" data-ma-action="sidebar-open" data-ma-target="#sidebar">
	     
	    </li>
	    <li class="hi-logo"> <a href="#"><img src="/kecdcs/resources/images/logo.png" ></a> </li>
	      <div class="tagline">Driving Infrastructure Forward</div>  
	 
	  </ul>
	</header> -->
	
	
<div class="container">

      <div class="card loginbg">
      
          <div class="row">
              <div class="col-6">
                  <img src="/kecdcs/resources/images/login.png" style="width: 100%;">
              </div>
              
              <div class="col-6">
                  <form class="form-signin" name="loginForm" id="loginForm" method="post" action="<%=request.getContextPath() %>/login">
                      <br><br>
                      <div class="text-center"> <img src="/kecdcs/resources/images/logo.png" width="137px" height="57px"></div>
                      <br><br>
                      <div class="text-center"><h4>Member <span class="text-red">Login</span></h4></div>
                      <br>

                       <c:if test="${not empty fail}">
			                   	<div class="text-center"><h7><span class="text-red">${fail}</span></h7></div>
			           </c:if>
			           
			             <c:if test="${not empty logout}">
			                   	<div class="text-center"><h7><span class="text-green">${logout}</span></h7></div>
			           </c:if>
                      
                   	  <label for="userId">Login ID</label>
                      <input type="text" id="userId" name="userId" maxlength="50"  placeholder="Login Id" onkeydown="return submitFormOnEnter(event);" class="form-control">
       				  <br>
                      <label for="password">Password</label>
                      <input type="password" id="password" Name="password" maxlength="20"  placeholder="Password" onkeydown="return submitFormOnEnter(event);"  class="form-control">
                      <br>
                      <div class="text-center"><button class="btn btn-lg btn-danger" type="button" onclick="login();">Login</button></div>
                      <br><br>
                     <!--  <a href="#">Forgot Password?</a> -->
                  </form>

                 <!--  <img src="/kecdcs/resources/images/login2.png" style="margin-top: 150px;"> -->
              </div>
          </div>
      </div>
      <footer>
          <br><br>
          <div class="footer text-center">
              Copyright © - <span id="year"></span>. Powered by <a href="http://www.synergizglobal.com/"
                  target="_blank">Synergiz Global Services Pvt. Ltd.</a>
          </div>
      </footer>
  </div>
<div class="clearfix"></div>

<!-- <footer>
      <div class="footer">
       Copyright  © - <span id="year"></span>. Powered by <a href="http://www.synergizglobal.com/" target="_blank">Synergiz Global Services Pvt. Ltd.</a>
      </div>
      <div class="clearfix"></div>
    </footer> -->
    
   <%--  <jsp:include page="./layout/bottomNav.jsp"></jsp:include> --%>
    
    <script type="text/javascript">
		// to click enter on input Text
		function submitFormOnEnter(event){
		  	var charCode = (event.which) ? event.which : event.keyCode
	        if (charCode == 13) {
	        	login();
	        }
	  		return true;
		}
		
		$(document).ready(function() {
			 $("#year").html(new Date().getFullYear());
			 $('#loginForm').validate({
			    rules: {
			     		"userId":{
			     			required:true
			     			
	                	},"password":{
	                		required:true
	                	}
			     	},
			    messages: {
			   			  "userId":{
			   			  	required:'Please Provide Login Id & Password'
			   			  },"password":{
	                		required:'Please Provide Login Id & Password'
		                  }
			   	},errorPlacement:function(error, element){
			   		   $("#logoutMsg").html("");
				       if(element.attr("id") == "userId" ){
						 document.getElementById("validationMessage").innerHTML="";
						 error.appendTo('#validationMessage');
				        }else if (element.attr("id") == "password" ){
						 document.getElementById("validationMessage").innerHTML="";
						 error.appendTo('#validationMessage');
			             }else{error.insertAfter(element);} 
				       
			    },submitHandler:function(form){
			    	form.submit();
			    }
			});   			  	
					
		 });
		 function login(){
			 $("#logoutMsg").html("");
			 var status=$('#loginForm').valid();
			 if(status){
			 	document.forms['loginForm'].action = "<%=request.getContextPath() %>/login";
				document.forms['loginForm'].submit();
			 }
		 }
		 
		 
		 
	 </script>
    
    
  </body>
</html>
