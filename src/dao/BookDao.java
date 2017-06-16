package dao;

import bean.Books;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Wean on 2017/6/2.
 */
public class BookDao {

    private Connection conn = JDBCUtil.getConnection();
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<Books> listBookInfo() {
        List<Books> list = new ArrayList();
        try {

            String sql = "SELECT * FROM books";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Books books = new Books();
                books.setBookid(rs.getLong("bookId"));
                books.setBookname(rs.getString("bookName"));
                books.setCbs(rs.getString("cbs"));
                books.setWriter(rs.getString("writer"));
                books.setIslend(rs.getLong("isLend"));
                books.setItems(rs.getString("items"));
                books.setDate(rs.getTimestamp("date"));
                books.setImgPath(rs.getString("imgpath"));
                list.add(books);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    public List getItems(){
        List item=new ArrayList();
        try {

            String sql = "SELECT * FROM books WHERE isLend=1 GROUP BY items";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                item.add(rs.getString("items"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return item;
    }

    public List<Books> selectBook(String item){
        List<Books> list = new ArrayList();
        try {

            String sql = "SELECT * FROM books WHERE isLend=1 AND items=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,item);
            rs = ps.executeQuery();
            while (rs.next()) {
                Books books = new Books();
                books.setBookid(rs.getLong("bookId"));
                books.setBookname(rs.getString("bookName"));
                books.setCbs(rs.getString("cbs"));
                books.setWriter(rs.getString("writer"));
                books.setIslend(rs.getLong("isLend"));
                books.setItems(rs.getString("items"));
                books.setDate(rs.getTimestamp("date"));
                books.setImgPath(rs.getString("imgpath"));
                list.add(books);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int insertInfo(Books books) {
        int row = 0;
        String sql = "INSERT INTO ksdb.books (bookName, writer, isLend, cbs, items,imgpath) " +
                "VALUES (?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, books.getBookname());
            ps.setString(2, books.getWriter());
            ps.setLong(3, 1);
            ps.setString(4, books.getCbs());
            ps.setString(5, books.getItems());
            ps.setString(6, books.getImgPath());
            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    public int deleteInfo(Long bookId) {
        int row = 0;
        String sql = "DELETE FROM books WHERE bookId=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setLong(1, bookId);

            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    public int modifyInfo(Books books) {
        int row = 0;
        //SET bookName=?,writer=?,cbs=?,items=?
        String sql = "UPDATE books SET bookName=?,writer=?,cbs=?,items=? WHERE bookId=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, books.getBookname());
            ps.setString(2, books.getWriter());
            ps.setString(3, books.getCbs());
            ps.setString(4, books.getItems());
            ps.setString(5, String.valueOf(books.getBookid()));

            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    public int lendBook(Long id, Long bookId) {
        int row = 0;
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sql = "UPDATE books SET isLend=?,date=? WHERE bookId=? AND isLend=1";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, String.valueOf(id));
            ps.setString(2, dateFormat.format(date));
            ps.setString(3, String.valueOf(bookId));
            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    public int returnBook(Long bookId,Long id) {
        int row = 0;
        String sql1="SELECT date FROM ksdb.books WHERE isLend=? AND bookId=?";
        Date date1=  new Date();
        Date date2;
        try {
            ps = conn.prepareStatement(sql1);
            ps.setString(1, String.valueOf(id));
            ps.setString(2, String.valueOf(bookId));
            rs=ps.executeQuery();
            while (rs.next()){
                date2=rs.getDate("date");

                if (daysBetween(date2,date1)>30){
                    row=-1;
                    return row;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql = "UPDATE books SET isLend=?,date=NULL WHERE bookId=? AND isLend=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, "1");
            ps.setString(2, String.valueOf(bookId));
            ps.setString(3, String.valueOf(id));
            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    public List<Books> findBook(String message) {
        List<Books> list = new ArrayList();
        message = "%" + message + "%";
        System.out.println("message is " + message);
        String sql = "SELECT * FROM books WHERE bookId LIKE ? OR bookName LIKE ? OR books.writer LIKE ? OR books.items LIKE ? AND isLend IN (SELECT isLend FROM books WHERE isLend=1)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, message);
            ps.setString(2, message);
            ps.setString(3, message);
            ps.setString(4, message);

            rs = ps.executeQuery();
            while (rs.next()) {
                Books books = new Books();
                books.setBookid(rs.getLong("bookId"));
                books.setImgPath(rs.getString("imgpath"));
                books.setBookname(rs.getString("bookName"));
                books.setCbs(rs.getString("cbs"));
                books.setWriter(rs.getString("writer"));
                books.setItems(rs.getString("items"));
                list.add(books);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("dao list = " + list);
        return list;
    }


    public List<Books> overdue(){
        List<Books> list=new ArrayList<>();
        Date date1=  new Date();
        Date date2;

        String sql="SELECT date,isLend,bookName,bookId FROM ksdb.books WHERE isLend!=1";
        try {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()){
                date2=rs.getDate("date");

                if (daysBetween(date2,date1)>30){
                    Books books=new Books();
                    books.setBookid(rs.getLong("bookId"));
                    books.setBookname(rs.getString("bookName"));
                    books.setIslend(rs.getLong("isLend"));
                    books.setDate(rs.getTimestamp("date"));
                    list.add(books);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int daysBetween(Date date1,Date date2) throws ParseException
    {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        try {

            date1=sdf.parse(sdf.format(date1));
            date2=sdf.parse(sdf.format(date2));
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }
        long days=date2.getTime()-date1.getTime();
        long between_days=days/(1000*3600*24);
        return Integer.parseInt(String.valueOf(between_days));
    }

    public int overreturn(String bookId){
        int row=0;
        String sql = "UPDATE books SET isLend=1,date=NULL WHERE bookId=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, String.valueOf(bookId));
            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

}
