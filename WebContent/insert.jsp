<%-- 메인창에서 사원등록 버튼을 누를경우 해당 팝업창으로 페이지 활성화. --%>
<%-- 사원을 추가하는 기능을 가지고 있는 페이지 --%>
<%-- 페이지에 사원의 정보를 입력할 수 있다. --%>
<%-- 페이지의 하단에 추가하기 버튼이 있음 --%>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language=javascript>	//현재 페이지를 닫고 새로고침을 위해 만든 함수
function refresh() {									//새로고침을 위한 스크립트
window.close();											//현재 페이지를 닫음
opener.location.href = "/JspProject/main.jsp";			//main페이지를 새로고침한다.
}
</script>
</head>


<body>
	<form action="/JspProject/insert" method="post">					<%--insertServlet으로 action form, post 메소드를 사용 --%>
		<table border="1" width="300" height="150" align="center">		<%--테이블 특징 값 주기 --%>
			<tr>
				<td>사번</td>												<%--테이블 1행 1열 --%>
				<td><input type="text" name="id"></td>					<%--테이블 1행 2열에 id값 받기 --%>
			</tr>
			<tr>
				<td>이름</td>												<%--테이블 2행 1열 --%>
				<td><input type="text" name="name"></td>				<%--테이블 2행 2열에 name값 받기 --%>
			</tr>
			<tr>
				<td>성별</td>												<%--테이블 3행 1열 --%>
				<td>
				<input type="radio" name="sex" value="남" checked>남		<%--테이블 3행 2열에 radio 두고 남자를 디폴트로 둔다. --%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<%-- 띄어쓰기 --%> 
				<input type="radio" name="sex" value="여">여</td>			<%--radio를 두고 여자도 선택할 수 있게 만든다. --%>
			</tr>
			<tr>
				<td>직위</td>												<%--테이블 4행 1열 --%>
				<td><select name="position">							<%--select option 사용 --%>
						<option value="사원" selected="사원">사원</option>	<%-- 사원 선택, 디폴트로 둔다. --%>
						<option value="주임">주임</option>					<%-- 주임 선택 --%>
						<option value="대리">대리</option>					<%-- 대리 선택 --%>
						<option value="과장">과장</option>					<%-- 과장 선택 --%>
						<option value="차장">차장</option>					<%-- 차장 선택 --%>
						<option value="부장">부장</option>					<%-- 부장 선택 --%>
				</select></td>
			</tr>
			<tr>
				<td>부서</td>												<%--테이블 5행 1열 --%>
				<td><input type="text" name="dept"></td>				<%--테이블 5행 1열 detp값 받기 --%>
				</td>
			<tr>
				<td>급여</td>												<%--테이블 6행 1열 --%>
				<td><input type="text" name="sal"></td>					<%--테이블 6행 2열 sal값 받기 --%>
			</tr>
		</table>
		<br> <br>														<%-- 줄바꿈 --%>


		<div align="center">											<%-- 중간에 위치 --%>

			<input type="submit" value="추가하기" onClick='refresh();'>	<%-- 추가하기 버튼 클릭시 refresh()함수를 호출한다. --%>

		</div>
	</form>
</body>


</html>