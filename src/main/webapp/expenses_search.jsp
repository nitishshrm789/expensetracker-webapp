<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Expenses</title>
</head>
<body>
    <h2>Search for Expenses</h2>
    <form action="expenses_search_results.jsp" method="get">
        <label for="search_term">Search Term:</label>
        <input type="text" id="search_term" name="search_term" required><br><br>

        <label for="search_type">Search By:</label>
        <select id="search_type" name="search_type">
            <option value="category">Category</option>
            <option value="amount">Amount</option>
        </select><br><br>

        <input type="submit" value="Search">
    </form>
</body>
</html>
