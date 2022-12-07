package com.example.parking.dao;

import com.example.parking.bean.BoardVO;
import org.apache.ibatis.session.SqlSession;
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
    SqlSession sqlSession;
//    JdbcTemplate jdbcTemplate;

//    private final String BOARD_INSERT = "insert into PARKING (owner, carType, carNumber, fileName, parkingSpot, regdate) values (?, ?, ?, ?, ?, ?)";
//    private final String BOARD_UPDATE = "update PARKING set owner=?, carType=?, carNumber=?, fileName=?, outDate=?, parkingSpot=? where seq=?";
//    private final String BOARD_DELETE = "delete from PARKING  where seq=?";
//    private final String BOARD_GET = "select * from PARKING  where seq=";
//    private final String BOARD_LIST = "select * from PARKING order by seq desc";

    public int insertBoard(BoardVO vo) {
        int result = sqlSession.insert("Board.insertBoard", vo);
        return result;
    }

    public int deleteBoard(int seq) {
        int result = sqlSession.delete("Board.deleteBoard", seq);
        return result;
    }

    public int updateBoard(BoardVO vo) {
        int result = sqlSession.delete("Board.updateBoard", vo);
        return result;
    }

    public BoardVO getBoard(int seq) {
        BoardVO one = sqlSession.selectOne("Board.getBoard", seq);
        return one;
    }

    public List<BoardVO> getBoardList(){
        List<BoardVO> list = sqlSession.selectList("Board.getBoardList");
        for(BoardVO t : list){
//            print(t.)
        }
        return list;
    }

//    class BoardRowMapper implements RowMapper<BoardVO>{
//        Date current = new Date(new Timestamp(System.currentTimeMillis()).getTime());
//        @Override
//        public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//            System.out.println("읽기 시작!!");
//            BoardVO one = new BoardVO();
//            String tt = rs.getString("regdate");
//            SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
//            Date temp = null;
//            try {
//                temp = formatter.parse(tt);
//            } catch (ParseException e) {
//                throw new RuntimeException(e);
//            }
//            System.out.println("현재시간:" + current.getTime());
//            System.out.println("입차시간:" + temp.getTime());
//            long diffHor = (current.getTime() - temp.getTime() ) / 3600000; //시 차이
//            System.out.println("시간차이는: " + diffHor);
//            one.setFee((int) diffHor * 1000);
//            one.setSeq(rs.getInt("seq"));
//            one.setOwner(rs.getString("owner"));
//            one.setCarNumber(rs.getInt("carNumber"));
//            one.setCarType(rs.getString("carType"));
//            one.setFileName(rs.getString("fileName"));
//            one.setRegDate(temp);
////            one.setOutDate(rs.getDate("outdate"));
//            one.setParkingSpot(rs.getString("parkingSpot"));
//            return one;
//        }
//    }
}
