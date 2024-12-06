package etms_expenses;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expensetracker.entities.Expenses;
import com.expensetracker.dao.ExpensesDao;

@WebServlet("/Expense_Creation")
public class ExpenseCreateServlet extends HttpServlet {

	// Handling POST request to create a new expense
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Retrieving input values from the request
        String category = request.getParameter("expense_category");
        double amount = Double.parseDouble(request.getParameter("expense_amount"));
        String comments = request.getParameter("expense_comments");

        // Creating a new Expenses object
        Expenses expense = new Expenses();
        expense.setCategory(category);
        expense.setAmount(amount);
        expense.setComments(comments);

        // Getting the current date for createdAt and updatedAt fields
        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
        expense.setCreatedAt(currentDate);
        expense.setUpdatedAt(currentDate);

        // Creating an instance of ExpensesDao to interact with the database
        ExpensesDao expensesDao = new ExpensesDao();
        
        try {
            // Calling the DAO method to save the expense into the database
            boolean isExpenseCreated = expensesDao.saveUser(expense);

            // If the expense is successfully created, redirect to a success page
            if (isExpenseCreated) {
                response.sendRedirect("success.jsp");
            } else {
                // If something went wrong, redirect to a failure page
                response.sendRedirect("create_failure.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // If an error occurs, redirect to a failure page
            response.sendRedirect("create_failure.jsp");
        }
    }
	
}
