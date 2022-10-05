package gntp.asc.factory.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gntp.asc.factory.dao.MemberDAO;
import gntp.asc.factory.vo.MemberVO;

@Service("memberService")
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	public boolean joinMember(MemberVO member) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag  = memberDAO.insertMember(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}

	public MemberVO readMember(String memberNo) {
		// TODO Auto-generated method stub
		MemberVO member = new MemberVO();
		try {
			member = memberDAO.selectMemberOne(memberNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return member;
	}

}
