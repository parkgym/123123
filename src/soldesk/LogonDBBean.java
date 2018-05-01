package soldesk;

import java.sql.*;
import java.util.Vector;

public class LogonDBBean {
	//SingleTon Pattern
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	private LogonDBBean() {
	}
	
	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	//inputPro.jsp에서 회원가입을 할때 사용.
	public void insertMember(LogonDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;  // getConnection 은
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into XBFORM1(id,passwd,name,jumin1,jumin2,email" +
					",blog,reg_date,zipcode,address) values (?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin1());
			pstmt.setString(5, member.getJumin2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getBlog());
			pstmt.setTimestamp(8, member.getReg_date());
			pstmt.setString(9, member.getZipcode());
			pstmt.setString(10, member.getAddress());
			
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	//loginPro.jsp 에서 로그온을 시도할때 호출.
	public int userCheck(String id, String passwd) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from XBFORM1 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd))
					x = 1; // 인증성공
				else
					x = 0; // 비밀번호 틀림
			}else
			      	x = -1; // 해당 아이디 없음
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	//confirmId.jsp 에서 ID을 체크할때 사용.
	public int confirmId(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select id from XBFORM1 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				x = 1; // 해당 아이디 있음
			else
				x = -1; // 해당 아이디 없음
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	//updateMember.jsp에서 수정폼에 가입된 회원의 정보를 보여줄때 사용.
	public LogonDataBean getMember(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from XBFORM1 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new LogonDataBean();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setJumin1(rs.getString("jumin1"));
				member.setJumin2(rs.getString("jumin2"));
				member.setEmail(rs.getString("email"));
				member.setBlog(rs.getString("blog"));
				member.setReg_date(rs.getTimestamp("reg_date"));
				member.setZipcode(rs.getString("zipcode"));
				member.setAddress(rs.getString("address"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return member;
	}
	
	public void updateMember(LogonDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("update XBFORM1 set passwd=?,name=?,email=?,blog=?, "+
			"zipcode=?,address=? where id=?");
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getBlog());
			pstmt.setString(5, member.getZipcode());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getId());
			
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public int deleteMember(String id, String passwd) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from XBFORM1 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("delete from XBFORM1 where id = ?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1; // 회원탈퇴 성공
				} else
					x = 0; // 비밀번호 틀림
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	
	
	
	
	public Vector zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	    Vector vecList = new Vector();
	    try { 
	    	con = getConnection();
	    	String strQuery = "select * from zipcode where area3 like "
	    			+ "'"+area3+"%'";
	    	pstmt = con.prepareStatement(strQuery);
	    	rs = pstmt.executeQuery();
	    	while(rs.next()) {
	    		ZipcodeBean tempZipcode = new ZipcodeBean();
	    		tempZipcode.setZipcode(rs.getString("zipcode"));
	    		tempZipcode.setArea1(rs.getString("area1"));
	    		tempZipcode.setArea2(rs.getString("area2"));
	    		tempZipcode.setArea3(rs.getString("area3"));
	    		tempZipcode.setArea4(rs.getString("area4"));
	    		vecList.addElement(tempZipcode);
	    	}
	    } catch(Exception ex) {
	    	System.out.println("Exception" + ex);
	    } finally {
	    	if(rs != null) try {rs.close();}catch(SQLException ex) {}
	    	if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
	    	if(con != null)try {con.close();} catch(SQLException ex) {}
	    }
	    return vecList;
	}
}