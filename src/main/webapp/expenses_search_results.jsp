<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
    <h2>Search Results</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Category</th>
                <th>Amount</th>
                <th>Comments</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="expense" items="${searchResults}">
                <tr>
                    <td>${expense.category}</td>
                    <td>${expense.amount}</td>
                    <td>${expense.comments}</td>
                    <td>${expense.date}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="expenses_search.jsp">Back to Search</a>
</body>
</html>
