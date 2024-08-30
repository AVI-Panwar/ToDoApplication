<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
<meta charset="ISO-8859-1">
<title>View ToDo Item List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
a {
	color: white;
}

a:hover {
	color: white;
	text-decoration: none;
}
</style>

</head>
<body>

	<%@include file="header.jsp"%>

	</div>


	<div class="container">
		<%-- 
		<nav class="navbar navbar-light bg-light" style="background-color: #e3f2fd;">
			<a class="navbar-brand">Navbar</a>
			<form class="form-inline">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</nav> --%>


		<h1 class="p-3">ToDo Item List</h1>

		<!-- 	<button type="button" class="btn btn-primary btn-block">
			<a href="/addToDoItem">Add New ToDo Item</a>
		</button> -->

		<!-- <button type="button" class="btn btn-primary btn-block"
			style="padding-bottom: 10px;">
			<a href="/addToDoItem">Add New ToDo Item</a>
		</button> -->

		<button type="button" class="btn btn-primary btn-block"
			style="margin-bottom: 18px;">
			<a href="/addToDoItem">Add New ToDo Item</a>
		</button>


		<form:form>

			<table class="table table-bordered">
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Date</th>
					<th>Status</th>
					<th>Mark Completed</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>

				<c:forEach var="todo" items="${list}">
					<tr>
						<td>${todo.id}</td>
						<td>${todo.title}</td>
						<td>${todo.date}</td>
						<td>${todo.status}</td>
						<td><button type="button" class="btn btn-success">
								<a href="/updateToDoStatus/${todo.id}">Mark Complete</a>
							</button></td>
						<%-- <td><button type="button" class="btn btn-primary">
								<a href="/editToDoItem/${todo.id}">Edit</a>
							</button></td> --%>
						<%-- 		
                        <td>
						<form action="/editToDoItem" method="post">
							<input type="hidden" name="id" value="${todo.id}">
							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
						</td> --%>

						<%-- <td>
							<button type="button" class="btn btn-primary"
								onclick="editToDoItem(${todo.id})">Edit</button>
						</td> --%>


						<td>
							<button type="button" class="btn btn-primary"
								onclick="editToDoItemforsetvalue(${todo.id})">Edit</button>
						</td>


						<td><button type="button" class="btn btn-danger">
								<a href="/deleteToDoItem/${todo.id}">Delete</a>
							</button></td>
					</tr>

				</c:forEach>

			</table>

		</form:form>
		<!-- 
		<button type="button" class="btn btn-primary btn-block">
			<a href="/addToDoItem">Add New ToDo Item</a>
		</button>

 -->
		<form id="Submit_form" method="POST">
			<input class="mb-2" style="display: none;" type="text" name="number"
				id="txtEdit" />
		</form>

		<c:if test="${totalPages > 1}">
			<div class="row col-sm-10">
				<div class="col-sm-2">Total Rows: ${todoList.size}</div>
				<div class="col-sm-1">
					<c:forEach var="i" begin="1" end="${totalPages}">
						<c:choose>
							<c:when test="${currentPage != i}">
								<a href="/todoList?page=${i}">${i}</a>
							</c:when>
							<c:otherwise>
								<span>${i}</span>
							</c:otherwise>
						</c:choose>
                    &nbsp;&nbsp;
                </c:forEach>
				</div>
				<div class="col-sm-1">
					<c:if test="${currentPage < totalPages}">
						<a href="/todoList?page=${currentPage + 1}">Next</a>
					</c:if>
					<c:if test="${currentPage >= totalPages}">
                    Next
                </c:if>
				</div>
				<div class="col-sm-1">
					<c:if test="${currentPage < totalPages}">
						<a href="/todoList?page=${totalPages}">Last</a>
					</c:if>
					<c:if test="${currentPage >= totalPages}">
                    Last
                </c:if>
				</div>
			</div>
		</c:if>

		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>



	</div>

	<script th:inline="javascript">
		window.onload = function() {

			var msg = "${message}";

			if (msg == "Save Success") {
				Command: toastr["success"]("Item added successfully!!")
			} else if (msg == "Delete Success") {
				Command: toastr["success"]("Item deleted successfully!!")
			} else if (msg == "Delete Failure") {
				Command: toastr["error"]
						("Some error occurred, couldn't delete item")
			} else if (msg == "Edit Success") {
				Command: toastr["success"]("Item updated successfully!!")
			}

			toastr.options = {
				"closeButton" : true,
				"debug" : false,
				"newestOnTop" : false,
				"progressBar" : true,
				"positionClass" : "toast-top-right",
				"preventDuplicates" : false,
				"showDuration" : "300",
				"hideDuration" : "1000",
				"timeOut" : "5000",
				"extendedTimeOut" : "1000",
				"showEasing" : "swing",
				"hideEasing" : "linear",
				"showMethod" : "fadeIn",
				"hideMethod" : "fadeOut"
			}
		}
		
		
		function editToDoItemforsetvalue(itemId) {
		    document.getElementById("txtEdit").value = itemId;
		    var formId = document.getElementById("Submit_form");
			formId.action = "/editToDoItem";
			formId.submit();
		}

		
		/*  function editToDoItem(todoId) {
		        // AJAX request to send the id to the controller
		        $.ajax({
		            type: 'GET',
		            url: '/editToDoItem',
		            data: {
		            	   id: todoId
		            	},
		            success: function(data) {
		                // Handle success, if needed
		                console.log("success done : "+data);
		            },
		            error: function(xhr, status, error) {
		                // Handle error, if needed
		            }
		        });
		    } */
	</script>

</body>

</html>