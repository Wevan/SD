package servelet;

import dao.BookDao;
import dao.LenderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Wean on 2017/6/5.
 */
@WebServlet(name = "LendServlet",urlPatterns = "/lend")
public class LendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BookDao bookDao=new BookDao();

        String bookId=request.getParameter("bookId");
        String id=request.getParameter("id");
        bookDao.lendBook(Long.valueOf(id), Long.valueOf(bookId));

        response.sendRedirect("lendSuc.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
