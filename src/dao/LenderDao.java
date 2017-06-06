package dao;

import bean.Lender;
import util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
            e.printStackTrace();
        }
        return row;
    }

    public int lendBook(Long id,Long bookId){
        int row=0;
        String sql=null;
        try {
            ps = conn.prepareStatement(sql);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }
}
