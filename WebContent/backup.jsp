<%-- 백업의 진행 여부를 팝업창으로 알림 --%>


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
<p>
<h3 align=center>백업을 진행하시겠습니까?</h3>
</p>
 <p>
 <form action="/JspProject/backup" method="POST" align=center> 									<%--form을 선언, post 메소드를 사용 --%>
				<input type="submit" value="확인"	 onClick="refresh();">							<%-- 확인 버튼 추가 --%>
</form>
</p>


</body>
</html>