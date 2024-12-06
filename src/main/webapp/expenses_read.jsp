<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Expense Details</title>
</head>
<body>
    <h2>Expense Details</h2>
    <table border="1">
        <tr><td>Category:</td><td>${expense.category}</td></tr>
        <tr><td>Amount:</td><td>${expense.amount}</td></tr>
        <tr><td>Comments:</td><td>${expense.comments}</td></tr>
        <tr><td>Date:</td><td>${expense.date}</td></tr>
    </table>
    <a href="expenses_list.jsp">Back to Expenses List</a>
</body>
</html>
