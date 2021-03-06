package dao;

import bean.Books;
import bean.Lender;
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
 * Created by Wean on 2017/6/5.
 */
public class LenderDao {
    private Connection conn = JDBCUtil.getConnection();
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<Lender> listLenderInfo() {
        List<Lender> list = new ArrayList();
        try {

            String sql = "SELECT * FROM ksdb.lender";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Lender lender = new Lender();
                lender.setId( rs.getLong("id"));
                lender.setWorkid(rs.getLong("workId"));
                lender.setName(rs.getString("name"));
                list.add(lender);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int insertInfo(Lender lender) {
        int row = 0;
        String sql = "INSERT INTO ksdb.lender(name,workId)" +
                "VALUES (?,?)";
        try {
            ps = conn.prepareStatement(sql);
            System.out.println("信息"+lender.getName()+lender.getWorkid());
            ps.setString(1, lender.getName());
            ps.setLong(2, lender.getWorkid());
            row = ps.executeUpdate();
        } catch (SQLException e) {
            row=0;
            e.printStackTrace();
        }finally {

            return row;
        }
    }

    public List<Books> findLender(String id){
        List<Books> list = new ArrayList();
        String sql="SELECT * FROM lender,books WHERE books.isLend=lender.id AND lender.id=?";
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1,id);
            rs=ps.executeQuery();
            while (rs.next()) {
                Books books = new Books();
                books.setBookid(rs.getLong("bookId"));
                books.setImgPath(rs.getString("imgpath"));
                books.setBookname(rs.getString("bookName"));
                books.setCbs(rs.getString("cbs"));
                books.setWriter(rs.getString("writer"));
                books.setItems(rs.getString("items"));
                books.setDate(rs.getTimestamp("date"));
                Lender lender = new Lender();
                lender.setName(rs.getString("name"));
                books.setLender(lender);
                list.add(books);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
