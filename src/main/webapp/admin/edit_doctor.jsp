<%@page import="com.org.entity.Doctor"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@page import="com.org.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Doctor</title>
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
	padding: 25px;
	margin-top: 50px;
}

.fs-3 {
	font-weight: 600;
	color: #1a237e;
}

.form-label {
	font-weight: 500;
}

input.form-control, select.form-control {
	border-radius: 8px;
	border: 1px solid #b0bec5;
	font-size: 15px;
	padding: 10px;
}

input.form-control:focus, select.form-control:focus {
	border-color: #1e88e5;
	box-shadow: 0 0 5px rgba(30, 136, 229, 0.5);
}

.btn-primary {
	background-color: #1565c0;
	border: none;
	border-radius: 25px;
	padding: 10px;
	font-size: 16px;
	font-weight: 500;
	transition: 0.3s ease;
}

.btn-primary:hover {
	background-color: #0d47a1;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>

						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<%
							int id = Integer.parseInt(request.getParameter("id"));
							DoctorDao dao2 = new DoctorDao();
							Doctor d = dao2.getDoctorsById(id);
						%>

						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> 
								<input type="text" required name="fullname" class="form-control" value="<%=d.getFullName()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> 
								<input type="date" value="<%=d.getDob()%>" required name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> 
								<input required value="<%=d.getQualification()%>" name="qualification" type="text" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> 
								<select name="spec" required class="form-control">
									<option><%=d.getSpecialist()%></option>
									<%
										SpecialistDao dao = new SpecialistDao();
										List<Specalist> list = dao.getAllSpecialist();
										for (Specalist s : list) {
									%>
										<option><%=s.getSpecialistName()%></option>
									<% } %>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> 
								<input type="text" value="<%=d.getEmail()%>" required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> 
								<input type="text" value="<%=d.getMobNo()%>" required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> 
								<input required value="<%=d.getPassword()%>" name="password" type="text" class="form-control">
							</div>

							<input type="hidden" name="id" value="<%=d.getId()%>">
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
