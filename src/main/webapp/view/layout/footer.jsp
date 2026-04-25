 <!-- footer content -->
    <!-- <footer>
      <div class="footer-content" style="text-align: center;">
       Copyright © - <span id="year"></span>. Powered by <a href="http://www.ircondcs.com/" target="_blank">IRCON</a>
      </div>
      <div class="clearfix"></div>
    </footer> -->
    <footer class="page-footer" style="margin: 0 auto;">
        <div class=" container text-center ">
            <p class="footer-text text-center ">Copyright <span id="year "><span id="year"></span>.</span> @<img src="/ircondcs/resources/images/logo.png " alt="ircon logo " class="footer-logo " style="height: 40px;"> | Designed &amp; Developed by
                <img src="/ircondcs/resources/images/synergiz.png " alt="synergiz logo " class="footer-logo "></p>
        </div>
    </footer>
<!-- /footer content -->

	<script>
		$(document).ready(function() {
			$("#year").html(new Date().getFullYear());
		});
	</script>