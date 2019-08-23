<%-- 메인창에서 해당 사원의 테이블 행을 더블클릭 할 경우 해당 팝업창으로 페이지 활성화. --%>
<%-- 사원 상세정보를 나타내고 있는 페이지 --%>
<%-- 페이지에서 사원의 정보를 조회 할 수 있다. --%>
<%-- 페이지에서 사원의 정보르 수정 입력 할 수 있다. --%>
<%-- 데이터 수정 후 페이지의 하단에 수정하기 버튼이 있음 --%>
<%-- 페이지에서 사원의 정보를 삭제 할 수 있다. --%>
<%-- 페이지의 하단에 삭제하기 버튼이 있음 --%>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language=javascript>	
	function btn_click(n) {//현재 페이지를 닫고 수정하기, 삭제하기 버튼을 눌렀을 경우 각각 해당하는 서블릿으로 이동하며 main페이지의 새로고침을 위해 만들어진 함수
		if (n == "modify") {	//수정하기 버튼이 선택되었을 경우
			frm1.action = "/JspProject/update";	//수정하기 서블릿으로 이동하며
			window.self.close();	//현재의 창을 닫고
			opener.location.href = "/JspProject/main.jsp";	//main.jsp를 새로고침한다.
		} else {	//삭제하기 버튼이 선택되었을 경우
			frm1.action = "/JspProject/delete";	//삭제하기 서블릿으로 이동하며
			window.self.close();	//현재의 창을 닫고
			opener.location.href = "/JspProject/main.jsp";	//main.jsp를 새로고침한다.
		}
	}
</script>
</head>


