package gntp.asc.factory.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gntp.asc.factory.dao.MemberDAO;
import gntp.asc.factory.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;

	public ArrayList<MemberVO> allMember() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			list = dao.selectMemberList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(list==null) {
			System.out.println("list는 null");
		}
		return list;
	}

	public MemberVO oneMember(String memberNo) {
		MemberVO member = new MemberVO();
		try {
			member = dao.selectMemberOne(memberNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(member==null) {
			System.out.println("member는 null");
		}
		return member;
	}

	public boolean updateMember(MemberVO member) {
		boolean flag = false;
		try {
			flag = dao.updateMember(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(!flag) {
			System.out.println("update실패");
		}
		return flag;
	}

	
	
}
