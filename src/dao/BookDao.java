package dao;

import bean.Books;
import util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

            String sql = "SELECT * FROM books WHERE isLend=1";
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
        String sql = "UPDATE books SET isLend=?,date=? WHERE bookId=?";
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

    public int returnBook(Long bookId) {
        int row = 0;
        String sql = "UPDATE books SET isLend=? WHERE bookId=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, "1");
            ps.setString(2, String.valueOf(bookId));
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

    public List<Books> overdue() {
        List<Books> list = new ArrayList<Books>();
        String sql = "";

        return list;
    }

}
