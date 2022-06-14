package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/**
 * t_board 테이블의 CRUD 담당 클래스
 */
public class BoardDAO {

	/**
	 * no에 해당하는 게시물 조회 메소드
	 * 
	 * @param no
	 */
	public BoardVO selectByNo(int no) {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT no, title, writer, content, view_cnt, ");
		sql.append(" 	to_char(reg_date, 'yyyy-mm-dd') reg_date ");
		sql.append(" FROM t_board ");
		sql.append(" where no = ? ");

		try ( /* AutoClosable을 상속받은 class만 자동으로 close를 해준다. */
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				int board_no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");

				BoardVO board = new BoardVO(board_no, title, writer, content, viewCnt, regDate);
				return board;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 전체게시글 조회 메소드
	 */
	public List<BoardVO> selectAll() {

		List<BoardVO> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, to_char(reg_date, 'yyyy-MM-dd') as reg_date ");
			sql.append(" from t_board ");
			sql.append(" order by no desc ");

			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");

				BoardVO board = new BoardVO(no, title, writer, null, 0, regDate);
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}

		return list;
	}

	/**
	 * 새글등록
	 */
	public void insertBoard(BoardVO board) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			conn = new ConnectionFactory().getConnection();

			StringBuilder sql = new StringBuilder();
			sql.append("Insert into t_board(no, title, writer, content)");
			sql.append(" values(seq_t_board_no.nextVal, ?, ?, ?) ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
	}

	/**
	 * 조회수 증가
	 */
	public void updateViewCnt(int no) {

		StringBuilder sql = new StringBuilder();
		sql.append("update t_board set view_cnt = view_cnt + 1 ");
		sql.append(" where no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
