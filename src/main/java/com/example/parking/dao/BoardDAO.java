package com.example.parking.dao;

import com.example.parking.bean.BoardVO;
import com.example.parking.util.JDBCUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

@Repository
public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    @Autowired
    JdbcTemplate jdbcTemplate;

    private final String BOARD_INSERT = "insert into BOARD (owner, carType, carNumber, fileName) values (?, ?, ?, ?, ?)";
    private final String BOARD_UPDATE = "update BOARD set owner=?, carType=?, carNumber=?, fileName=?, outDate=? where seq=?";
    private final String BOARD_DELETE = "delete from BOARD  where seq=?";
    private final String BOARD_GET = "select * from BOARD  where seq=?";
    private final String BOARD_LIST = "select * from BOARD order by seq desc";

    public int insertBoard(BoardVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getOwner());
            stmt.setString(2, vo.getCarType());
            stmt.setInt(3, vo.getCarNumber());
            stmt.setString(4, vo.getFileName());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void deleteBoard(BoardVO vo) {
        System.out.println("===> JDBC로 deleteBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_DELETE);
            stmt.setInt(1, vo.getSeq());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int updateBoard(BoardVO vo) {
        System.out.println("===> JDBC로 updateBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_UPDATE);
            stmt.setString(1, vo.getOwner());
            stmt.setString(2, vo.getCarType());
            stmt.setInt(3, vo.getCarNumber());
            stmt.setString(4, vo.getFileName());
            stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            stmt.setInt(6, vo.getSeq());


//            System.out.println(vo.getTitle() + "-" + vo.getWriter() + "-" + vo.getContent() + "-" + vo.getFileName() + "-" + vo.getSeq());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public BoardVO getBoard(int seq) {
        BoardVO one = new BoardVO();
        System.out.println("===> JDBC로 getBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if (rs.next()) {
                one.setSeq(rs.getInt("seq"));
                one.setOwner(rs.getString("owner"));
                one.setCarType(rs.getString("carType"));
                one.setCarNumber(rs.getInt("carNumber"));
//                one.setCnt(rs.getInt("cnt"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }
}
