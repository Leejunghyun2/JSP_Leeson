package employees.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import employees.model.DTO.EmployeesDTO;

public class EmployeesDAO {
	public EmployeesDTO stevenKing(EmployeesDTO paramDto){ 
		EmployeesDTO dto = new EmployeesDTO();
		String dbDriver = "oracle.jdbc.driver.OracleDriver";
		String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "hr";
		String dbPasswd = "1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbUrl,dbId,dbPasswd);
			
			String sql = "select * from employees where first_name = ? and last_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getFirst_Name());
			pstmt.setString(2, paramDto.getLast_Name());
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setEmployee_Id(rs.getInt("employee_id"));
				dto.setFirst_Name(rs.getString("first_name"));
				dto.setLast_Name(rs.getString("last_name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone_Number(rs.getString("phone_number"));
				dto.setHire_Date(rs.getDate("hire_date"));
				dto.setJob_Id(rs.getString("job_id"));
				dto.setSalary(rs.getDouble("salary"));
				dto.setCommisstion_Pct(rs.getDouble("commission_pct"));
				dto.setManager_Id(rs.getInt("manager_id"));
				dto.setDepartment_Id(rs.getInt("department_id"));
			}
			if(rs != null) { rs.close(); }
			if(pstmt != null) { pstmt.close(); }
			if(conn != null) { conn.close(); }
		} catch (Exception e) {
				e.printStackTrace();
		} 
			return dto;
		}
}
