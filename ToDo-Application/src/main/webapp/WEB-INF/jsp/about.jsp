<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Global Styles */
body {
	font-family: Arial, sans-serif;
}

/* Header */
header {
	background-color: white;
	color: rgb(0, 0, 0);
	padding: 10px 0;
	position: fixed;
	width: 100%;
	z-index: 100;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.2);
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 5px auto;
	padding: 0 20px;
}

.logo {
	font-size: 1.5rem;
	font-weight: bold;
	color: #40b736;
}

.nav-links {
	list-style: none;
	display: flex;
}

.nav-links li {
	margin-right: 20px;
}

.nav-links a {
	color: rgb(0, 0, 0);
	padding: 10px;
	font-weight: bold;
	text-decoration: none;
}

.nav-links a:hover {
	background-color: #40b736;
	border-radius: 4px;
	color: white;
}

/* About Section */
.about {
	background: rgb(224, 251, 222);
	background: linear-gradient(360deg, rgb(245, 255, 245) 0%,
		rgb(173, 252, 163) 100%);
	padding: 100px 0 20px 0;
	text-align: center;
}

.about h1 {
	font-size: 2.5rem;
	margin-bottom: 20px;
}

.about p {
	font-size: 1rem;
	color: #323030;
	max-width: 800px;
	margin: 0 auto;
}

.about-info {
	margin: 2rem 2rem;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: left;
}

.about-img {
	width: 20rem;
	height: 20rem;
}

.about-img img {
	width: 100%;
	height: 100%;
	border-radius: 5px;
	object-fit: contain;
}

.about-info p {
	font-size: 1.3rem;
	margin: 0 2rem;
	text-align: justify;
}

button {
	border: none;
	outline: 0;
	padding: 10px;
	margin: 2rem;
	font-size: 1rem;
	color: white;
	background-color: #40b736;
	text-align: center;
	cursor: pointer;
	width: 15rem;
	border-radius: 4px;
}

button:hover {
	background-color: #1f9405;
}

/* Team Section */
.team {
	padding: 30px 0;
	text-align: center;
}

.team h1 {
	font-size: 2.5rem;
	margin-bottom: 20px;
}

.team-cards {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 15px;
	margin-top: 20px;
}

.card {
	background-color: white;
	border-radius: 6px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
	overflow: hidden;
	transition: transform 0.2s, box-shadow 0.2s;
	width: 18rem;
	height: 25rem;
	margin-top: 10px;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.5);
}

.card-img {
	width: 18rem;
	height: 12rem;
}

.card-img img {
	width: 100%;
	height: 100%;
	object-fit: fill;
}

.card-info button {
	margin: 2rem 1rem;
}

.card-name {
	font-size: 2rem;
	margin: 10px 0;
}

.card-role {
	font-size: 1rem;
	color: #888;
	margin: 5px 0;
}

.card-email {
	font-size: 1rem;
	color: #555;
}

/* Footer */
footer {
	background-color: #222;
	color: white;
	text-align: center;
	padding: 20px 0;
}

@media ( max-width : 768px) {
	nav {
		display: block;
	}
	.logo {
		text-align: center;
	}
	.nav-links {
		margin-top: 1rem;
		justify-content: space-between;
	}
	.nav-links li {
		margin-right: 0;
	}
	.about h1 {
		font-size: 2rem;
	}
	.about p {
		font-size: 0.9rem;
	}
	.about-info {
		flex-direction: column;
		text-align: center;
	}
	.about-img {
		width: 60%;
		height: 60%;
		margin-bottom: 1rem;
	}
	.about-info p {
		margin: 1rem 2rem;
	}
	.about-info button {
		margin: 1rem 2rem;
		width: 10rem;
	}
	.team {
		margin: 0 1rem;
	}
}
</style>
</head>
<body>

      

	 <header>
		<nav>
			<div class="logo">ToDo What else?</div>
			<ul class="nav-links">
               	<li><a href="/viewToDoList">  Home</a></li>
				<li><a href="/login"> Log out</a></li>
			</ul>
		</nav>
	</header> 

	<section class="about">
		<h1>Welcome</h1>

		<div class="about-info">
			<div class="about-img">
				<img
					src="https://blog.goodbarber.com/photo/gal/pic/gal-25193373.jpg?v=1688982840&force_webp=1"
					alt="img">
			</div>
			<div>
				<p>Welcome to our App! We're on a mission to simplify
					your life by helping you manage your tasks effortlessly. With our
					intuitive interface, and customizable lists, 
					 staying organized has never been easier. Join
					us today and take control of your to-dos with ease.</p>
				<button>Thank You</button>
			</div>
		</div>
	</section>
   
   <section>
   </section>
 
  <div style="margin-botton:0px;"><footer >
		<p>© 2023 ToDo. All Rights Reserved.</p>
	</footer></div>
 
	
</body>
</html>