package job;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import job.jobBean;

public class jobDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void connect_CP(){
		try {
			Context initctx = new InitialContext();
					
			DataSource ds = (DataSource) initctx.lookup("java:/comp/env/jdbc/pool");
					
			con = ds.getConnection();
					
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void disconnect(){
		try {
			if(con != null)		con.close();
			if(pstmt != null)	pstmt.close();
			if(rs != null)		rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//<데이터베이스에 접근하여 주소 정보를 등록하는 메소드>
	public void insertJob(jobBean abean){
		connect_CP();
		
		try {
			//3. sql문 생성
			//num, name, tel, email, hobby, job
			//num: job_seqBB를 이용하여 값을 저장함
			String sql = "insert into JOBB_B values (job_seqBB.nextval,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			//?? 채우기
			pstmt.setString(1, abean.getName());
			pstmt.setString(2, abean.getAdmit());
			pstmt.setString(3, abean.getFm());
			pstmt.setString(4, abean.getTime());
			pstmt.setString(5, abean.getPay());
			
			pstmt.executeUpdate();
			System.out.println("insertEvent(): 오라클 데이터베이스 처리 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		disconnect();
	}
	
	//전체 공고를 데이터베이스에서 읽어오는 메소드
	public ArrayList<jobBean> getAllJob(){
		ArrayList<jobBean> bList = new ArrayList<>();
		connect_CP();
		
		try {
			String sql = "select * from JOBB_B";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				jobBean abean = new jobBean();
				
				abean.setNum(rs.getInt("num"));
				abean.setName(rs.getString("name"));
				abean.setAdmit(rs.getString("admit"));
				abean.setFm(rs.getString("fm"));
				abean.setTime(rs.getString("time"));
				abean.setPay(rs.getString("pay"));

				bList.add(abean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("getAllAddr(): 오라클 데이터베이스 처리 완료");
		disconnect();
		return bList;
	}
	
	// num(PK)을 이용하여 해당 주소 정보를 가져오는 메소드
	public jobBean getOneJob(int num){
		jobBean abean = new jobBean();
		connect_CP();
		
		try {
			//3. sql문 생성
			String sql = "select * from JOBB_B where num=?";
			pstmt = con.prepareStatement(sql);
			//3-1 ?설정
			pstmt.setInt(1, num);
			//4. sql문 실행 및 결과처리
			//여러개의 데이터 값을 ResetSet 객체를 이용하여 처리
			rs = pstmt.executeQuery();
			while(rs.next()){
				abean.setNum(rs.getInt("num"));
				abean.setName(rs.getString("name"));
				abean.setAdmit(rs.getString("admit"));
				abean.setFm(rs.getString("fm"));
				abean.setTime(rs.getString("time"));
				abean.setPay(rs.getString("pay"));
			}
			System.out.println("getAllJob(): 오라클 데이터베이스 처리 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnect();
		return abean;
	}
	
	//addrBean으로 넘어온 데이터를 DB테이블에 저장합니다(수정)
	public void modifyJob(jobBean abean){
		connect_CP();
		
		try {
			String sql = "update JOBB_B set name=?, admit=?, fm=?, time=?, pay=? where num=?";
			
			pstmt = con.prepareStatement(sql);
			//?? 채우기
			pstmt.setString(1, abean.getName());
			pstmt.setString(2, abean.getAdmit());
			pstmt.setString(3, abean.getFm());
			pstmt.setString(4, abean.getTime());
			pstmt.setString(5, abean.getPay());
			pstmt.setInt(6, abean.getNum());
			
			pstmt.executeUpdate();
			System.out.println("modifyJob(): 오라클 데이터베이스 처리 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnect();
	}
	
	//num에 해당되는 데이터를 DB에서 삭제합니다
	public void deleteJob(int num){
		connect_CP();
		
		try {
			String sql = "delete from JOBB_B where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			System.out.println("deleteJob(): 오라클 데이터베이스 처리 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//3. 데이터베이스 자원 및 연결 해제
		disconnect();
	}
}
