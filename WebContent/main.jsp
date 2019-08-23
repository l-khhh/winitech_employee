<%-- 처음 실행시 나타나는 화면으로 id와 name의 쌍으로 간략하게 사원정보를 제공해준다. --%>
<%-- 우측 상단에는 사원등록 버튼이 있다. --%>
<%-- 화면 중간에는 id와 name의 쌍으로 나타나는 데이터들이 테이블에 정렬 되어있다. --%>
<%-- 사원의 정보를 자세히 보고 싶다면 해당하는 사원의 테이블행에서 더블클릭하는 기능을 가지고 있다. --%>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>


<head>
<meta charset="EUC-KR">
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>


<body>
	<div>
		<br> <br>												<%-- 줄바꿈 --%>
	</div>

	<table align="right">
		<tr>
			
			<td><input type="button" value="전체 데이터 백업"				<%-- 전체 데이터 백업 버튼 추가 --%>
				<%-- 사원추가 버튼 선택시 insert.jsp 팝업창 열기 --%>
				onclick="window.open('backup.jsp','백업하기','width=400, height=100, menubar=no, status=no, toolbar=no');"><br></td>  
		</tr>
		<tr>
			<td><input type="button" value="사원 등록"				<%-- 사원등록 버튼 추가 --%>
				<%-- 사원추가 버튼 선택시 insert.jsp 팝업창 열기 --%>
				onclick="window.open('insert.jsp','사원추가하기','width=400, height=300, menubar=no, status=no, toolbar=no');"><br></td> 
		</tr>
	</table>

	<div>
		<br> <br>
	</div>



	<%--테이블 생성 --%>
	<table id="employee" border="1" width="300"
		class="table table-bordered table-hover text-center">

		<thead>
			<tr>
				<th>사번</th>												<%-- 테이블의 첫 행에 사번  --%>
				<th>이름</th>												<%-- 테이블의 첫 행에 이름  --%>
			</tr>
		</thead>
		
		<%			//main페이지에 pk인 id와 이름을 간략하게 표시해주기 위해 DB에 접근하여 employee테이블의 모든 정보를 id의 오름차순으로 출력한다.
					//select id, name from employee order by id;
			Connection conn = null; // null로 초기화 한다.
			
			//main.jsp는 db를 자주 접근하며 동일한 쿼리를 사용하기 때문에 캐시에 올려두고 쓰는 것이 좋다.
			//따라서 statement가 아닌 preparedstatement를 사용한다.
			PreparedStatement stmt = null;	

			try {
				String connect = new String("jdbc:oracle:thin:@localhost:1521:TestDB");		//"주소:포트:DB명"
				String user = "system";														//username
				String passwd = "tiger";													//password

				Class.forName("oracle.jdbc.driver.OracleDriver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
				conn = DriverManager.getConnection(connect, user, passwd); // DriverManager 객체로부터 Connection 객체를 얻어온다.
				String sql = "select id, name from employee order by id"; // sql 쿼리 , id를 오름차순으로 전체 id와 name을 출력한다.
				stmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
				ResultSet rset = stmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

				while (rset.next()) { // 결과를 한 행씩 돌아가면서 가져온다.
					String id = rset.getString("id");		//String형 id를 선언하여 db의 id속성의 값을 가져온다.
					String name = rset.getString("name");	//String형 name을 선언하여 db의 name속성의 값을 가져온다.
		%>
		<tbody>
			<tr>
				<td width="100"><%=id%></td>			<%--오름차순으로 나온 db데이터의 가장 작은 id부터 행 추가 --%>
				<td width="100"><%=name%></td>			<%--오름차순으로 나온 db데이터의 가장 작은 id의 name부터 행 추가 --%>
			</tr>
			<%
				}
				conn.close();
				} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
					e.printStackTrace();
					out.println("employee 테이블 호출에 실패했습니다.");
				}
			%>
		</tbody>
	</table>


	<script>
		// 테이블의 Row 클릭시 값 가져오기
		$("#employee tr").dblclick(
						function() {
							// 현재 클릭된 Row(<tr>)
							var tr = $(this);
							var td = tr.children();
							// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.

							// td.eq(index)를 통해 값을 가져올 수도 있다.
							var userId = td.eq(0).text();
							//var name = td.eq(1).text();

							//더블 클릭시 선택된 행의 id값을 주키로 select.jsp페이지를 호출한다.
							window.open('select.jsp?id=' + userId, '조회', 'width=400, height=300, menubar=no, status=no, toolbar=no');
						});
	</script>
</body>
</html>