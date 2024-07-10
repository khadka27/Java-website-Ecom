
package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.kyubegadget.controller.dbcontroller.DatabaseController;

import com.kyubegadget.model.OrderModel;

import com.kyubegadget.model.SalesModel;
import com.kyubegadget.model.UserModel;
import com.kyubegadget.utils.QueryUtils;

public class UserDao {

	// to add user
	public int addUser(UserModel userModel) {
		try (Connection conn = DatabaseController.getConn()) {
			// Insert user data
			String insertUserQuery = QueryUtils.insertUserQuery;
			PreparedStatement userStatement = conn.prepareStatement(insertUserQuery);

			userStatement.setString(1, userModel.getUserName());
			userStatement.setString(2, userModel.getFirstName());
			userStatement.setString(3, userModel.getLastName());
			userStatement.setString(4, userModel.getEmail());
			userStatement.setString(5, userModel.getPhoneNumber());
			userStatement.setString(6, userModel.getPassword());
			userStatement.setDate(7, java.sql.Date.valueOf(userModel.getDob()));
			userStatement.setString(8, userModel.getGender());
			userStatement.setString(9, userModel.getAddress());

			int userInserted = userStatement.executeUpdate();

			// Retrieve the generated userId

			return userInserted; // Return the generated userId

		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1; // or handle the exception as needed
		}
	}

