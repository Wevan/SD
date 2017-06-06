package servelet;

import dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Wean on 2017/6/5.
 */
@WebServlet(name = "DeleServlet", urlPatterns = "/del")
public class DeleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("bookId");
        BookDao bookDao = new BookDao();
        bookDao.deleteInfo(Long.valueOf(id));

        response.sendRedirect("/allInfo.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
