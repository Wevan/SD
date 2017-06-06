package servelet;

import bean.Books;
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
@WebServlet(name = "ModfServlet", urlPatterns = "/mod")
public class ModfServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Books books=new Books();
        books.setBookid(Long.valueOf(request.getParameter("bookId")));
        books.setBookname(request.getParameter("bookName"));
        books.setCbs(request.getParameter("cbs"));
        books.setWriter(request.getParameter("writer"));
        books.setItems(request.getParameter("items"));
        BookDao bookDao=new BookDao();
        bookDao.modifyInfo(books);
        response.sendRedirect("allInfo.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
