<%-- ����� ���� ���θ� �˾�â���� �˸� --%>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language=javascript>	//���� �������� �ݰ� ���ΰ�ħ�� ���� ���� �Լ�
function refresh() {									//���ΰ�ħ�� ���� ��ũ��Ʈ
window.close();											//���� �������� ����
opener.location.href = "/JspProject/main.jsp";			//main�������� ���ΰ�ħ�Ѵ�.
}
</script>
</head>


<body>
<p>
<h3 align=center>����� �����Ͻðڽ��ϱ�?</h3>
</p>
 <p>
 <form action="/JspProject/backup" method="POST" align=center> 									<%--form�� ����, post �޼ҵ带 ��� --%>
				<input type="submit" value="Ȯ��"	 onClick="refresh();">							<%-- Ȯ�� ��ư �߰� --%>
</form>
</p>


</body>
</html>