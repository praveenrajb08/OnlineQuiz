<%@ page import="java.sql.*" %>  




<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); //create connection
	
	if(request.getParameter("btn_register")!=null) //check register button click event not null
	{
		String user,phonenumber,email,password;
		
		user=request.getParameter("txt_user");
		phonenumber=request.getParameter("txt_phonenumber"); 
		email=request.getParameter("txt_email"); 
		password=request.getParameter("txt_password");
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into login(user,phonenumber,email,password) values(?,?,?,?)"); //sql insert query
		pstmt.setString(1,user);
		pstmt.setString(2,phonenumber);
		pstmt.setString(3,email);
		pstmt.setString(4,password);
		
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Successfully...! Please login"); //register success messeage
		

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>  
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>Register : onlyxscript.blogspot.com</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var user_name= /^[a-z A-Z]+$/; 
			var phone_number= /^[0-9]+$/; 
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; 
			var password_valid=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/;  
			
			var user = document.getElementById("user"); 
            var phonenumber = document.getElementById("phonenumber"); 
            var email = document.getElementById("email"); 
            var password = document.getElementById("password"); 
			
			if(!user_name.test(user.value) || user.value=='') 
            {
				alert("Enter Firstname Alphabet Only....!");
                user.focus();
                user.style.background = '#f08080';
                return false;                    
            }
			if(!phone_number.test(phonenumber.value) || phonenumber.value=='') 
            {
				alert("Enter pno numbers Only....!");
                phonenumber.focus();
                phonenumber.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Enter Valid Email....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			if(!password_valid.test(password.value) || password.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	

</head>

<body>

    <ul>
        <li><h1> QUIZ BOX</h1></li>
    </ul>

    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Register</h1>
                    </div>
				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
				   
				   </br>
				   
                    <div class="form-row">
                        <label>
                            <span>username</span>
                            <input type="text" name="txt_user" id="user" placeholder="enter username">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>phonenumber</span>
                            <input type="text" name="txt_phonenumber" id="phonenumber" placeholder="enter valid pno">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="email" placeholder="enter email">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="txt_password" id="password" placeholder="enter password">
                        </label>
                    </div>

					<input type="submit" name="btn_register" value="Register">
					
                </div>
				
                <a href="index.jsp" class="form-log-in-with-existing">Already have an account? <b> Login here </b></a>

            </div>

        </form>

    </div>

</body>

</html>
