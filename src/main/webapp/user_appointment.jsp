<%@page import="com.org.dao.DoctorDao"%>
<%@page import="com.org.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>

<%@include file="component/allcss.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
	 body {
        background: linear-gradient(to right, #74ebd5, #9face6);
        font-family: 'Poppins', sans-serif;
    }

	.paint-card {
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
		border: none;
		border-radius: 12px;
		background: #fff;
		padding: 20px 25px;
		animation: fadeIn 0.8s ease;
	}

	.card-body {
		padding: 15px;
	}

	.fs-3 {
		font-weight: 600;
		color: #333;
	}

	.form-label {
		font-weight: 500;
	}

	.form-control {
		border-radius: 8px;
		padding: 8px 10px;
	}

	textarea.form-control {
		resize: none;
	}

	.btn-success {
		border-radius: 8px;
		font-weight: 600;
		padding: 10px;
		transition: 0.3s ease-in-out;
	}

	.btn-success:hover {
		transform: translateY(-2px);
		box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	}

	.btn-info {
		border-radius: 8px;
		font-weight: 600;
	}

	.text-success, .text-danger {
		font-weight: 500;
	}

	.backImg {
		background: url("img/banner3.jpg");
		height: 50vh;
		width: 100%;
		background-size: cover;
		background-repeat: no-repeat;
	}

	@keyframes fadeIn {
		from {
			opacity: 0;
			transform: translateY(20px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>

						<c:if test="${empty userObj}">
							<a href="user_login.jsp" class="d-flex justify-content-center title btn-danger border border-warning m-3 p-2">
								* Please Login To Take Appointment *
							</a>
						</c:if>

						<c:if test="${not empty errorMsg}">
							<p class="fs-5 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<p class="fs-5 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="appAppointment" method="post">
							<input type="hidden" name="userid" value="${userObj.id}">

							<div class="col-md-6">
								<label class="form-label">Full Name</label>
								<input required type="text" placeholder="enter full name "class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label class="form-label">Gender</label>
								<select class="form-control" name="gender" required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label">Age</label>
								<input required type="number" placeholder="enter age" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label class="form-label">Appointment Date</label>
								<input type="date" class="form-control" required name="appoint_date">
							</div>

							<div class="col-md-6">
								<label class="form-label">Email</label>
								<input required type="email" placeholder="enter email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label class="form-label">Phone No</label>
								<input maxlength="10" required type="number" placeholder="enter phone number" class="form-control" name="phno">
							</div>

							<div class="col-md-6">
								<label class="form-label">Diseases</label>
								<input required type="text" placeholder="enter diseases" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label class="form-label">Doctor</label>
								<select required class="form-control" name="doct">
									<option value="">--select--</option>
									<%
										DoctorDao dao = new DoctorDao();
										List<Doctor> list = dao.getAllDoctors();
										for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
									<%
										}
									%>
								</select>
							</div>

							<div class="col-md-12">
								<label class="form-label">Full Address</label>
								<textarea required name="address" placeholder="enter your address" class="form-control" rows="3"></textarea>
							</div>

							<c:if test="${empty userObj}">
								<a href="user_login.jsp" class="col-md-6 btn btn-info m-auto mt-3">Login</a>
							</c:if>

							<c:if test="${not empty userObj}">
								<button class="col-md-6 offset-md-3 btn btn-success mt-3">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>
