<!DOCTYPE html>
<%@page import="com.gulbrandsen.Productmaster"%>
<%@page import="com.gulbrandsen.controller.DbConnection"%>
<%@page import="com.gulbrandsen.ProductMasterDao"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>FMS</title>
<link rel="stylesheet"
	href="../../assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="../../assets/css/login.css">
<link rel="stylesheet"
	href="../../assets/css/Pretty-Registration-Form-.css">
<link rel="stylesheet"
	href="../../assets/css/Toggle-Switch-toggle-switch.css">
<link rel="stylesheet" href="../../assets/css/Toggle-Switch.css">
</head>

<body>

	<nav class="navbar navbar-light navbar-expand-md fixed-top bg-light"
		style="font-weight: bold; border-bottom: 1px solid #198754;">
		<div class="container-fluid">
			<a class="navbar-brand" href="#" style="padding: 0;"><img
				height="40px" src="../../assets/img/Gulbrandsen.png"><span
				style="font-size: 1.2rem; font-weight: bold; margin-left: 0.5rem;">Container
					Tracking System</span><span
				style="font-size: 0.6rem; font-weight: bold; margin-left: 0.1rem;">(Ver
					1.0)</span></a>
			<button data-bs-toggle="collapse" class="navbar-toggler"
				data-bs-target="#navcol-1">
				<span class="visually-hidden">Toggle navigation</span><span
					class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navcol-1">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item dropdown show"><a
						class="dropdown-toggle nav-link" aria-expanded="true"
						data-bs-toggle="dropdown" href="#">Administration</a>
						<div class="dropdown-menu" data-bs-popper="none">
							<a class="dropdown-item" href="#">User Rights</a><a
								class="dropdown-item" href="#">Update Tank Location</a>
						</div></li>
					<li class="nav-item dropdown show"><a
						class="dropdown-toggle nav-link" aria-expanded="true"
						data-bs-toggle="dropdown" href="#">Masters</a>
						<div class="dropdown-menu" data-bs-popper="none">
							<a class="dropdown-item" href="#">Tanker Master</a><a
								class="dropdown-item" href="productmaster.jsp">Product
								Master</a><a class="dropdown-item" href="#">Customer master</a><a
								class="dropdown-item" href="#">Tank - Product Mapping</a><a
								class="dropdown-item" href="#">User Master</a>
						</div></li>
					<li class="nav-item dropdown show"><a
						class="dropdown-toggle nav-link" aria-expanded="true"
						data-bs-toggle="dropdown" href="#">Scheduling</a>
						<div class="dropdown-menu" data-bs-popper="none">
							<a class="dropdown-item" href="#">Track Tracker</a><a
								class="dropdown-item" href="#">Track Tanker History</a><a
								class="dropdown-item" href="#">Track Container History&nbsp;</a><a
								class="dropdown-item" href="#">Track Container History</a><a
								class="dropdown-item" href="#">Teal Tank Tracking</a><a
								class="dropdown-item" href="#">Mass Update for Teal Tank
								Tracking</a><a class="dropdown-item" href="#">Mass Update using
								Invoice Number</a><a class="dropdown-item" href="#">Mass Updater
								using BL</a><a class="dropdown-item" href="#">GCI Addkor Teal
								Transfer</a><a class="dropdown-item" href="#">GulEC Teal
								Transfer</a><a class="dropdown-item" href="#">Belfruco Teal
								Transfer</a><a class="dropdown-item" href="#">Laporte Teal
								Transfer</a><a class="dropdown-item" href="#">Kanoo Teal
								Transfer</a><a class="dropdown-item" href="#">Invoice Mapping</a><a
								class="dropdown-item" href="#">SAP Customer Mapping&nbsp;</a><a
								class="dropdown-item" href="#">SAP Product Mapping</a><a
								class="dropdown-item" href="#">SAP Product Category Mapping</a><a
								class="dropdown-item" href="#">Dahej Transfer</a><a
								class="dropdown-item" href="#">BRC upload</a>
						</div></li>
					<li class="nav-item dropdown show"><a
						class="dropdown-toggle nav-link" aria-expanded="true"
						data-bs-toggle="dropdown" href="#">ACAS</a>
						<div class="dropdown-menu" data-bs-popper="none">
							<a class="dropdown-item" href="#">Condition Master</a><a
								class="dropdown-item" href="#">Tank Allocation</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="dropdown-toggle nav-link" aria-expanded="false"
						data-bs-toggle="dropdown" href="#">Report</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">First Item</a><a
								class="dropdown-item" href="#">Second Item</a><a
								class="dropdown-item" href="#">Third Item</a>
						</div></li>
					<li class="nav-item dropdown show"><a
						class="dropdown-toggle nav-link" aria-expanded="true"
						data-bs-toggle="dropdown" href="#">Tame Booking</a>
						<div class="dropdown-menu" data-bs-popper="none">
							<a class="dropdown-item" href="#">Tame Booking</a>
						</div></li>
					<li class="nav-item dropdown show"><a
						class="dropdown-toggle nav-link" aria-expanded="true"
						data-bs-toggle="dropdown" href="#">TEAL TOTE TRAVELLER</a>
						<div class="dropdown-menu" data-bs-popper="none">
							<a class="dropdown-item" href="#">Dashboard</a><a
								class="dropdown-item" href="#">Maintenance</a><a
								class="dropdown-item" href="#">Operations</a><a
								class="dropdown-item" href="#">QC Inspection</a><a
								class="dropdown-item" href="#">Container Stuffing</a><a
								class="dropdown-item" href="#">Tank Dispatch</a><a
								class="dropdown-item" href="#">At Dahej Section&nbsp;</a><a
								class="dropdown-item" href="#">In Transit to Warehouse
								Section</a><a class="dropdown-item" href="#">In Transit to
								customer Section</a><a class="dropdown-item" href="#">At
								Customer Section</a><a class="dropdown-item" href="#">In Transit
								From Customer</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="dropdown-toggle nav-link" aria-expanded="false"
						data-bs-toggle="dropdown" href="#"><i class="far fa-user"></i>${username}</a>
						<div class="dropdown-menu dropdown-menu-end"
							style="font-size: 0.9rem;">
							<a class="dropdown-item" href="#changePasswordModal"
								style="font-weight: bold;" data-bs-toggle="modal"><i
								class="fa fa-gear"></i>&nbsp;Change Password</a><a
								class="dropdown-item" href="/Logout" style="font-weight: bold;"><i
								class="fa fa-sign-out"></i>&nbsp;Logout</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="row mt-5">
		<div class="col-md-8 offset-md-2">

			<%
			int id = Integer.parseInt(request.getParameter("id"));
			ProductMasterDao dao = new ProductMasterDao(DbConnection.getconn());
			Productmaster pro = dao.getDataById(id);
			%>
			<form class="custom-form mt-5 mb-5 pt-0" action="/UpdateData"
				style="box-shadow: inset 0px 0px 6px; width: 600px; height: 600px; margin-right: 231px; margin-left: 231px; margin-top: 50px; margin-bottom: 50px;">
				<h3 class="text-center mb-3 mt-3"
					style="text-shadow: 0px 0px 0px; padding-top: 20px;">Product
					Master</h3>
				<div class="row form-group my-4 mx-4 mt-4">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field"
							style="font-size: 14px;">Product Group*</label>
					</div>
					<div class="col-sm-6 input-column">
						<select class="form-select" required name="productGroup">
							<optgroup label="This is a group">

								<option value="1" selected="">ANH</option>
								<option value="2">TIN</option>
								<option value="3">PEWAX</option>
								<option value="14">P1062</option>
								<option value="14">Aluminium Alkyls</option>
								<option value="14">Others</option>
							</optgroup>
						</select>
					</div>
				</div>
				<div class="row form-group my-4 mx-4">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" type="text" style="font-size: 14px;">Product
							Code</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" required type="text" name="productCode"  value="<%=pro.getProductCode()%>"  >
					</div>
				</div>
				<div class="row form-group my-4 mx-4">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" type="text" style="font-size: 14px;">Product
							Name*</label>
					</div>
					<div class="col-sm-7 input-column">
						<input class="form-control" required type="text" name="productName"
							value="productname">
					</div>
				</div>
				<div class="row form-group my-4 ms-4">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="text"
							style="font-size: 14px;">SAP Product Code</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control"  type="text" name="sap"
							style="margin-left: -12px;">
					</div>
				</div>
				<div class="row form-group mx-3 ps-0 ms-4">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="dropdown-input-field"
							style="font-size: 14px;">Status</label>
					</div>
					<div class="col-sm-4 input-column" name="status">
						<label class="switch"> <input type="checkbox" checked>
							<span class="slider round"></span>
						</label>
					</div>
				</div>
				<div class="row mx-4" style="margin-top: 30px; padding-left: 34px;">
					<div class="col-md-4 col-xxl-4">
						<button class="btn btn-primary"
							style="width: 150px; height: 42px;" type="Submit" value="Update">Update</button>
					</div>
					<div class="col" style="margin-left: 35px;">
						<a href="productmaster.jsp"><button class="btn btn-primary"
								type="button"
								style="margin-right: 24px; margin-bottom: 31px; padding-top: 0px; padding-bottom: 16px; width: 150px; margin-top: 27px; text-align: center;">Cancel</button></a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="../../assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/js/header.js"></script>
</body>

</html>