<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>FMS</title>
    <link rel="stylesheet" href="../../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/login.css">
    <link rel="stylesheet" href="../../assets/css/Pretty-Registration-Form-.css">
    <link rel="stylesheet" href="../../assets/css/Toggle-Switch-toggle-switch.css">
    <link rel="stylesheet" href="../../assets/css/Toggle-Switch.css">
</head>

<body><div class="container-fluid">
		<div class="row main-content bg-gulbrandsen text-center">
			<div class="col-md-4 text-center company__info">
				<h2>
					<span class="company__logo"> <span>
                        <img 
							src="../../assets/img/Gulbrandsen.png"></span>
                        
					</span>
                    
                    
				</h2>
				<h4 class="company_title">
					Fleet Management System
                    
				</h4>
			</div>
			<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
				<div class="container-fluid">
					<div class="row">
						<h2>Log In</h2>
					</div>
					<a href="/GoogleLogin" class="btn"><img src="../../assets/img/Google.jpg" alt="GOOGLE" height="15"> Login with Google </a>
					<div class="or-div text-center">OR</div>
					<div class="row">
						<form id="login" action="/login" 
							class="form-group">
							<div class="row">
								<input type="text" name="uname" 
									class="form__input" placeholder="Username" />
							</div>
							<div class="row">
								<input type="password" name="password" 
									class="form__input" placeholder="Password" />
							</div>
							<div class="row">
								<%
									String msgafterpasschange = "" + session.getAttribute("msgafterpasschange");
									if (!msgafterpasschange.equals("") && !msgafterpasschange.equals("null")) {
								%>
								<label style="color: red;">${msgafterpasschange}</label>
								<%
									} else {
								%>
								<label style="color: red;">${error}</label>
								<%
									}
									session.removeAttribute("msgafterpasschange");
								%>
							</div>
							<div class="text-center">
								<input type="submit" value="Submit" class="btn">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<div class="container-fluid text-center footer">
		Gulbrandsen 
	</div>
    <script src="../../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../assets/js/header.js"></script>
</body>

</html>