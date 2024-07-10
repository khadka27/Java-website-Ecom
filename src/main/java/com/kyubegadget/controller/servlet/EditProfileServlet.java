package com.kyubegadget.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kyubegadget.controller.dao.ProfileDao;
import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.model.UserModel;
import com.kyubegadget.utils.StringUtils;


/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	   
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        UserModel userModel = new UserModel(userName, firstName, lastName, email, phoneNumber, null, null, gender,
                address);

        ProfileDao profileDao = new ProfileDao();
        int result = profileDao.updateUserProfile(userModel); // This should return the number of rows updated

        if (result > 0) {
            // Profile update successful
            // Redirect back to profile page with a success message
            response.sendRedirect(request.getContextPath() + StringUtils.PROFILE_PAGE);
        } else {
            // Profile update failed
            // Redirect back to profile page with an error message
            response.sendRedirect(request.getContextPath() + "/jsp/profile.jsp?error=1");
        }
    }

}
