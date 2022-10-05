package gntp.asc.factory.vo;

public class MemberVO {
	private int memberNo;
	private String name;
	private String pwd;
	private String depart;
	private String position;
	private String birthDate;
	private String phoneNum;
	private String joinDate;
	private String email;
	
	public MemberVO() {};
	
	public MemberVO(int memberNo,String name,String pwd,String depart,String position,
			String birthDate,String phoneNum,String joinDate,String email) {
		this.memberNo = memberNo;
		this.name = name;
		this.pwd = pwd;
		this.depart = depart;
		this.position = position;
		this.birthDate = birthDate;
		this.phoneNum = phoneNum;
		this.joinDate = joinDate;
		this.email = email;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		String result = null;
		
		result = "memberNo : " + memberNo + "\n" +
				 "name : " + name + "\n" +
				 "pwd : " + pwd + "\n" +
				 "depart : " + depart + "\n" +
				 "position : " + position + "\n" +
				 "birthDate : " + birthDate + "\n" +
				 "phoneNum : " + phoneNum + "\n" +
				 "joinDate : " + joinDate + "\n" +
				 "email : " + email + "\n";
		
		return result;
	}
}
