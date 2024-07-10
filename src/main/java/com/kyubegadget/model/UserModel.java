package com.kyubegadget.model;



import java.time.LocalDate;

public class UserModel {
	
	public int userId;
	private String userName;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String password;
    private LocalDate dob;
    private String gender;
    private String address;
    private String userType;
    
    
    
	public UserModel() {
		super();
	}


	// constructor
	public UserModel(String userName, String firstName, String lastName, String email, String phoneNumber,
			String password, LocalDate dob, String gender, String address) {
		super();
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.address = address;
	}
	
	
	
	
	
	
	


	// another constructor
	public UserModel( String userName, String firstName, String lastName, String email, String phoneNumber,
			String password, LocalDate dob, String gender, String address, String userType) {
		super();
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.address = address;
		this.userType = userType;
	}

	//getter and setters
	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserType() {
		return userType;
	}



	public void setUserType(String userType) {
		this.userType = userType;
	}



	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
	
	
	
	public String getPassword() {
		return password;
	}



	public static void setPassword(String hashedPassword) {
		
	}



	public LocalDate getDob() {
		return dob;
	}
	public void setDob(LocalDate dob) {
		this.dob = dob;
	}
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
        this.address = address;
    }
	
	
	
	
   

}