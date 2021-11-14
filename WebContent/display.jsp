<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.PreparedStatement"%> 
   <%@page import="javax.servlet.RequestDispatcher" %> 
  <%@page import =" java.io.IOException"%>
  <%@page import ="java.sql.ResultSet"%>
  <%@page import=" java.sql.SQLException"%>
  <%@page import ="java.sql.Statement"%>
  <%@page import ="javax.servlet.RequestDispatcher"%>
  <%@page import =" javax.servlet.ServletException"%>
  <%@page import  ="javax.servlet.annotation.WebServlet"%>
  <%@page import  =" javax.servlet.http.HttpServlet"%>
  <%@page import  ="javax.servlet.http.HttpServletRequest"%>
  <%@page import   ="javax.servlet.http.HttpServletResponse"%>
  <%@page import  =" com.entities.Questions"%>
  <%@page import  =" com.helper.ConnectionProvider"%>
  <%@page import = "java.io.PrintWriter" %>
  <%@page import = "javax.servlet.http.HttpSession" %>

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

		
				try{
	  		String str = session.getAttribute("otp_value").toString();
		   String ques = request.getParameter("question");
	   	   String opt1 = request.getParameter("opt1");
	       String opt2 = request.getParameter("opt2");
	   	   String opt3= request.getParameter("opt3");
	    	String opt4 = request.getParameter("opt4");
 	   		String ans = request.getParameter("answer");
 	   
		String q = "insert into questions(question, option1, option2, option3, option4, answer) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = ConnectionProvider.getConnection().prepareStatement(q);
			pstmt.setString(1,ques);
			pstmt.setString(2, opt1 );
			pstmt.setString(3, opt2 );
			pstmt.setString(4, opt3 );
			pstmt.setString(5, opt4 );
			pstmt.setString(6, ans );
			pstmt.executeUpdate();

%>
	<main>
            <div class="boxcenter" style="max-width:70%; max-height: 1000px;">
            
                <div class="login">
                    <h2>Question Panel</h2>
                    <form action="dashboard.jsp" method="POST">
                        <label>Question :  <%= ques %> </label>
                        <label>Option 1:  <%= opt1 %> </label>
                        <label>Option 2: <%= opt2 %> </label>
                        <label>Option 3: <%= opt3 %> </label>
                        <label>Option 4: <%= opt4 %> </label>
                        <label>Answer: <%= ans %></label>
                        <input type="submit" name="Submit" value="Back to Dashboard"><br>
						<input type="hidden" name="otp" value=<%= str%>>
                    </form>
                </div>
            </div>
        </main>
        <% 
		    	}catch (Exception e){
		    		e.printStackTrace();
		    	}
        
        %>
    
</body>

</html>
