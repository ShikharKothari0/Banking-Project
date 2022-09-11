<%-- 
    Document   : HomePage
    Created on : Aug 31, 2022, 7:00:38 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-2" style="background:black; height:160px; padding:0px"><img src="bank.jpg"  height="100%"width="100%"></div>
            <div class="col-md-10" style="background:teal; height:160px; padding:0px; color:white">
                <center>
                    <h1>JSP BANKING SYSTEM</h1><hr>
                    <h2>A JAVA BASED WEB APPLICATION<hr></h2>
                </center>
            </div>
            <div class="col-md-12" style="background:teal; color:white; height:466px">
                <h1>Select your desired service</h1>
                <center><br><br>
                    <form>
                        <table cellpadding="20">
                            <tr>
                                <td><button class="btn btn-outline-light btn-lg" type='submit' name='cracc'>Create Account <i class="fa-solid fa-user"></i></button></td>
                                <td><button class="btn btn-outline-light btn-lg" type='submit' name='depos'>Deposit Balance <i class="fa-solid fa-piggy-bank"></i></button></td>
                            </tr>
                            <tr>
                                <td><button class="btn btn-outline-light btn-lg" type='submit' name='withd'>Withdraw Balance <i class="fa-regular fa-money-bill-1"></i></button></td>
                                <td><button class="btn btn-outline-light btn-lg" type='submit' name='trnsc'>Send Money <i class="fa-solid fa-money-bill-transfer"></i></button></td>
                            </tr>
                            <tr>
                                <td><button class="btn btn-outline-light btn-lg" type='submit' name='pinch'>Pin Change <i class="fa-solid fa-key"></i></button></td>
                                <td><button class="btn btn-outline-light btn-lg" type='submit' name='blncenq'>Balance Enquiry <i class="fa-solid fa-sack-dollar"></i></button></td>
                            </tr>
                            <tr>
                                <td><button class="btn btn-outline-light btn-lg" type='submit' name='trnhis'>Transaction History  <i class="fa-solid fa-clock-rotate-left"></i></button></td>
                            </tr>
                        </table>
                    </form>
                </center> 
            </div>
        </div>
        <%
            if(request.getParameter("cracc")!=null)
            {
                response.sendRedirect("CreateAccount.jsp");
            }
            if(request.getParameter("depos")!=null)
            {
                response.sendRedirect("Deposit.jsp");
            }
            if(request.getParameter("withd")!=null)
            {
                response.sendRedirect("Withdraw.jsp");
            }
            if(request.getParameter("trnsc")!=null)
            {
                response.sendRedirect("Transaction.jsp");
            }
            if(request.getParameter("pinch")!=null)
            {
                response.sendRedirect("PinChange.jsp");
            }
            if(request.getParameter("blncenq")!=null)
            {
                response.sendRedirect("BalanceEnquiry.jsp");
            }
            if(request.getParameter("trnhis")!=null)
            {
                response.sendRedirect("TransactionHistory.jsp");
            }
        %>
    </body>
</html>
