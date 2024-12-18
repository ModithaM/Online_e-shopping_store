package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/myProductsServlet")
public class myProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String currentUserid =(String) session.getAttribute("userid"); // get session user id
		
		try {
			List<Product> productDetails = ProductDB.getPeroductDetails(currentUserid);
			request.setAttribute("productDetails", productDetails);
		
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("myProducts.jsp");
		dis.forward(request, response);
		
	}

}
