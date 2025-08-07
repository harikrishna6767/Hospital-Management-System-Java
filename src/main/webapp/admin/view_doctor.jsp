<%@page import="com.org.entity.Doctor"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@page import="com.org.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Doctors</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
body {
	background: linear-gradient(to right, #f0f4f7, #e3f2fd);
	min-height: 100vh;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: #0d1b2a;
}

.paint-card {
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
	border-radius: 12px;
	background-color: #ffffff;
	padding: 20px;
}



.fs-3 {
	font-weight: 600;
	color: #1a237e;
}

.table {
	background-color: #fefefe;
	border-radius: 8px;
	overflow: hidden;
}

.table thead {
	background-color: #1565c0;
	color: #ffffff;
}

.table tbody tr:hover {
	background-color: #e3f2fd;
	transition: 0.3s ease;
}

.table td, .table th {
	vertical-align: middle;
	font-size: 15px;
}

.btn-primary, .btn-danger {
	border-radius: 20px;
	font-size: 13px;
	padding: 5px 14px;
}

.table-responsive {
	border-radius: 10px;
	overflow-x: auto;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="backImg"></div>

		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>

						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<p class="fs-3 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Full Name</th>
										<th>DOB</th>
										<th>Qualification</th>
										<th>Specialist</th>
										<th>Email</th>
										<th>Mob No</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
										DoctorDao dao2 = new DoctorDao();
										List<Doctor> list2 = dao2.getAllDoctors();
										for (Doctor d : list2) {
									%>
									<tr>
										<td><%=d.getFullName()%></td>
										<td><%=d.getDob()%></td>
										<td><%=d.getQualification()%></td>
										<td><%=d.getSpecialist()%></td>
										<td><%=d.getEmail()%></td>
										<td><%=d.getMobNo()%></td>
										<td>
											<a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
											<a href="../deleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
										</td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div> <!-- end table-responsive -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
