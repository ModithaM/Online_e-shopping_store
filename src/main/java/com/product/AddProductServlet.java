package com.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String produtName = request.getParameter("productTitle");
		String productPrice = request.getParameter("price");
		String productQuantity = request.getParameter("quantity");
		String productCategory = request.getParameter("category");
		String productImage = request.getParameter("productImage");
		String productDescription = request.getParameter("description");
	}

}
