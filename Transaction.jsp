<%-- 
    Document   : Transaction
    Created on : Aug 31, 2022, 9:16:44 AM
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
        <title>Transaction JSP Page</title>
    </head>
    <body>
        <center>
            <div class="row">
                <div class="container-fluid" style="background:teal; color:white; height:140px">
                    <hr><h1>TRANSACTION JSP PAGE</h1><hr>
                </div>
                <div class="container-fluid" style="background:teal; color:white; height:486px">
                    <form>
                        <table cellpadding="5px">
                            <tr>
                                <td>Enter Sender's Account number</td>
                                <td><input type="text" name="snac"></td>
                            </tr>
                            <tr>
                                <td>Enter Sender's Pin number</td>
                                <td><input type="number" name="snpin"></td>
                            </tr>
                            <tr>
                                <td>Enter Receiver's Account number</td>
                                <td><input type="text" name="rcvac"></td>
                            </tr>
                            <tr>
                                <td>Enter amount to be transferred</td>
                                <td><input type="number" name="trnamt"></td>
                            </tr>
                            <tr>
                                <td>&emsp;&emsp;&emsp;&emsp;<button class="btn btn-outline-light" type="submit" name="Submit">Transfer</button></td>
                                <td>&emsp;&emsp;&emsp;<button class="btn btn-outline-light" type="submit" name="home">Home <i class="fa-solid fa-house-user"></i></button></td>                
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
                        String snac,snpin,rcvac,trnamt;
                        snac=request.getParameter("snac");
                        snpin=request.getParameter("snpin");
                        rcvac=request.getParameter("rcvac");
                        trnamt=request.getParameter("trnamt");
                        DateTimeFormatter dtf=DateTimeFormatter.ofPattern("dd/MM/yyy HH:mm:ss");
                        LocalDateTime now=LocalDateTime.now();
                        String date=dtf.format(now);
                        if(snac!=""&&snpin!=""&&rcvac!=""&&trnamt!="")
                        {
                            ResultSet rs=stmt.executeQuery("select * from account where accno='"+snac+"' and pin='"+snpin+"'");
                            if(rs.next())
                            {
                                int camt=Integer.parseInt(rs.getString("Amount"));
                                ResultSet rs1=stmt.executeQuery("select * from account where accno='"+rcvac+"'");
                                if(rs1.next())
                                {
                                    int ramt=Integer.parseInt(rs1.getString("Amount"));
                                    int trnamt_int=Integer.parseInt(request.getParameter("trnamt"));
                                    if(camt>trnamt_int)
                                    {
                                        camt-=trnamt_int;
                                        ramt+=trnamt_int;
                                        int x=stmt.executeUpdate("update account set Amount='"+camt+"' where accno='"+snac+"' and pin='"+snpin+"'");
                                        int y=stmt.executeUpdate("update account set Amount='"+ramt+"' where accno='"+rcvac+"'");
                                        if(x>0 && y>0)
                                        {
                                        %>
                                        <br>
                                        <h4>Transaction Successful.</h4>
                                        <h4>The remaining balance in the senders account is <%=camt%> </h4>
                                        <h5>Thank you for using our services. Have a great day ahead!</h5><hr>
                                        <%
                                            stmt.executeUpdate("insert into trnsc(Acno,Amount,Time,Descp) values('"+snac+"','"+trnamt+"','"+date+"','Transfered to "+rcvac+"'"+")");
                                            stmt.executeUpdate("insert into trnsc(Acno,Amount,Time,Descp) values('"+rcvac+"','"+trnamt+"','"+date+"','Received from "+snac+"'"+")");
                                        }
                                        else
                                        {
                                        %>
                                            <br>
                                            <h4>Oops! Transaction failed</h4>
                                            <h5>We are sorry about the inconvenience</h5><hr>
                                        <%
                                        }
                                    }
                                    else
                                    {
                                    %>
                                        <br>
                                        <h4>Insufficient balance to undertake this transaction</h4><hr>
                                    <%
                                    }
                                }
                                else
                                {
                                %>
                                    <br>
                                    <h4>Invalid Receiver's account number</h4><hr>
                                <%
                                }
                            }
                            else
                            {
                            %>
                                <br>
                                <h4>Invalid Sender's details</h4><hr>
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
                        <h4>Could not connect to the Database <%=e%></h4><hr>
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
