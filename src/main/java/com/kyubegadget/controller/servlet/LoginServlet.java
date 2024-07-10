package com.kyubegadget.controller.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.UserModel;
import com.kyubegadget.utils.StringUtils;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	UserDao ud = new UserDao();	
	UserModel um = new UserModel();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter(StringUtils.userName);

        String password = request.getParameter(StringUtils.password);

        // Retrieve hashed password from the database
        String hashedPasswordDB = ud.getHashedPassword(userName);
        
        

        if (hashedPasswordDB != null && hashedPasswordDB.startsWith("$2a$")) {
            // Verify password using BCrypt
            if (BCrypt.checkpw(password, hashedPasswordDB)) {
                // Password is correct

            	
                // Check if the user is an admin
            	int adminLoginResult = ud.getAdminLoginInfo(userName, hashedPasswordDB);
                if (adminLoginResult == 1) {
                    // Successful admin login
                    HttpSession session = request.getSession();
                    session.setAttribute(StringUtils.userName, userName);
                    
                    session.setAttribute("role", "admin");
                    session.setMaxInactiveInterval(30 * 60);
                    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
                    return;
                } else {
                    // Successful user login
                    HttpSession session = request.getSession();
                    session.setAttribute(StringUtils.userName, userName);
                    session.setAttribute("role", "user");
                    session.setMaxInactiveInterval(30 * 60);
                    response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
                    return;
                }
            }
        }

        // Incorrect username or password or non-existing user
        request.setAttribute("errorMessage", "Incorrect username or password");

        
        
     // Instead of using RequestDispatcher for invalid login attempt
        String errorMessage = "Incorrect username or password!";
        response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE + "?error=" + errorMessage);

    }




	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
