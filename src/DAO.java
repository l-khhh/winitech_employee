import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//DAO란 ? (DataAccessObject)
//insert, delete, update, backup 준비
//DB접근

class DAO {
	
	// 오라클 DB 연결
	public Connection getConn() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "system", "tiger");
		} catch (SQLException sqle) {
			System.err.println("oracleSQLException : " + sqle);
		}
		return conn;
	}
	
	// mysql DB 연결
	// 최근 mysql은 시간설정을 따로 해줘야하기때문에 길다.
	public Connection getConn_mysql() {
		Connection conn_mysql = null;

		try {
			 conn_mysql = DriverManager.getConnection("jdbc:mysql://localhost:3306/testDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "tiger");

		} catch (SQLException sqle) {
			System.err.println("mysqlSQLException  " + sqle);
		}
		return conn_mysql;
	}

	//INSERT
	boolean insertItem(DO a) {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			stmt.executeQuery("insert into employee values(" + a.getId() + ", '" + a.getName() + "', '" + a.getSex()
					+ "', '" + a.getPosition() + "', '" + a.getDept() + "', '" + a.getSal() + "')");
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	//SELECT
	boolean selectItem() {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select id,name from employee order by id ");
			while (rset.next()) {
				String id = rset.getString("id");
				String name = rset.getString("name");
				System.out.println("id�� " + id + " , �̸��� " + name);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	//DELETE
	boolean deleteItem(DO a) {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("delete from employee where id =" + a.getId());
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	//UPDATE
	boolean updateItem(DO a) {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery(" update employee set name='" + a.getName() + "', sex='" + a.getSex()
					+ "', position='" + a.getPosition() + "', dept='" + a.getDept() + "', sal='" + a.getSal()
					+ "' where id=" + a.getId());
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	//BACKUP ORACLE to MYSQL
	boolean backup() {
		String id=null;
		String name=null;
		String sex=null;
		String position=null;
		String dept=null;
		String sal=null;
		try {
			Connection conn = getConn();
			Connection conn_mysql= getConn_mysql();
			
			
			Statement stmt = conn.createStatement();
			Statement stmt_mysql = conn_mysql.createStatement();
			
			int rset_mysql_delete;
			int rset_mysql_insert;
			rset_mysql_delete = stmt_mysql.executeUpdate("delete from employee");				//delete ALL
			ResultSet rset = stmt.executeQuery("select * from employee order by id ");
			//ResultSet rset_mysql = stmt_mysql.executeQuery("SELECT id,name FROM employee");

			while (rset.next()) { 
			id=rset.getString("id");
			name=rset.getString("name");
			sex=rset.getString("sex");
			position=rset.getString("position");
			dept=rset.getString("dept");
			sal=rset.getString("sal");
			
			
			rset_mysql_insert = stmt_mysql.executeUpdate("insert into employee values ("+id+",'"+name+"','"+sex+"','"+position+"','"+dept+"','"+sal+"')");			
			
			}
			conn.close();
			conn_mysql.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
}