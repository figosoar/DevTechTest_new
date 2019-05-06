<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
	<title>Development Tech Test.</title>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
	<style type="text/css">
		#red {color:red;}
		#selectedUserInfo {
			margin-top:14px;
		}
		span.highlight {
			background-color:yellow
		}
		body {
			background-color: #fff;
			color: #000;
			font-size: 0.9em;
			font-family: sans-serif,helvetica;
			margin: 0;
			padding: 0;
		}
		h1 {
			text-align: center;
			margin: 0;
			padding: 0.6em 2em 0.4em;
			background-color: #22437f;
			color: #fff;
			font-weight: normal;
			font-size: 1.75em;
			border-bottom: 2px solid #000;
		}
		h1 strong {
			font-weight: bold;
		}
		h2 {
			font-size: 1.1em;
			font-weight: bold;
		}
		hr {
			display: none;
		}
		.content {
			padding: 1em 5em;
		}
		.content-columns {
			/* Setting relative positioning allows for 
			absolute positioning for sub-classes */
			position: relative;
			padding-top: 1em;
		}
		.content-column-left {
			/* Value for IE/Win; will be overwritten for other browsers */
			width: 47%;
			padding-right: 3%;
			float: left;
			padding-bottom: 2em;
		}
		.content-column-right {
			/* Values for IE/Win; will be overwritten for other browsers */
			width: 47%;
			padding-left: 3%;
			float: left;
			padding-bottom: 2em;
		}
		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-justify-content: space-between;
			justify-content: space-between;
			flex-wrap: wrap;
		}
		.flex-item {
			width: 25%;
		}
		.flex-right-item{
			width: 50%;
		}
		.right-container{
			width: 300px;
		}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			var token = "";	//useless token
			
			var userList;	//A global variable, equals data
			var userId = 0;	//A global variable, equals userId in table_userinfo 
			  
			//Html of Table Thread
			var nThread = "";
			nThread = "<div class='flex-container'><div class='flex-item'><b>UserID</b></div><div class='flex-item'><b>ID</b></div><div class='flex-item'><b>Name</b></div><div class='flex-item'><b>CreationTime</b></div>";
						
			//Fuction: Sign in or Login
			/*
			$("#btnLogin").click(function(){
				var param = {"adminId": "dtt-admin", "pwd": "gnzLDuqKcGxMNKFokfhOew=="};
				$.ajax({
					type: "post",
					url: "rest/v1/admin/login",
					contentType: "application/json;charset=UTF-8",
					data: JSON.stringify(param),
					async: false,
					error: function() {
						alert("Login ERROR");
					},
					success: function(data) {
						token = data.token;
						$("#txtUserList").html("Sign in Success.<br/>" + token);
					}
				}); 
			});
			*/
			  
			//Show the Customers List
			$("#btnUserInfoList").click(function(){
				$("#txtUserInfo").html("");
				var param = {};
				$.ajax({
					type: "get",
					url: "rest/v1/user/info/list",
					contentType: "application/json;charset=UTF-8",
					data: param,
					async: false,
					beforeSend: function(request) {
			       		request.setRequestHeader("token", token);
			     		},
					error: function() {
						alert("Customers Info List ERROR");
					},
					success: function(data) {
						userList = data;
						var userInfo = "";
						var nuserInfo = "";
						
						
						$.each(data, function(i, item){
						    nuserInfo += ""
						    	+"<div class='flex-item'>" + item.userId + "</div>"
						    	+"<div class='flex-item'>" + item.id + "</div>"
						    	+"<div class='flex-item' onclick='$.edit("+item.id+")'><a href='javascript:void(0);'>" + item.userName + "</a></div>"
						    	+"<div class='flex-item'>" + item.regTime + "</div>";
						});
						$("#txtUserList").html(nThread + nuserInfo + "</div>");
					}
				});
			});
			
			var currentUserId;	//Clicked customer's UserId, equals to userId
			var currentId;		//Clicked customer's id, equals to Id
			
			//Click Customer's Name to Show Details
			$.edit=function(id) {
				$.each(userList, function(i, item){
					var selectedTitlehtml="";
					var selectedUserhtml="";
					if(item.id == id) {
						userId = id;
						//Invoke the function to show customers' notes
						var userNotes = $.getUserNotes(id);
						
						var statusText;
						if (item.status == 0) {
							statusText = "Prospective";
						} else if (item.status == 10) {
							statusText = "Current";
						} else if (item.status == 20) {
							statusText = "Non-active";
						}
						
						currentUserId = item.userId;
						currentId = item.id;
						
						selectedUserhtml +=
							//Show id,userid,userName,email,telephone,visitTime,regTime,status,
							"<div class='flex-container right-container'>"
							+"<h2>Clicked Customer Details</h2>"
							+"<div class='flex-right-item'>ID:</div><div class='flex-right-item'>"+ item.id+"</div>"
							+"<div class='flex-right-item'>UserId:</div><div class='flex-right-item'>"+ item.userId+"</div>"
							+"<div class='flex-right-item'>Name:</div><div class='flex-right-item'>"+ item.userName+"</div>"
							+"<div class='flex-right-item'>Email:</div><div class='flex-right-item'>"+ item.email+"</div>"
							+"<div class='flex-right-item'>Telephone:</div><div class='flex-right-item'>"+ item.telephone+"</div>"
							+"<div class='flex-right-item'>CreationTime:</div><div class='flex-right-item'>"+ item.regTime+"</div>"
							+"</div>"
							
							+"<br/>"
							+"<br/>"
							
							+"<div id='statusText'>Status:" + statusText + "</div>"
							+"<input type='radio' name='status' value='Prospective'>Prospective<br>"
							+"<input type='radio' name='status' value='Current'>Current<br>"
							+"<input type='radio' name='status' value='Non-active'>Non-active<br>"
							+"<button id='statusSubmit' onclick='$.statusSubmit()'>Save Status</button>"
							+"<br/>"
							+"<br/>"
							
							+"Notes:"
							+"<br/>"
							+"<div id='notesText'>" + userNotes + "</div>"
							+"<input name='txtNote' id='newNoteInput' placeholder='Input notes here...'>"
							+"<p><button type='button' id='btnUpdateUserNote' onclick='$.btnUpdateUserNote()'>Save Notes</button></p>";
						$("#selectedUserInfo").empty().html(selectedTitlehtml + selectedUserhtml);
					}
				});
			};
				
			//Sort the Customers by Descend
			$("#btnDesc").click(function(){
				$("#txtUserInfo").html("");
				var param = {};
				$.ajax({
					type: "get",
					url: "rest/v1/user/info/list/orderby/id/desc",
					contentType: "application/json;charset=UTF-8",
					data: param,
					async: false,
					error: function() {
						alert("Sort by Descend ERROR");
					},
					success: function(data) {
						var userInfo = "";
						var nuserInfo = "";
						
						var nThread = "";
						nThread = "<div class='flex-container'><div class='flex-item'><b>UserID</b></div><div class='flex-item'><b>ID</b></div><div class='flex-item'><b>Name</b></div><div class='flex-item'><b>CreationTime</b></div>"
						
						$.each(data, function(i, item){
						    	
						    nuserInfo += ""
						    	+"<div class='flex-item'>" + item.userId + "</div>"
						    	+"<div class='flex-item'>" + item.id + "</div>"
						    	+"<div class='flex-item' onclick='$.edit("+item.id+")'><a href='javascript:void(0);'>" + item.userName + "<a/></div>"
						    	+"<div class='flex-item'>" + item.regTime + "</div>";
						});
						$("#txtUserList").html(nThread + nuserInfo + "</div>");
					}
				});
			});
				
			//Sort the Customers by Ascend
			$("#btnAsc").click(function(){
				$("#txtUserInfo").html("");
				var param = {};
				$.ajax({
					type: "get",
					url: "rest/v1/user/info/list/orderby/id/asc",
					contentType: "application/json;charset=UTF-8",
					data: param,
					async: false,
					error: function() {
						alert("Sort Customers Info by Ascend ERROR");
					},
					success: function(data) {

						var userInfo = "";
						var nuserInfo = "";
						
						var nThread = "";
						nThread = "<div class='flex-container'><div class='flex-item'><b>UserID</b></div><div class='flex-item'><b>ID</b></div><div class='flex-item'><b>Name</b></div><div class='flex-item'><b>CreationTime</b></div>"
						
						$.each(data, function(i, item){
						    nuserInfo += ""
						    	+"<div class='flex-item'>" + item.userId + "</div>"
						    	+"<div class='flex-item'>" + item.id + "</div>"
						    	+"<div class='flex-item' onclick='$.edit("+item.id+")'><a href='javascript:void(0);'>" + item.userName + "<a/></div>"
						    	+"<div class='flex-item'>" + item.regTime + "</div>";
						});
						$("#txtUserList").html(nThread + nuserInfo + "</div>");
					}
				});
			});
				
			//Add a Customer
			/*
			$("#btnAddUser").click(function(){
				$("#txtUserInfo").html("");
				var param = {"userId": "wangwu", "userName": "王五"};
				$.ajax({
					type: "post",
					url: "rest/v1/user/info/save",
					contentType: "application/json;charset=UTF-8",
					data: JSON.stringify(param),
					async: false,
					error: function() {
						alert("Add a Customer ERROR");
					},
					success: function(data) {
						$("#txtUserList").html("Add a customer successful:" + data.id);
					}
				});
			});
			*/
				
			//Save Customer's Status after Add or Edit
			$.statusSubmit = function(){
				var statusText = $('input:radio:checked').val();
				var status;
				if (statusText == "Prospective") {
					status = 0;
				} else if (statusText == "Current") {
					status = 10;
				} else if (statusText == "Non-active") {
					status = 20;
				}
				
				$.ajax({
					type: "post",
					url: "rest/v1/user/info/status/update/" + currentUserId +"/" +currentId +"/" + status +"",
					contentType: "application/json;charset=UTF-8",
					async: false,
					error: function() {
						alert("Change Customer's Status ERROR");
					},
					success: function(data) {
						$("#statusText").html("Status:" + statusText);
					}
				});
			};	
			
			var userNotesArray=[];	//Save the customers' notes to show it
			
			//Query the Customer Note
			//Invoked by FunctionClick Customer's Name to Show Details
			$.getUserNotes=function(id) {
				var param = {"sysId": id};
				var userNotes = "";
				$.ajax({
					type: "get",
					url: "rest/v1/user/note/list",
					contentType: "application/json;charset=UTF-8",
					data: param,
					async: false,
					error: function() {
						alert("Query the Customer Note ERROR");
					},
					success: function(data) {
						$.each(data, function(i, item){
						    userNotes += "<input name='txtNote' id='"+ item.id +"' value="+item.note+"> <br/>";
						    if(item.note) {
						    	userNotesArray.push(item.note);
						    }
						});
					}
				});
				return userNotes;
			};
				
			//Filter the Customer Info by userId
			$("#search_button").click(function(){
				$("#txtUserInfo").html("");
				var id = $("#input_id").val();
				var param = {"userId": id};
				$.ajax({
					type: "get",
					url: "rest/v1/user/info/filter?userId=" + id,
					contentType: "application/json;charset=UTF-8",
					//data: param,
					async: false,
					beforeSend: function(request) {
		        		request.setRequestHeader("token", token);
		      		},
					error: function() {
						alert("Filter the Customer by userId ERROR");
					},
					success: function(data) {
						var userInfo = "";
						var nuserInfo = "";
						
						var nThread = "";
						nThread = "<div class='flex-container'><div class='flex-item'><b>UserID</b></div><div class='flex-item'><b>ID</b></div><div class='flex-item'><b>Name</b></div><div class='flex-item'><b>CreationTime</b></div>";
						
						$.each(data, function(i, item){
							if(item.userId == id) {
							    nuserInfo += ""
							    	+"<div class='flex-item'>" + item.userId + "</div>"
							    	+"<div class='flex-item'>" + item.id + "</div>"
							    	+"<div class='flex-item' onclick='$.edit("+item.id+")'><a href='javascript:void(0);'>" + item.userName + "</a></div>"
							    	+"<div class='flex-item'>" + item.regTime + "</div>";
							}
						});
						$("#txtUserList").html(nThread + nuserInfo + "</div>");
					}
				});
			});
				
			//Save the Customer Notes after Action like Add or Edit 
			$.btnUpdateUserNote = function(){
				var stringNote = "";
				var note = "";
				var newNote = "";
				$("input[name='txtNote']").each(function(){
					note = $(this).attr("id") + "," + $(this).val();
					if($(this).attr("id") == "newNoteInput") {
						newNote = $(this).val();
					}
					stringNote += (note + ";");
				});
				
				var newNoteInput = $("#newNoteInput").val();
				var param = {"notelist": stringNote, "userId": userId, "adminId": 1};
				$.ajax({
					type: "post",
					url: "rest/v1/user/note/save",
					//contentType: "application/json;charset=UTF-8",
					data: param,
					async: false,
					error: function() {
						alert("Add and Edit the Customer Note ERROR");
					},
					success: function(data) {
						$("#notesText").append("<input value=" + newNote +"><br/>");
						$("#newNoteInput").val("");
					}
				});
			};
			//All JAVASCRIPT functions end
		});
	</script>
	</head>
	
	<body>
		<h1>Fei's <strong>Test Page</strong></h1>
	         <div class="content">
	              <div class="content-middle">
	                      <p>This Simple Page is used to Show My Development Tech Test Project.</p>
	              </div>
	              <hr />
	              
	              <div class="content-columns">
	                  <div class="content-column-left">
		                    <h2>Click the following Buttons:</h2>
							<p>
								<button type="button" id="btnUserInfoList">List</button>
								<button type="button" id="btnDesc">Descend</button>
								<button type="button" id="btnAsc">Ascend</button>
								<!-- 
									<button type="button" id="btnAddUser">Add</button>
								 -->
							</p>
						
							<form id="search_form" action="" method="get">
								<input type="text" id="input_id" placeholder="Input UserId here..." name="userId"/>
								<button type="button" id="search_button">Search</button>
							</form>		

							<div id="txtUserList"></div>
	                        <hr />
	                  </div>
	                   <div class="content-column-right">
	                       <div>
	                           <!-- Show the selected customer's detail -->
		                       <div id="selectedUserInfo"></div>
	                       </div>
	                   </div>
	         	</div>
	         </div>
		<hr />
		
	</body>
</html>
