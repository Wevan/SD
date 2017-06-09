package servelet;

import bean.Books;
import dao.BookDao;

import java.io.IOException;
import java.util.List;

/**
 * Created by Wean on 2017/6/2.
 */
public class FindServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String message=request.getParameter("message");
        BookDao bookDao=new BookDao();
        bookDao.findBook(message);
        List<Books> list = bookDao.findBook(message);
        for (Books books:
             list) {

        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request, response);
    }
}
