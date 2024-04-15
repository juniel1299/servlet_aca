package com.test.toy.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.toy.board.model.BoardDTO;
import com.test.util.DBUtil;

public class BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public BoardDAO() {
		this.conn = DBUtil.open("localhost", "toy", "java1234");
	}

	public int add(BoardDTO dto) {
		
		try {

			String sql = "insert into tblBoard (seq,subject,content,id,regdate,readcount) values(seqBoard.nextVal,?,?,?,default,default)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getId());
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("{primary_type_name}.register");
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return 0;
	}

	public ArrayList<BoardDTO> list() {
		
		try {
				
				String sql = "select * from vwBoard";
				
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
				
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					
					dto.setSeq(rs.getString("seq"));
					dto.setSubject(rs.getString("subject"));
					dto.setName(rs.getString("name"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setReadcount(rs.getString("readcount"));
					dto.setId(rs.getString("id"));
					
					list.add(dto);
				}
				
				return list;
				
			} catch (Exception e) {
				System.out.println("{primary_type_name}.list");
				e.printStackTrace();
				// TODO: handle exception
			}
		return null;
	}

}

