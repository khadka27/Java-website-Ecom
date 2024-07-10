package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.model.UserModel;
import com.kyubegadget.utils.StringUtils;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDao ud = new UserDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String userName = request.getParameter("userName");
	    boolean usernameExists = ud.isUsernameExists(userName);

	    String email = request.getParameter("email");
	    boolean emailExists = ud.isEmailExists(email);

	    String phoneNumber = request.getParameter("phoneNumber");
	    boolean phoneNumberExists = ud.isPhoneNumberExists(phoneNumber);

	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");

	    if (request.getParameter("userName") != null) {
	        response.getWriter().write(String.valueOf(usernameExists));
	    } else if (request.getParameter("email") != null) {
	        response.getWriter().write(String.valueOf(emailExists));
	    } else if (request.getParameter("phoneNumber") != null) {
	        response.getWriter().write(String.valueOf(phoneNumberExists));
	    }
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String userName = request.getParameter(StringUtils.userName);
		String firstName = request.getParameter(StringUtils.firstName);
		String lastName = request.getParameter(StringUtils.lastName);
		String email = request.getParameter(StringUtils.email);
		String phoneNumber = request.getParameter(StringUtils.phoneNumber);
		String password = request.getParameter(StringUtils.password);
		String rePassword = request.getParameter(StringUtils.rePassword);

		String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		UserModel.setPassword(hashedPassword);

		String dobString = request.getParameter(StringUtils.dob);
		LocalDate dob = LocalDate.parse(dobString);
		String gender = request.getParameter(StringUtils.gender);
		String address = request.getParameter(StringUtils.address);

		System.out.println("Received user registration details:");
		System.out.println("Username: " + userName);
		System.out.println("First Name: " + firstName);
		System.out.println("Last Name: " + lastName);
		System.out.println("Email: " + email);
		System.out.println("Phone Number: " + phoneNumber);
		System.out.println("Password: " + hashedPassword);
		System.out.println("Date of Birth: " + dob);
		System.out.println("Gender: " + gender);
		System.out.println("Address: " + address);
		
		


		UserModel userModel = new UserModel(userName, firstName, lastName, email, phoneNumber, hashedPassword, dob,
				gender, address);

		// Adding user to the database
		int result = ud.addUser(userModel);

		if (result > 0) {
			HttpSession session = request.getSession();
//			session.setAttribute(StringUtils.userName, userName);
			session.setAttribute(StringUtils.firstName, firstName);
			session.setAttribute(StringUtils.lastName, lastName);
			session.setAttribute(StringUtils.email, email);
			session.setAttribute(StringUtils.phoneNumber, phoneNumber);
			session.setAttribute(StringUtils.gender, gender);
			session.setAttribute(StringUtils.address, address);

			response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE + "?" + StringUtils.ERROR_MESSAGE
					+ "=" + StringUtils.SUCCESS_REGISTER_MESSAGE);
		} else {
			response.sendRedirect(request.getContextPath() + StringUtils.REGISTER_PAGE + "?" + StringUtils.ERROR_MESSAGE
					+ "=" + StringUtils.REGISTER_ERROR_MESSAGE);
			System.out.println("An unexpected server error occurred. ");
		}
	}
	
	


}
