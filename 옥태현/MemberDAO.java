package gntp.asc.factory.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gntp.asc.factory.vo.MemberVO;

@Repository("MemberDAO")
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO selectMemberOne(String memberId) throws SQLException {
		MemberVO member = null;
		
		int member_id = Integer.parseInt(memberId);
		
		member = sqlSession.selectOne("selectMemberById",member_id);
		
		return member;
	}
	
	public ArrayList<MemberVO> selectMemberList() throws SQLException {
		ArrayList<MemberVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("selectMemberList");
		
		return list;
	}
	
	public boolean insertMember(MemberVO vo) throws SQLException {
		boolean flag = false;
		
		MemberVO maxVO = sqlSession.selectOne("selectMemberMax");
		int maxId = 0;
		if(maxVO == null) {
			maxId = 20220001;
		} else {
			maxId = maxVO.getMemberNo() + 1;
		}
		
		vo.setMemberNo(maxId);
		
		int affectedCount = sqlSession.insert("insertMember", vo);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean updateMember(MemberVO vo) throws SQLException {
		boolean flag = false;
		
		int affectedCount = sqlSession.update("insertMember", vo);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean deleteMember(String memberId) throws SQLException {
		boolean flag = false;
		
		int affectedCount = sqlSession.delete("deleteMember", memberId);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
}
