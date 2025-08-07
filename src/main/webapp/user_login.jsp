<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Page</title>

<%@ include file="component/allcss.jsp"%>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style type="text/css">
	body {
		background: linear-gradient(to right, #74ebd5, #9face6);
		font-family: 'Poppins', sans-serif;
	}

	.paint-card {
		box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
		border: none;
		border-radius: 15px;
		animation: slideFadeIn 1s ease;
		background: #ffffff;
		padding: 25px 20px;
	}

	.card-body {
		padding: 20px;
	}

	.form-label {
		font-weight: 500;
		color: #333;
	}

	.form-control {
		border-radius: 8px;
		padding: 10px;
		transition: border-color 0.3s ease-in-out;
	}

	.form-control:focus {
		border-color: #007bff;
		box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
	}

	.btn.bg-success {
		background-color: #28a745 !important;
		border-radius: 8px;
		font-weight: 600;
		padding: 10px;
		transition: transform 0.2s ease, box-shadow 0.2s ease;
	}

	.btn.bg-success:hover {
		background-color: #218838 !important;
		transform: translateY(-2px);
		box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
	}

	.fs-4.text-center {
		font-weight: 600;
		color: #333;
		margin-bottom: 20px;
	}

	.text-success, .text-danger {
		font-weight: 500;
	}

	/* Entry Animation */
	@keyframes slideFadeIn {
		from {
			opacity: 0;
			transform: translateY(30px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	.backImg {
		background: url("img/banner4.png");
		height: 40vh;
		width: 100%;
		background-size: cover;
		background-repeat: no-repeat;
	}
</style>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Login</p>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-5">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="userLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label>
								<input required name="email" type="email" placeholder="enter email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label>
								<input required name="password" placeholder="enter password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>

						<br> Don't have an account? <a href="signup.jsp"
							class="text-decoration-none"> create one</a>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>
