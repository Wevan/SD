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
@WebServlet(name = "ReturnServlet",urlPatterns = "/return")
public class ReturnServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BookDao bookDao=new BookDao();
        String bookId=request.getParameter("bookId");
        String id=request.getParameter("id");
        int a=0;
        a=bookDao.returnBook(Long.valueOf(bookId), Long.valueOf(id));
        if (a==-1){
            response.sendRedirect("overreturn.jsp");
        }else if (a>0){
            response.sendRedirect("returnsuc.jsp");
        }else if (a==0){
            response.sendRedirect("returnFail.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }
}
