<%-- 
    Document   : BalanceEnquiry
    Created on : Aug 31, 2022, 6:26:27 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Balance Enquiry JSP Page</title>
    </head>
    <body>
        <center>
            <div class="row">
                <div class="container-fluid" style="background:teal; color:white; height:140px">
                    <hr><h1>BALANCE ENQUIRY JSP PAGE</h1><hr><br>
                </div>
                <div class="container-fluid" style="background:teal; color:white; height:486px">
                    <form>
                        <table cellpadding="5px">
                            <tr>
                                <td>Enter Account number</td>
                                <td><input type="text" name="acno"></td>
                            </tr>
                            <tr>
                                <td>Enter Pin number</td>
                                <td><input type="number" name="pin"></td>
                            </tr>
                            <tr><td></td></tr>
                            <tr>
                                <td>&emsp;&emsp;<button class="btn btn-outline-light" type="submit" name="Submit">Check Balance</button></td>
                                <td>&emsp;&emsp;&emsp;&emsp;<button class="btn btn-outline-light" type="submit" name="home">Home <i class="fa-solid fa-house-user"></i></button></td>                
                            </tr>
                        </table>
                    </form>
        <%
            if(request.getParameter("Submit")!=null)
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mydb","root","");
                    Statement stmt=con.createStatement();
                    String acno=request.getParameter("acno");
                    String pin=request.getParameter("pin");
                    if(acno!=""&&pin!="")
                    {
                        ResultSet rs=stmt.executeQuery("select * from account where accno='"+acno+"' and pin='"+pin+"'");
                        if(rs.next())
                        {
                            String camt=rs.getString("Amount");
                            %>
                                <br>
                                <h4>The remaining balance of the account having account number <%=acno%> is <%=camt%></h4>
                                <h5>Thank you for using our services. Have a great day ahead!</h5><hr>
                            <%
                        }
                        else
                        {
                        %>
                            <br>
                            <h4>Invalid account details</h4><hr>
                        <%
                        }
                    }
                    else
                    {
                    %>
                        <br>
                        <h4>Please fill all the fields properly</h4><hr>
                    <%
                    }
                }
                catch(Exception e)
                {
                %>
                    <br>
                    <h4>Could not connect to the database <%=e%></h4><hr>
                <%
                }
            }
            if(request.getParameter("home")!=null)
            {
                response.sendRedirect("HomePage.jsp");
            }
        %>
                </div>
            </div>
        </center>
    </body>
</html>
