<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Display</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/display.css">
</head>
<body>

<%--This marks the view of currently added questions after submition --%>

<%
String str = session.getAttribute("otp_value").toString();
String ques = request.getParameter("question");
String op1 = request.getParameter("opt1"); 
String op2 = request.getParameter("opt2");
String op3 = request.getParameter("opt3");
String op4 = request.getParameter("opt4");
String ans = request.getParameter("answer");
%>

	<main>
            <div class="boxcenter" style="max-width:70%; max-height: 1000px;">
            
                <div class="login">
                    <h2>Question Panel</h2>
                    <form action="dashboard.jsp" method="POST">
                        <label>Question :  <%= ques %> </label>
                        <label>Option 1:  <%= op1 %> </label>
                        <label>Option 2: <%= op2 %> </label>
                        <label>Option 3: <%= op3 %> </label>
                        <label>Option 4: <%= op4 %> </label>
                        <label>Answer: <%= ans %></label>
                        <input type="submit" name="Submit" value="Back to Dashboard"><br>
						<input type="hidden" name="otp" value=<%= str%>>
                    </form>
                </div>
            </div>
        </main>
</body>
</html>