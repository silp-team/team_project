package com.example.parking.dao;

import com.example.parking.bean.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;

@Repository
public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    @Autowired
    JdbcTemplate jdbcTemplate;

    private final String BOARD_INSERT = "insert into PARKING (owner, carType, carNumber, fileName, parkingSpot, regdate) values (?, ?, ?, ?, ?, ?)";
    private final String BOARD_UPDATE = "update PARKING set owner=?, carType=?, carNumber=?, fileName=?, outDate=?, parkingSpot=? where seq=?";
    private final String BOARD_DELETE = "delete from PARKING  where seq=?";
    private final String BOARD_GET = "select * from PARKING  where seq=";
    private final String BOARD_LIST = "select * from PARKING order by seq desc";

    public int insertBoard(BoardVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        try {
            String time = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());

            return jdbcTemplate.update(BOARD_INSERT, vo.getOwner(), vo.getCarType(), vo.getCarNumber(), vo.getFileName(), vo.getParkingSpot(), time);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int deleteBoard(int seq) {
        System.out.println("===> JDBC로 deleteBoard() 기능 처리");
        try {
//            conn = JDBCUtil.getConnection();
//            stmt = conn.prepareStatement(BOARD_DELETE);
//            stmt.setInt(1, vo.getSeq());
//            stmt.executeUpdate();
            return jdbcTemplate.update(BOARD_DELETE, seq);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int updateBoard(BoardVO vo) {
        System.out.println("===> JDBC로 updateBoard() 기능 처리");
        try {
            String time = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
            return jdbcTemplate.update(BOARD_UPDATE, vo.getOwner(), vo.getCarType(), vo.getCarNumber(), vo.getFileName(), time, vo.getParkingSpot(), vo.getSeq());

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public BoardVO getBoard(int seq) {
        BoardVO one = new BoardVO();
        System.out.println("===> JDBC로 getBoard() 기능 처리");
        try {
            String t = BOARD_GET + seq;
            return jdbcTemplate.queryForObject(t, new BoardRowMapper());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<BoardVO> getBoardList(){
        return jdbcTemplate.query(BOARD_LIST, new BoardRowMapper());
    }

    class BoardRowMapper implements RowMapper<BoardVO>{
        Date current = new Date(new Timestamp(System.currentTimeMillis()).getTime());
        @Override
        public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            BoardVO one = new BoardVO();
            String tt = rs.getString("regdate");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
            Date temp = null;
            try {
                temp = formatter.parse(tt);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            System.out.println("현재시간:" + current.getTime());
            System.out.println("입차시간:" + temp.getTime());
            long diffHor = (current.getTime() - temp.getTime() ) / 3600000; //시 차이
            System.out.println("시간차이는: " + diffHor);
            one.setFee((int) diffHor * 1000);
            return one;
        }
    }
}
