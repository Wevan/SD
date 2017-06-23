package dao;

import util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Wean on 2017/6/23.
 */
public class AdminDao {
    private Connection conn = JDBCUtil.getConnection();
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int checkInfo(String username,String password){
        int a=0;
        String sql="SELECT * FROM ksdb.admin WHERE name=? AND password=?";
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            rs=ps.executeQuery();
            if (rs!=null){
                a=1;

            }else {
                a=-1;

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("a is"+a);

        return a;
    }

    public int insertInfo(String username,String password){
        int row=0;
        String sql="INSERT INTO ksdb.admin(name, password) VALUES (?,?)";
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            row=ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }
}
