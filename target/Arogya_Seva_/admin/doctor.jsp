<%@page import="com.org.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Doctor</title>
<%@include file="../component/allcss.jsp"%>

<style>
	body {
		background: linear-gradient(135deg, #e0f7fa, #f3e5f5);
		background-size: 400% 400%;
		animation: gradientShift 15s ease infinite;
		font-family: 'Segoe UI', sans-serif;
	}

	@keyframes gradientShift {
		0% {background-position: 0% 50%;}
		50% {background-position: 100% 50%;}
		100% {background-position: 0% 50%;}
	}

	.paint-card {
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 15px;
		padding: 25px;
		background-color: #ffffff;
	}

	.form-label {
		font-weight: 500;
		color: #333;
	}

	.card-body .btn-primary {
		width: 100%;
		background-color: #00796b;
		border: none;
	}

	.card-body .btn-primary:hover {
		background-color: #004d40;
	}

	.card-body input, .card-body select {
		border-radius: 8px;
	}

	.fs-3 {
		color: #004d40;
		font-weight: 600;
	}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container py-4">
		<div class="row justify-content-center">

			<div class="col-md-6 col-lg-5">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>

						<c:if test="${not empty errorMsg}">
							<p class="fs-5 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-5 text-center text-success">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> 
								<input type="text" name="fullname" required class="form-control" placeholder="Enter full name">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> 
								<input type="date" name="dob" required class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> 
								<input type="text" name="qualification" required class="form-control" placeholder="MBBS, MD, etc.">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> 
								<select name="spec" required class="form-control">
									<option value="">-- Select Specialist --</option>
									<%
										SpecialistDao dao = new SpecialistDao();
										List<Specalist> list = dao.getAllSpecialist();
										for (Specalist s : list) {
									%>
										<option><%=s.getSpecialistName()%></option>
									<%
										}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> 
								<input type="email" name="email" required class="form-control" placeholder="enter email">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> 
								<input type="text" name="mobno" required class="form-control" placeholder="Enter mobile number">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> 
								<input type="password" name="password" required class="form-control" placeholder="Create a strong password">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
