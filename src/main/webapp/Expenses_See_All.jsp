<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>See All Expenses</title>
</head>
<body>
    <h2>See All Expenses</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Category</th>
                <th>Amount</th>
                <th>Comments</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="expense" items="${expenses}">
                <tr>
                    <td>${expense.category}</td>
                    <td>${expense.amount}</td>
                    <td>${expense.comments}</td>
                    <td>${expense.date}</td>
                    <td>
                        <a href="expenses_read.jsp?expense_id=${expense.id}">View</a>
                        <a href="expenses_update.jsp?expense_id=${expense.id}">Edit</a>
                        <a href="expenses_delete.jsp?expense_id=${expense.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
