package etms_expenses;

import com.expensetracker.dao.ExpensesDao;
import com.expensetracker.entities.Expenses;
import com.expensetracker.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ExpensesReadServlet")
public class ExpensesReadServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the expense ID parameter from the request
        String expenseId = request.getParameter("expense_id");
        
        // If the expense ID is null or empty, redirect to an error page
        if (expenseId == null || expenseId.isEmpty()) {
            response.sendRedirect("error.jsp");
            return;
        }
        
        // Retrieve expense details from the database based on the expense ID
        ExpensesDao expensesDao = new ExpensesDao(ConnectionProvider.getConnection());
        Expenses expense = null;

        try {
            // Fetch the expense details based on the expense ID
            expense = expensesDao.getExpenseById(Integer.parseInt(expenseId));
            
            // If expense is null, it means no record was found, so redirect to an error page
            if (expense == null) {
                response.sendRedirect("error.jsp");
                return;
            }

        } catch (NumberFormatException e) {
            // Handle potential errors (SQLException, NumberFormatException)
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }
        

        // Set the expense object as an attribute in the request scope
        request.setAttribute("expense", expense);

        // Forward the request to the expenses_read.jsp page for rendering the details
        request.getRequestDispatcher("/expenses_read.jsp").forward(request, response);
    }
}
