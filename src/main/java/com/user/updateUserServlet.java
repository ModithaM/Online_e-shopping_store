package com.user;

import java.io.IOException;
import java.net.URLEncoder;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateUserServlet")
public class updateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstname = request.getParameter("fname");
		String lastname = request.getParameter("lname");
		String email = request.getParameter("mail");
		String contactno = request.getParameter("telno");
		String birthday = request.getParameter("bday");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String province = request.getParameter("province");
		String country = request.getParameter("country");
		String postalcode = request.getParameter("postalcode");

		HttpSession session = request.getSession();
		int userID = (int) session.getAttribute("userid");
		
		boolean updated = UserDB.updateUser(userID, firstname, lastname, email, contactno, birthday, address, city, province, country, postalcode);

		if(updated == true) {
			response.sendRedirect("myProfileServlet");
		}
		else {
			// send error with url
			String message = "Error when changing Details. try Again!";
			response.sendRedirect("myProfileServlet?message=" + URLEncoder.encode(message, "UTF-8"));
		}
	}

}
