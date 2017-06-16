package servelet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

/**
 * Created by Wean on 2017/6/16.
 */
@WebServlet(name = "CheckUserServlet", urlPatterns = "/check")
public class CheckUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password=request.getParameter("password");
        HttpSession session = request.getSession();
        if (Objects.equals(password, "123456")){
            session.setAttribute("enter","1");
            response.sendRedirect("index.jsp");
        }else {
            response.sendRedirect("enterSys.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
