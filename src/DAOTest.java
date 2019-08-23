import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


class DAOTest {

	private DO x1;
	private DO x2;
	private DO x3;
	private DO x4;
	private DO x5;
	private DO x6;
	private DAO y;
	
	
	@BeforeEach
	void setUp() throws Exception {
		x1 = new DO();//insert
		x2 = new DO();//insert
		x3 = new DO();//update
		x4 = new DO();//update
		x5 = new DO();//delete
		x6 = new DO();//delete
		y = new DAO();	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Class.forName("com.mysql.cj.jdbc.Driver");	

	}

	
	@Test
	void test() {
		
		String id_tmp=null;	String name_tmp=null;	String sex_tmp=null;	String position_tmp=null;	String dept_tmp=null;	String sal_tmp=null;

		
		//insert 1
		String id=null;	String name=null;	String sex=null;	String position=null;	String dept=null;	String sal=null;
		x1.setId("1");	x1.setName("�ѱ�");	x1.setSex("��");	x1.setPosition("����");	x1.setDept("cs1��");	x1.setSal("100");
		y.insertItem(x1);
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "system", "tiger");
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select id, name,sex,position,dept,sal from employee where id=1 ");
			while (rset.next()) {
				id=rset.getString("id");
				name=rset.getString("name");
				sex=rset.getString("sex");
				position=rset.getString("position");
				dept=rset.getString("dept");
				sal=rset.getString("sal");
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		assertEquals("1",id); assertEquals("�ѱ�",name);	assertEquals("��",sex);	assertEquals("����",position);	assertEquals("cs1��",dept);	assertEquals("100",sal);
		
		
		
		
		//insert2
		 id=null;	name=null;	sex=null;	position=null;	dept=null;	sal=null;		
		x2.setId("2");	x2.setName("eng");	x2.setSex("��");	x2.setPosition("����");	x2.setDept("cs2��");	x2.setSal("50");
		y.insertItem(x2);
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "system", "tiger");
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select id, name,sex,position,dept,sal from employee where id=2 ");
			while (rset.next()) { 
				id=rset.getString("id");
				name=rset.getString("name");
				sex=rset.getString("sex");
				position=rset.getString("position");
				dept=rset.getString("dept");
				sal=rset.getString("sal");
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		assertEquals("2",id); assertEquals("eng",name);	assertEquals("��",sex);	assertEquals("����",position);	assertEquals("cs2��",dept);	assertEquals("50",sal);
		
		
		
		
		//update 1
		 id=null;	name=null;	sex=null;	position=null;	dept=null;	sal=null;		
		x3.setId("1");	x3.setName("eng");	x3.setSex("��");	x3.setPosition("���");	x3.setDept("�������");	x3.setSal("10");
		y.updateItem(x3);
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "system", "tiger");
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select id, name,sex,position,dept,sal from employee where id=1 ");
			while (rset.next()) { 
				id=rset.getString("id");
				name=rset.getString("name");
				sex=rset.getString("sex");
				position=rset.getString("position");
				dept=rset.getString("dept");
				sal=rset.getString("sal");
				}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		assertEquals("1",id); assertEquals("eng",name);	assertEquals("��",sex);	assertEquals("���",position);	assertEquals("�������",dept);	assertEquals("10",sal);
		
		
		
		
		//update2
		 id=null;	name=null;	sex=null;	position=null;	dept=null;	sal=null;		
		x4.setId("2");	x4.setName("�ѱ�");	x4.setSex("��");	x4.setPosition("�븮");	x4.setDept("����");	x4.setSal("100");
		y.updateItem(x4);
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "system", "tiger");
			Statement stmt = conn.createStatement();			
			ResultSet rset = stmt.executeQuery("select id, name,sex,position,dept,sal from employee where id=2 ");
			while (rset.next()) { 
				id=rset.getString("id");
				name=rset.getString("name");
				sex=rset.getString("sex");
				position=rset.getString("position");
				dept=rset.getString("dept");
				sal=rset.getString("sal");
				}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		assertEquals("2",id); assertEquals("�ѱ�",name);	assertEquals("��",sex);	assertEquals("�븮",position);	assertEquals("����",dept);	assertEquals("100",sal);
	
		
		
		//backup
		 id=null;	name=null;	sex=null;	position=null;	dept=null;	sal=null;		
		 id_tmp=null;	name_tmp=null;	sex_tmp=null;	position_tmp=null;	dept_tmp=null;	sal_tmp=null;		
		y.backup();
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "system", "tiger");
			Connection conn_mysql=DriverManager.getConnection("jdbc:mysql://localhost:3306/testDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "tiger");
			
			Statement stmt = conn.createStatement();
			Statement stmt_mysql = conn_mysql.createStatement();
			
			ResultSet rset = stmt.executeQuery("select id, name,sex,position,dept,sal from employee where id=1 ");
			ResultSet rset_mysql = stmt_mysql.executeQuery("select id, name,sex,position,dept,sal from employee where id=1 ");

			while (rset.next()) { 
				id=rset.getString("id");
				name=rset.getString("name");
				sex=rset.getString("sex");
				position=rset.getString("position");
				dept=rset.getString("dept");
				sal=rset.getString("sal");
				}
			while (rset_mysql.next()) { 
				id_tmp=rset_mysql.getString("id");
				name_tmp=rset_mysql.getString("name");
				sex_tmp=rset_mysql.getString("sex");
				position_tmp=rset_mysql.getString("position");
				dept_tmp=rset_mysql.getString("dept");
				sal_tmp=rset_mysql.getString("sal");
				}
			conn.close();
			conn_mysql.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		assertEquals(id_tmp,id); assertEquals(name_tmp,name);	assertEquals(sex_tmp,sex);	assertEquals(position_tmp,position);	assertEquals(dept_tmp,dept);	assertEquals(sal_tmp,sal);

		
		
		//delete1
		 id=null;	name=null;	sex=null;	position=null;	dept=null;	sal=null;		
		x5.setId("1");	x5.setName("eng");	x5.setSex("��");	x5.setPosition("���");	x5.setDept("�������");	x5.setSal("10");
		y.deleteItem(x5);
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "system", "tiger");
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select id, name,sex,position,dept,sal from employee where id=1 ");
			while (rset.next()) { 
				id=rset.getString("id");
				name=rset.getString("name");
				sex=rset.getString("sex");
				position=rset.getString("position");
				dept=rset.getString("dept");
				sal=rset.getString("sal");
				}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		assertNull(id);	assertNull(name);	assertNull(sex);	assertNull(position);	assertNull(dept);	assertNull(sal);
		
			
		//delete2
		 id=null;	name=null;	sex=null;	position=null;	dept=null;	sal=null;		
		x6.setId("2");	x6.setName("�ѱ�");	x6.setSex("��");	x6.setPosition("�븮");	x6.setDept("����");	x6.setSal("100");
		y.deleteItem(x6);
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "system", "tiger");
			Statement stmt = conn.createStatement();			
			ResultSet rset = stmt.executeQuery("select id, name,sex,position,dept,sal from employee where id=2 ");
			while (rset.next()) { 
				id=rset.getString("id");
				name=rset.getString("name");
				sex=rset.getString("sex");
				position=rset.getString("position");
				dept=rset.getString("dept");
				sal=rset.getString("sal");
				}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		assertNull(id);	assertNull(name);	assertNull(sex);	assertNull(position);	assertNull(dept);	assertNull(sal);
	
	
	
	
	}
}