	// for hashed password from database
	public String getHashedPassword(String userName) {
		try (Connection conn = DatabaseController.getConn()) {
			PreparedStatement st = conn.prepareStatement(QueryUtils.GET_HASHED_PASSWORD);
			st.setString(1, userName);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				return rs.getString("password");
			} else {
				// Username not found
				System.out.print("UserName not found");
				return null;
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	// to get login info from database
	public int getUserLoginInfo(String userName, String password) {
		try (Connection conn = DatabaseController.getConn()) {
			PreparedStatement ps = conn.prepareStatement(QueryUtils.GET_LOGIN_USER_INFOS);
			ps.setString(1, userName);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				// User name and password match in the database
				return 1;
			} else {
				// No matching record found
				return 0;
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace(); // Log the exception for debugging
			return -1;

		}
	}


	// new code

	public int getAdminLoginInfo(String userName, String password) {
		try (Connection conn = DatabaseController.getConn()) {
			PreparedStatement ps = conn.prepareStatement(QueryUtils.GET_LOGIN_ADMIN_INFOS);
			ps.setString(1, userName);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int userType = rs.getInt("userType");
				if (userType == 1) {
					// User is an admin
					return 1;
				} else {
					// User is not an admin
					return 0;
				}
			} else {
				// No matching record found
				return -1;
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace(); // Log the exception for debugging
			return -1;
		}
	}
	
	 public boolean isUsernameExists(String userName) {
	        try (Connection conn = DatabaseController.getConn()) {
	            PreparedStatement ps = conn.prepareStatement(QueryUtils.GET_USERDATA_BY_USERNAME);
	            ps.setString(1, userName);
	            ResultSet rs = ps.executeQuery();
	            return rs.next(); // true if username exists, false otherwise
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Handle or log the exception properly
	            return false;
	        }
	    }

	    public boolean isEmailExists(String email) {
	        try (Connection conn = DatabaseController.getConn()) {
	            PreparedStatement ps = conn.prepareStatement(QueryUtils.GET_USERDATA_BY_EMAIL);
	            ps.setString(1, email);
	            ResultSet rs = ps.executeQuery();
	            return rs.next(); // true if email exists, false otherwise
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            return false;
	        }
	    }

	    public boolean isPhoneNumberExists(String phoneNumber) {
	        try (Connection conn = DatabaseController.getConn()) {
	            PreparedStatement ps = conn.prepareStatement(QueryUtils.GET_USERDATA_BY_PHONENUMBER);
	            ps.setString(1, phoneNumber);
	            ResultSet rs = ps.executeQuery();
	            return rs.next(); // true if phone number exists, false otherwise
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            return false;
	        }
	    }
		

		// method to delete user by username
	    public boolean deleteUserByUserName(String userName) {
		    try (Connection conn = DatabaseController.getConn()) {
		        String deleteQuery = QueryUtils.DELETE_USER;
		        PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
		        pstmt.setString(1, userName);

		        int rowsAffected = pstmt.executeUpdate();

		        // If rowsAffected > 0, it means a user was deleted successfully
		        return rowsAffected > 0;
		    } catch (SQLException | ClassNotFoundException ex) {
		        ex.printStackTrace();
		        return false;
		    }
		}




	    // method to get all users
	    public List<UserModel> getAllUsers() {
		    List<UserModel> users = new ArrayList<>();
		    try (Connection conn = DatabaseController.getConn()) {
		        String getAllUsersQuery = QueryUtils.GET_USER;
		        PreparedStatement statement = conn.prepareStatement(getAllUsersQuery);
		        ResultSet resultSet = statement.executeQuery();

		        while (resultSet.next()) {
		            UserModel user = new UserModel();
		            user.setUserId(resultSet.getInt("userId"));
		            user.setUserName(resultSet.getString("userName"));
		            user.setFirstName(resultSet.getString("firstName"));
		            user.setLastName(resultSet.getString("lastName"));
		            user.setEmail(resultSet.getString("email"));
		            user.setPhoneNumber(resultSet.getString("phoneNumber"));
		            user.setDob(resultSet.getDate("dob").toLocalDate());
		            user.setGender(resultSet.getString("gender"));
		            user.setAddress(resultSet.getString("address"));
		            users.add(user);
		        }
		    } catch (SQLException | ClassNotFoundException ex) {
		        ex.printStackTrace();
		    }
		    return users;
		}
	    
	    
	    
	    // method to get user id from username
	    public int getUserIdFromUserName(String userName) {
	        try (Connection conn = DatabaseController.getConn()) {
	            String query = QueryUtils.GET_USERID_BY_USERNAME;
	            PreparedStatement statement = conn.prepareStatement(query);
	            statement.setString(1, userName);
	            ResultSet resultSet = statement.executeQuery();

	            if (resultSet.next()) {
	                return resultSet.getInt("userId");
	            } else {
	                // Handle the case when userName is not found in the database
	                return -1; // Or any other appropriate default value or error handling
	            }
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	            return -1; // Or any other appropriate default value or error handling
	        }
	    }
	    
	    
	    //Method to get user ID from session
	    public int getUserIdFromSession(HttpSession session) {
	        String userName = (String) session.getAttribute("userName");
	        if (userName != null) {
	            // Assuming you have a method to retrieve the userId from the userName
	            return getUserIdFromUserName(userName); // Replace 'ud' with your UserDao instance
	        } else {
	            // Handle the case when userName is not found in session
	            return -1; // Or any other appropriate default value or error handling
	        }
	    }
	    
	    
	    

	      
	  //user update by admin
	        public int updateUserbyadmin(UserModel userModel) {
	    		try (Connection conn = DatabaseController.getConn()) {
	    			// Insert user data
	    			String insertUserQuery = QueryUtils.UPDATE_USER_BY_USERNAME;
	    			PreparedStatement userStatement = conn.prepareStatement(insertUserQuery);

	    			
	    			userStatement.setString(1, userModel.getFirstName());
	    			userStatement.setString(2, userModel.getLastName());
	    			userStatement.setString(3, userModel.getEmail());
	    			userStatement.setString(4, userModel.getPhoneNumber());
	    			
	    			
	    		
	    			userStatement.setString(5, userModel.getAddress());
	    			userStatement.setString(6, userModel.getUserName()); 
	    			int userInserted = userStatement.executeUpdate();

	    			// Retrieve the generated userId

	    			return userInserted; // Return the generated userId

	    		} catch (SQLException | ClassNotFoundException ex) {
	    			ex.printStackTrace();
	    			return -1; // or handle the exception as needed
	    		}
	    	}
	        
	        
	        

	     //method to show total users in dashboard
	        public static int getTotalUsers() throws SQLException, ClassNotFoundException {
	            int totalUsers = 0;
	            String sql = QueryUtils.COUNT_TOTAL_USERS; // Assuming 'users' is the table name
	            try (Connection conn = DatabaseController.getConn();
	                 PreparedStatement pstmt = conn.prepareStatement(sql);
	                 ResultSet rs = pstmt.executeQuery()) {
	                if (rs.next()) {
	                    totalUsers = rs.getInt(1);
	                }
	            }
	            return totalUsers;
	        }
	        
	        

	        // method to get user's order history and show in profile page
	        public List<OrderModel> getUserOrderHistory(String userName) {
	            List<OrderModel> orderHistory = new ArrayList<>();
	            try (Connection conn = DatabaseController.getConn()) {
	                int userId = getUserIdFromUserName(userName);
	                if (userId != -1) {
	                    String query = QueryUtils.GET_USER_ORDER_HISTORY;
	                    PreparedStatement statement = conn.prepareStatement(query);
	                    statement.setInt(1, userId);
	                    ResultSet resultSet = statement.executeQuery();

	                    while (resultSet.next()) {
	                        OrderModel order = new OrderModel(
	                                resultSet.getInt("orderId"),
	                                resultSet.getDate("orderDate"),
	                                userId,
	                                resultSet.getDouble("totalAmount"),
	                                resultSet.getString("orderStatus")
	                        );
	                        orderHistory.add(order);
	                    }
	                }
	            } catch (SQLException | ClassNotFoundException ex) {
	                ex.printStackTrace(); // Log the exception for debugging
	            }
	            return orderHistory;
	        }
	        
	        
	        // method to get user sales history
	        public List<SalesModel> getUserOrderSalesHistory(String userName) {
	            List<SalesModel> orderHistory = new ArrayList<>();
	            try (Connection conn = DatabaseController.getConn()) {
	                int userId = getUserIdFromUserName(userName);
	                if (userId != -1) {
	                    String query = QueryUtils.GET_USER_SALES_HISTORY;
	                    PreparedStatement statement = conn.prepareStatement(query);
	                    statement.setInt(1, userId);
	                    ResultSet resultSet = statement.executeQuery();

	                    while (resultSet.next()) {
	                        SalesModel sales = new SalesModel(
	                                resultSet.getInt("saleId"),
	                                resultSet.getInt("productId"),
	                                userId,
	                                resultSet.getDate("saleDate").toLocalDate(), // Convert java.sql.Date to LocalDate
	                                resultSet.getInt("quantity"),
	                                resultSet.getDouble("unitPrice"), 
	                                resultSet.getDouble("totalPrice")
	                        );
	                        orderHistory.add(sales);
	                    }
	                }
	            } catch (SQLException | ClassNotFoundException ex) {
	                ex.printStackTrace(); 
	            }
	            return orderHistory;
	        }

	        

	        // method to get customer sex ratio to show in admin dashboard
	        public int[] getMaleFemaleOthersCount() {
	            int[] count = new int[3]; 
	            try (Connection conn = DatabaseController.getConn()) {
	                String query = QueryUtils.GET_SEX_RATIO;
	                try (PreparedStatement statement = conn.prepareStatement(query);
	                     ResultSet resultSet = statement.executeQuery()) {
	                    if (resultSet.next()) {
	                        count[0] = resultSet.getInt("maleCount");
	                        count[1] = resultSet.getInt("femaleCount");
	                        count[2] = resultSet.getInt("othersCount");
	                    }
	                }
	            } catch (SQLException | ClassNotFoundException ex) {
	                ex.printStackTrace();
	            }
	            return count;
	        }

	        


}




		


	    


