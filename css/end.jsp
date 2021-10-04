<%@ page import="java.sql.*" %>  

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Congrats!</title>
    <link rel="stylesheet" href="app.css" />
  </head>
  <body>
    <div class="container">
      <div id="end" class="flex-center flex-column">
        <h1 id="finalScore"></h1>
        <form>
        <% Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root","");
         String email=(String)session.getAttribute("login");
         String mostRecentScore="";
         int j=0;
         try{
            mostRecentScore=request.getParameter("mostRecentScore");
            j=Integer.parseInt(mostRecentScore);
            
          }
          catch(Exception e)
          {
            e.printStackTrace();
          }
        
         
         PreparedStatement pstmt=null; //create statemen
		
		pstmt=con.prepareStatement("select user,score from login where email = \"" +email+ "\" "); //sql select query 
        ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
		String user="";
    int score;
		if (rs.next()) {
      user = rs.getString("user");
      score= rs.getInt("score");
			out.println(user);
        }
        Statement st1=con.createStatement();
				int i=st1.executeUpdate("update login set score="+j+" where user='"+user+"'");
        con.close();


        %>
        </form>
        <button class="btn" onclick=something()>savescore</button>
        <a class="btn" href="leaderboard.jsp">leaderboard</a>
        <a class="btn" href="../subjects.html">Play Again</a>
        <a class="btn" href="../homepage.html">Go Home</a>
      </div>
    </div>
    <script src="end.js"></script>
  </body>
</html>