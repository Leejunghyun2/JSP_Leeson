package employees.model.DTO;

import java.sql.Date;

public class EmployeesDTO {
	private int employee_Id;
	private String first_Name;
	private String last_Name;
	private String email;
	private String phone_Number;
	private Date hire_Date;
	private String job_Id;
	private double salary;
	private double commisstion_Pct;
	private int manager_Id;
	private int department_Id;
	
	public int getEmployee_Id() {
		return employee_Id;
	}
	public void setEmployee_Id(int employee_Id) {
		this.employee_Id = employee_Id;
	}
	public String getFirst_Name() {
		return first_Name;
	}
	public void setFirst_Name(String first_Name) {
		this.first_Name = first_Name;
	}
	public String getLast_Name() {
		return last_Name;
	}
	public void setLast_Name(String last_Name) {
		this.last_Name = last_Name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_Number() {
		return phone_Number;
	}
	public void setPhone_Number(String phone_Number) {
		this.phone_Number = phone_Number;
	}
	public Date getHire_Date() {
		return hire_Date;
	}
	public void setHire_Date(Date hire_Date) {
		this.hire_Date = hire_Date;
	}
	public String getJob_Id() {
		return job_Id;
	}
	public void setJob_Id(String job_Id) {
		this.job_Id = job_Id;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public double getCommisstion_Pct() {
		return commisstion_Pct;
	}
	public void setCommisstion_Pct(double commisstion_Pct) {
		this.commisstion_Pct = commisstion_Pct;
	}
	public int getManager_Id() {
		return manager_Id;
	}
	public void setManager_Id(int manager_Id) {
		this.manager_Id = manager_Id;
	}
	public int getDepartment_Id() {
		return department_Id;
	}
	public void setDepartment_Id(int department_Id) {
		this.department_Id = department_Id;
	}
}
