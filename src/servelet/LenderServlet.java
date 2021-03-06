package servelet;

import bean.Lender;
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
@WebServlet(name = "LenderServlet",urlPatterns = "/lender")
public class LenderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Lender lender=new Lender();
        lender.setName(request.getParameter("name"));
        lender.setWorkid(Long.valueOf(request.getParameter("workId")));
        int a=0;

        LenderDao lenderDao=new LenderDao();
        a=lenderDao.insertInfo(lender);
        if (a>0){

            response.sendRedirect("allLender.jsp");
        }else {
            response.sendRedirect("newLenderFail.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