<body>
	<%
		String userId = request.getParameter("id");	//main.jsp로 부터 온 id값을 읽는다.
		//값을 저장하기 위해서 name, sex, position, dept, sal을 선언 및 초기화한다.
		String name=null;
		String sex=null;
		String position=null;
		String dept=null;
		String sal=null;
		
		//main페이지에 온 pk인 id를 기반으로 db에 접근하여 해당하는 id의 상세정보를 출력한다.
		//select name, sex, position,dept,sal from employee where id=" + userId;
		Connection conn = null; // null로 초기화 한다.

		//select.jsp는 db를 접근할 때 동일한 쿼리를 사용할 확률이 높기 때문에 캐시에 올려두고 쓰는 것이 좋다.
		//따라서 statement가 아닌 preparedstatement를 사용한다.
		PreparedStatement stmt = null;
		try {
			String connect = new String("jdbc:oracle:thin:@localhost:1521:TestDB");		//"주소:포트:DB명"
			String user = "system";														//username
			String passwd = "tiger";													//password
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			conn = DriverManager.getConnection(connect, user, passwd); // DriverManager 객체로부터 Connection 객체를 얻어온다.
			String sql = "select name, sex, position,dept,sal from employee where id=" + userId; // sql 쿼리
			stmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
			ResultSet rset = stmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
			
			while (rset.next()) { // 결과를 한 행씩 돌아가면서 가져온다.
			name=rset.getString("name");//String형 name에  db의 name속성의 값을 가져온다.
			sex=rset.getString("sex");//String형 sex에  db의 sex속성값을 가져온다.
			position=rset.getString("position");//String형 position에  db의 position속성의 값을 가져온다.
			dept=rset.getString("dept");//String형 dept에  db의 dept속성의 값을 가져온다.
			sal=rset.getString("sal");}//String형 sal에  db의 sal속성의 값을 가져온다.
			conn.close();
		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			out.println("employee 테이블 호출에 실패했습니다.");
		}
	%>
	<form name="frm1" method="POST"> 												<%--form을 선언, post 메소드를 사용 --%>
		<table border="1" width="300" height="150" align="center">
			<tr>
				<td>사번</td>															<%-- 1행 1열에 사번 --%>
				<td><input type="text" name="userId" value="<%=userId%>"></td>		<%-- 1행 2열에 입력 받아온 userid를 표시 --%>
			</tr>
			<tr>
				<td>이름</td>															<%-- 2행 1열에 이름 --%>
				<td><input type="text" name="name" value="<%=name%>"></td>			<%-- 2행 2열에 입력 받아온 name을 표시 --%>
			</tr>
			<tr>
				<td>성별</td>															<%-- 3행 1열에 성별 --%>
				<td>																<%-- 3행 2열의 경우에는 --%>
				<% if(sex.equals("남")) {%>											<%-- 입력받은 sex의 값이 남자일 경우 남자의 라디오 버튼에 checked --%>
				<input type="radio" name="sex" value="남" checked>남
				<input type="radio" name="sex" value="여">여</td>	
				<%} 
				
				else {%>															<%-- 입력받은 sex의 값이 여자일 경우 여자의 라디오 버튼에 checked --%>
				<input type="radio" name="sex" value="남" >남
				<input type="radio" name="sex" value="여" checked>여</td>
				<%} %>
			</tr>
			<tr>
				<td>직위</td>															<%-- 4행 1열에 직위 --%>
				<td><select name="position">										<%-- 4행 2열의 경우 직위를 기준으로 --%>
				<%if(position.equals("사원")) {%>										<%-- 직위가 사원일 경우 사원을 선택 --%>
						<option value="사원" selected="사원">사원</option>
						<option value="주임">주임</option>
						<option value="대리">대리</option>
						<option value="과장">과장</option>
						<option value="차장">차장</option>
						<option value="부장">부장</option>
						<%}
				else if(position.equals("주임")){%>									<%-- 직위가 주임일 경우 주임을 선택 --%>
					<option value="사원" >사원</option>							
						<option value="주임" selected="주임">주임 </option>
						<option value="대리">대리</option>
						<option value="과장">과장</option>
						<option value="차장">차장</option>
						<option value="부장">부장</option>
						<%}
				else if(position.equals("대리")){%>									<%-- 직위가 대리일 경우 대리를 선택 --%>
				<option value="사원" >사원</option>
					<option value="주임">주임</option>
					<option value="대리"selected="대리">대리 </option>
					<option value="과장">과장</option>
					<option value="차장">차장</option>
					<option value="부장">부장</option>
					<%}
				else if(position.equals("과장")){%>									<%-- 직위가 과장일 경우 과장을 선택 --%>
				<option value="사원">사원</option>
					<option value="주임">주임</option>
					<option value="대리">대리</option>
					<option value="과장" selected="과장">과장</option>
					<option value="차장">차장</option>
					<option value="부장">부장</option>
					<%}
				else if(position.equals("차장")){%>									<%-- 직위가 차장일 경우 차장을 선택 --%>
				<option value="사원">사원</option>
					<option value="주임">주임</option>
					<option value="대리">대리</option>
					<option value="과장">과장</option>
					<option value="차장" selected="차장">차장 </option>
					<option value="부장">부장</option>
					<%}
				else if(position.equals("부장")){%>									<%-- 직위가 부장일 경우 부장을 선택 --%>
				<option value="사원" >사원</option>
					<option value="주임">주임</option>
					<option value="대리">대리</option>
					<option value="과장">과장</option>
					<option value="차장">차장</option>
					<option value="부장" selected="부장">부장</option>
					<%} %>
				</select></td>
			</tr>
			<tr>
				<td>부서</td>															<%--5행 1열에 부서 --%>
				<td><input type="text" name="dept" value="<%=dept %>"></td>			<%--5행 2열에 입력받은 dept의 값 표시 --%>
			</tr>
			<tr>
				<td>급여</td>															<%--6행 1열에 급여 --%>
				<td><input type="text" name="sal" value="<%=sal%>"></td>			<%--6행 2열에 입력받은 sal의 값 표시 --%>
			</tr>
		</table>
		<p align="right">
		<input type="submit" value="삭제하기" onClick='btn_click("delete");'>			<%--삭제하기 submit생성, 선택시 btn_click("delete")함수가 호출된다. --%>
		<input type="submit" value="수정하기" onClick='btn_click("modify");'>			<%--수정하기 submit생성, 선택시 btn_click("modify")함수가 호출된다. --%>
		</p>
			</form>
	<br>
	<br>
</body>
</html>