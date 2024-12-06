<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Expense</title>
</head>
<body>
    <h2>Update Expense</h2>
    <form action="expenses_update" method="post">
        <input type="hidden" name="expense_id" value="${expense.id}">
        
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" value="${expense.category}" required><br><br>

        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" value="${expense.amount}" required><br><br>

        <label for="comments">Comments:</label>
        <textarea id="comments" name="comments">${expense.comments}</textarea><br><br>

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="${expense.date}" required><br><br>

        <input type="submit" value="Update Expense">
    </form>
</body>
</html>
