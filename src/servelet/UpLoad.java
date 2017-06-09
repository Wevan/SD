package servelet;

import bean.Books;
import dao.BookDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

/**
 * Created by Wean on 2017/6/4.
 */
@WebServlet("/upImg")
public class UpLoad extends HttpServlet {

    private String[] bookInfo = new String[5];

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String path = "F:\\SD\\web\\";
        String webPath = "pic\\";
        String newPath = null;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(new File(path + webPath + "uploadtemp")); // 更准确的说是一个临时文件
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(3 * 1024 * 1024);    // 只能上传3M
        List<FileItem> items = null; // 接收全部内容
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Iterator<FileItem> iter = items.iterator();
        int i = 0;
        while (iter.hasNext()) {
            FileItem item = iter.next();
            String fieldName = item.getFieldName();    // 取得表单控件的名称
            if (!item.isFormField()) {        // 不是普通文本
                File saveFile = null;
                InputStream input = null;
                OutputStream output = null;
                input = item.getInputStream();
                webPath ="pic\\"+ UUID.randomUUID() + "." + item.getName().split("\\.")[1];
                newPath = path +webPath;

                output = new FileOutputStream(new File(newPath));
                int temp = 0;
                byte data[] = new byte[512];
                while ((temp = input.read(data, 0, 512)) != -1) {
                    output.write(data);    // 分块保存
                }
                input.close();
                output.close();
            } else {
                String value = String.valueOf(item.getString("UTF-8"));
                bookInfo[i] = value;
                i++;

            }

        }
        String bookName = bookInfo[0];
        String writer = bookInfo[1];
        String cbs = bookInfo[2];
        String ite = bookInfo[3];
        Books books = new Books();
        books.setBookname(bookName);
        books.setWriter(writer);
        books.setCbs(cbs);
        books.setItems(ite);
        books.setImgPath(webPath);
        BookDao bookDao = new BookDao();
        int flag = bookDao.insertInfo(books);
        if (flag == 1) {
            response.sendRedirect("sucinsert.jsp");
        }
    }


}