package com.example.parking.service;

import com.example.parking.bean.BoardVO;

import java.util.List;

public interface BoardService {
    public int insertBoard(BoardVO vo);
    public int deletBoard(int seq);
    public int updateBoard(BoardVO vo);
    public BoardVO getBoard(int seq);
    public List<BoardVO> getBoardList();
}
