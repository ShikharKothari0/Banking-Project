# Banking-Project
This is a banking project made by me using Java(Jakarta Server Pages) and Bootstrap<br>
I made use of Xampp for creating a database on my system<br>
I used NetBeans14 GUI to create the project<br>
I made use of GlassFish Server6.2.1 in this project<br>
The home page was made using HTML, Bootstrap and I used java to run the MySql queries on the database<br>
The home page links to all the services provided by the project<br>
The services include:-<br>
&emsp;1.Create Account - To create an account on the database and generates a unique account number for the account<br>
&emsp;2.Deposit - To deposit money to an existing account<br>
&emsp;3.Withdraw - To withdraw an amount from an existing account<br>
&emsp;4.Transfer - To transfer funds from one account to another account existing on the database<br>
&emsp;5.Balance Enquiry - To check the current balance of an existing account in the database<br>
&emsp;6.Pin Change - To change the Pin number of an existing account on the database<br>
&emsp;7.Transaction History - To see the entire transaction history of an existing account on the database<br>
For this project I had made 2 tables in my database:-<br>
&emsp;1.account - This table holds all the information about all the accounts created in my project. It has the following columns<br>
&emsp;&emsp;a) accno - This column holds the Account number of all the accounts created in the project.<br>
&emsp;&emsp;b) pin - This column holds the Pin number of all the accounts created in the project.<br>
&emsp;&emsp;c) Name - This column holds the Name of the owner of the individual account created in the project.<br>
&emsp;&emsp;d) FName - This column holds the Father's Name of the owner of the individual account created in the project.<br>
&emsp;&emsp;e) Email - This column holds the linked Emails of all the accounts created in the project.<br>
&emsp;&emsp;f) Phno - This column holds the linked phone number of all the accounts created in the project.<br>
&emsp;&emsp;g) Gen - This column holds the gender of the owner of all the accounts created in the project.<br>
&emsp;&emsp;h) Country - This column holds the Citizenship of the owner of an individual account created in the project.<br>
&emsp;&emsp;i) State - This column holds the state of residence of the owner of an individual account created in the project.<br>
&emsp;&emsp;j) Amount - This column holds the Account number of all the accounts created in the project.<br>
&emsp;2.trnsc - This table holds the data about all the transaction(this includes creation of accounts, deposites, withdrawals, transfer of funds) that<br>&emsp; take place in my project. It has the following columns<br>
&emsp;&emsp;a) trnsid - This column holds a unique value for every Transaction. The value of this column is autogenerated.<br>
&emsp;&emsp;b) Acno - This column holds the account number of the account involved in the said transaction.<br>
&emsp;&emsp;b) Amount - This column holds the amount involved in the said transaction.<br>
&emsp;&emsp;b) Date - This column holds the date and time on which the said transaction took place.<br>
&emsp;&emsp;b) Descp - This column holds description of the transaction(whethere it was deposit, withdrawal etc).<br>
