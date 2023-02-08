<!DOCTYPE html>
<%@page import="com.gulbrandsen.Productmaster"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">
</head>

<body>
    
	<nav class="navbar navbar-light navbar-expand-md  bg-light"
		style="font-weight: bold; border-bottom: 1px solid #198754;">
		<div class="container-fluid">
			<a class="navbar-brand" href="#" style="padding: 0;"><img
				height="40px" src="../../assets/img/Gulbrandsen.png"><span
				style="font-size: 1.2rem; font-weight: bold; margin-left: 0.5rem;">Container Tracking System</span><span
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
	
			
				<div>
				    <div class="container">
					<div class="row" style="margin-top: 8px;margin-bottom: 38px;padding-top: 32px";>
						<div class="col-md-9 offset-md-1">
							<h4 class="text-center">Product Master</h4>
						</div>
						<div class="col-md-2 offset-md-0">
							<a href="productform.jsp">
								<button class="btn btn-primary" type="button"
									style="padding-top: 0px; margin-top: 4px; margin-bottom: 30px;">ADD
									NEW</button>
							</a>
						</div>
					</div>

					<div>
						<div class="sbl">
							<table class="tbl cell-border hover display compact"
								style="width: 100%">
								<thead>
									<tr>
										<th></th>
										<th>Id</th>
										<th>Product Code</th>
										<th>Product Name</th>
										<th>Group</th>
										<th>Status</th>
									    <th>SAP Product Code</th>
									
									</tr>
								</thead>
								<tbody>
									<%
									ProductMasterDao dao = new ProductMasterDao(DbConnection.getconn());
									List<Productmaster> showRecord = dao.selectAll();
									for (Productmaster pro : showRecord) {
									%>
									<tr>
										<td><a
											href="UpdateForm.jsp?id=<%=pro.getProductGroup()%>"> <i
												class="far fa-edit" style="font-size: 28px"></i>
										</a></td>
										<td><%=pro.getProductGroup()%></td>
										<td><%=pro.getProductCode()%></td>
										<td><%=pro.getProductName()%></td>
										<td><%=pro.getStatus()%></td>
										<td><%=pro.getSap()%></td>
										<td><%=pro.getId() %></td>
										
										
										<a href="UpdateForm.jsp?id=<%=pro.getProductGroup()%>"></a>

									</tr>
									<%
									}
									%>

								</tbody>

							</table>
							<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
							<script
								src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js">
								
							</script>
							<script>
								$(document).ready(function() {
									$('.tbl').DataTable();
								});
							</script>

						</div>
					</div>
				</div>
			</div>
	</nav>
	<script src="../../assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/js/header.js"></script>
</body>

</html>