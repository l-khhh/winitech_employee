import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class insertServlet
 */

@WebServlet(name = "backup", description = "��� ����", urlPatterns = { "/backup" }) // ���� ����
public class backupServley extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	
	public void init(ServletConfig conf) throws ServletException {// servlet의 초기화 함수
		try {
			System.out.println("��� ����");
			
			Class.forName("oracle.jdbc.driver.OracleDriver"); // oracle 
			Class.forName("com.mysql.cj.jdbc.Driver");	// mysql 
			
		} catch (Exception e) {
			e.printStackTrace();	
		}
		System.out.println("DB connect Succeeded"); // db 연결 확인
	}

	public backupServley() { // ������
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		try {
			DAO y = new DAO(); // dao 객체 생성
			y.backup(); // dao.backup을 실행
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}