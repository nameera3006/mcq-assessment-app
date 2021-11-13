<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 
 <%--this jsp is for creatting a unique test-id with it's own no. of ques and timer --%> 

    
          <%  try {
    	   
    	   int no = Integer.parseInt(request.getParameter("no_of_questions"));
    	   int countdown = Integer.parseInt(request.getParameter("test_duration"));
    	   int min = 100000;  
           int max = 999999;  
           int ran = (int)(Math.random()*(max-min+1)+min); 
           session.setAttribute("number", no);
           session.setAttribute("count", countdown);
           session.setAttribute("test_id", ran);  
            String q = "insert into test_configuration(test_id,no_of_questions,countdown) values(?,?,?)";
			PreparedStatement pstmt = ConnectionProvider.getConnection().prepareStatement(q);
			pstmt.setInt(1,ran);
			pstmt.setInt(2,no);
			pstmt.setInt(3, countdown );
			pstmt.executeUpdate();
			response.sendRedirect("show_test_id.jsp");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
       %>    
    
      
