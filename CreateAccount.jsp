<%-- 
    Document   : MainMenu
    Created on : Aug 30, 2022, 3:37:19 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account JSP Page</title>
    </head>
    <body>
        <center>
            <div class='row'>
                <div class="container-fluid" style="background:teal; height:140px; color:white">
                    <hr><h1> CREATE ACCOUNT PAGE </h1><hr>        
                </div>
                <div class="container-fluid" style="background:teal; height:486px; color:white">
                    <h5>Fill the following fields to create your account</h5>
                    <form>
                        <table>
                            <tr>
                                <td>Enter Pin number</td>
                                <td><input type="number" name="pin"></td>
                            </tr>
                            <tr>
                                <td>Enter Name</td>
                                <td><input type="text" name="n"></td>
                            </tr>
                            <tr>
                                <td>Enter Father's Name</td>
                                <td><input type="text" name="fn"></td>
                            </tr>
                            <tr>
                                <td>Enter Email</td>
                                <td><input type="email" name="em"></td>
                            </tr>
                            <tr>
                                <td>Enter Phone Number</td>
                                <td><input type="number" name="ph"></td>
                            </tr>
                            <tr>
                                <td>Select Gender</td>
                                <td><input class="form-check-input" type="radio" name="gen" value="Male">Male
                                    <input class="form-check-input" type="radio" name="gen" value="Female">Female
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Country</td>
                                <td><input type="text" name="co"></td>
                            </tr>
                            <tr>
                                <td>Enter State</td>
                                <td><input type="text" name="st"></td>
                            </tr>
                            <tr>
                                <td>Enter City</td>
                                <td><input type="text" name="city"></td>
                            </tr>
                            <tr>
                                <td>Enter Amount</td>
                                <td><input type="number" name="am"></td>
                            </tr>
                            <tr>
                                <td><button class="btn btn-outline-light" type='submit' name='Submit'>Create Account </button></td>
                                <td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button class="btn btn-outline-light" type='submit' name='home'>Home <i class="fa-solid fa-house-user"></i></button></td>
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
                            String acc,pin,name,fname,mail,phno,gen,count,stat,city,amount;
                            int x=0;
                            ResultSet rs=stmt.executeQuery("select * from account");
                            while(rs.next())
                            {
                                x++;
                            }
                            x+=101;
                            acc="SBI"+x;
                            pin=request.getParameter("pin");
                            name=request.getParameter("n");
                            fname=request.getParameter("fn");
                            mail=request.getParameter("em");
                            phno=request.getParameter("ph");
                            gen=request.getParameter("gen");
                            count=request.getParameter("co");
                            stat=request.getParameter("st");
                            city=request.getParameter("city");
                            amount=request.getParameter("am");
                            DateTimeFormatter dtf=DateTimeFormatter.ofPattern("dd/MM/yyy HH:mm:ss");
                            LocalDateTime now=LocalDateTime.now();
                            String date=dtf.format(now);
                            if(pin!=""&&name!=""&&fname!=""&&mail!=""&&phno!=""&&gen!=""&&count!=""&&stat!=""&&city!=""&&amount!="")
                            {
                                String s="insert into account values('"+acc+"','"+pin+"','"+name+"','"+fname+"','"+mail+"','"+phno+"','"+gen+"','"+count+"','"+stat+"','"+city+"','"+amount+"')";
                                int y=stmt.executeUpdate(s);
                                if(y>0)
                                {
                                stmt.executeUpdate("insert into trnsc(Acno,Amount,Time,Descp) values('"+acc+"','"+amount+"','"+date+"','Account Created'"+")");
                                %>
                                    <h4>Your account has been created successfully. Your new account number is <%=acc%></h4>
                                    <h5>Thank you for using our services. Have a great day ahead!</h5><hr>
                                <%
                                }
                                else
                                {
                                %>
                                    <h5>Your account can not be created. Kindly contact administrators</h5>
                                    <h5>We are sorry about the inconvenience </h5><hr>

                                <%
                                }
                            }
                            else
                            {
                                %>
                                <h4>Fill all the required fields</h4><hr>
                                <%
                            }
                        }
                        catch(Exception e)
                        {
                        %>
                        <h4>Could not connect to database. <%=e%></h4><hr>
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
