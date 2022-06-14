package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

public class MemberDAO {

	public MemberVO selectById(String member_id) {

		StringBuilder sql = new StringBuilder();
		sql.append("select id, name, password, email_id, email_domain, ");
		sql.append(" tel1, tel2, tel3, ");
		sql.append(" post, basic_addr, detail_addr, ");
		sql.append(" type, to_char(REG_DATE, 'YYYY-MM-DD') as reg_date ");
		sql.append(" from t_member ");
		sql.append(" where id = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, member_id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String emailId = rs.getString("email_id");
				String emailDomain = rs.getString("email_domain");
				String tel1 = rs.getString("tel1");
				String tel2 = rs.getString("tel2");
				String tel3 = rs.getString("tel3");
				String post = rs.getString("post");
				String basicAddr = rs.getString("basic_addr");
				String detailAddr = rs.getString("detail_addr");
				String type = rs.getString("type");
				String regDate = rs.getString("reg_date");

				return new MemberVO(id, name, password, emailId, emailDomain, tel1, tel2, tel3, post, basicAddr,
						detailAddr, type, regDate);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public List<MemberVO> selectAll() {

		List<MemberVO> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			conn = new ConnectionFactory().getConnection();
			StringBuffer sql = new StringBuffer();

			sql.append("select id, name, email_id, email_domain, ");
			sql.append(" type, to_char(REG_DATE, 'YYYY-MM-DD') as reg_date ");
			sql.append(" from t_member ");
			sql.append(" order by name ");

			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String emailId = rs.getString("email_id");
				String emailDomain = rs.getString("email_domain");
				String type = rs.getString("type");
				String regDate = rs.getString("reg_date");

				MemberVO member = new MemberVO();
				member.setId(id);
				member.setName(name);
				member.setEmailId(emailId);
				member.setEmailDomain(emailDomain);
				member.setType(type);
				member.setRegDate(regDate);

				list.add(member);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}

		return list;
	}

	public void insertMember(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_member(id, name, password, email_id, email_domain, ");
		sql.append(" tel1, tel2, tel3, post, basic_addr, detail_addr, type) ");
		sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getEmailId());
			pstmt.setString(5, member.getEmailDomain());
			pstmt.setString(6, member.getTel1());
			pstmt.setString(7, member.getTel2());
			pstmt.setString(8, member.getTel3());
			pstmt.setString(9, member.getPost());
			pstmt.setString(10, member.getBasicAddr());
			pstmt.setString(11, member.getDetailAddr());
			pstmt.setString(12, member.getType());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MemberVO login(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		sql.append("select id, name, password, type ");
		sql.append(" from t_member ");
		sql.append(" where id = ? and password = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				MemberVO user = new MemberVO();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getString("type"));

				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
