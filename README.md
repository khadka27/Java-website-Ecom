#Gadget Shop E-commerce Website
worked on collaboration with "https://github.com/khadka27" 
Welcome to the Gadget Shop E-commerce Website project repository! This project is an e-commerce website for a gadget shop, developed using JSP, Servlets, Java, Tailwind CSS, and JavaScript. It includes essential features such as order processing, a shop page, profile management, and an admin page.
Features

    Order Functionality: Users can place orders for gadgets.
    Shop Page: Displays a list of available gadgets for purchase.
    Profile Management Page: Users can manage their profile information.
    Admin Page: Admins can manage the inventory and view order details.

Technologies Used

    Frontend: Tailwind CSS, JavaScript
    Backend: Java, JSP, Servlets
    Database: MySQL
    Web Server: Apache Tomcat 9.5

Prerequisites

    XAMPP (includes Apache and MySQL)
    Apache Tomcat 9.5
    Eclipse IDE

How to Run

    Clone the Repository

    sh

    git clone https://github.com/aashishrauniyar/kyubegadget.git
    cd kyubegadget

    Start XAMPP
        Open XAMPP Control Panel.
        Start Apache and MySQL modules.

    Set Up the Database
        Open phpMyAdmin by visiting http://localhost/phpmyadmin in your web browser.
        Create a new database named kyube.
        Import the database schema from the database folder in the repository.

    Configure Tomcat in Eclipse
        Open Eclipse IDE.
        Go to Window > Preferences > Server > Runtime Environments.
        Click on Add, select Apache Tomcat v9.5, and configure the installation directory.
        Click Finish.

    Import the Project into Eclipse
        Go to File > Import.
        Select Existing Projects into Workspace and click Next.
        Browse to the directory where the repository was cloned and select it.
        Click Finish.

    Deploy the Project
        Right-click on the project in the Project Explorer.
        Select Run As > Run on Server.
        Choose the configured Tomcat server and click Finish.

    Access the Website
        Open your web browser and visit http://localhost:8080/gadget-shop-ecommerce.

Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. Make sure to follow the coding standards and include appropriate tests.
License

This project is licensed under the MIT License. See the LICENSE file for details.
Contact

For any questions or feedback, please reach out to rauniyaaraashish@gmail.com.
