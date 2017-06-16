package servelet;

import dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Wean on 2017/6/16.
 */
@WebServlet(name = "OverReturnServlet",urlPatterns = "/overreturn")
public class OverReturnServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDao bookDao=new BookDao();
        request.setCharacterEncoding("utf-8");
        String bookId=request.getParameter("bookId");
        int a=0;
        a=bookDao.overreturn(bookId);
        if (a>0){
            response.sendRedirect("returnsuc.jsp");
        }else {
            response.sendRedirect("returnFail.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }
}
