<%-- ����â���� ������ ��ư�� ������� �ش� �˾�â���� ������ Ȱ��ȭ. --%>
<%-- ����� �߰��ϴ� ����� ������ �ִ� ������ --%>
<%-- �������� ����� ������ �Է��� �� �ִ�. --%>
<%-- �������� �ϴܿ� �߰��ϱ� ��ư�� ���� --%>


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
	<form action="/JspProject/insert" method="post">					<%--insertServlet���� action form, post �޼ҵ带 ��� --%>
		<table border="1" width="300" height="150" align="center">		<%--���̺� Ư¡ �� �ֱ� --%>
			<tr>
				<td>���</td>												<%--���̺� 1�� 1�� --%>
				<td><input type="text" name="id"></td>					<%--���̺� 1�� 2���� id�� �ޱ� --%>
			</tr>
			<tr>
				<td>�̸�</td>												<%--���̺� 2�� 1�� --%>
				<td><input type="text" name="name"></td>				<%--���̺� 2�� 2���� name�� �ޱ� --%>
			</tr>
			<tr>
				<td>����</td>												<%--���̺� 3�� 1�� --%>
				<td>
				<input type="radio" name="sex" value="��" checked>��		<%--���̺� 3�� 2���� radio �ΰ� ���ڸ� ����Ʈ�� �д�. --%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<%-- ���� --%> 
				<input type="radio" name="sex" value="��">��</td>			<%--radio�� �ΰ� ���ڵ� ������ �� �ְ� �����. --%>
			</tr>
			<tr>
				<td>����</td>												<%--���̺� 4�� 1�� --%>
				<td><select name="position">							<%--select option ��� --%>
						<option value="���" selected="���">���</option>	<%-- ��� ����, ����Ʈ�� �д�. --%>
						<option value="����">����</option>					<%-- ���� ���� --%>
						<option value="�븮">�븮</option>					<%-- �븮 ���� --%>
						<option value="����">����</option>					<%-- ���� ���� --%>
						<option value="����">����</option>					<%-- ���� ���� --%>
						<option value="����">����</option>					<%-- ���� ���� --%>
				</select></td>
			</tr>
			<tr>
				<td>�μ�</td>												<%--���̺� 5�� 1�� --%>
				<td><input type="text" name="dept"></td>				<%--���̺� 5�� 1�� detp�� �ޱ� --%>
				</td>
			<tr>
				<td>�޿�</td>												<%--���̺� 6�� 1�� --%>
				<td><input type="text" name="sal"></td>					<%--���̺� 6�� 2�� sal�� �ޱ� --%>
			</tr>
		</table>
		<br> <br>														<%-- �ٹٲ� --%>


		<div align="center">											<%-- �߰��� ��ġ --%>

			<input type="submit" value="�߰��ϱ�" onClick='refresh();'>	<%-- �߰��ϱ� ��ư Ŭ���� refresh()�Լ��� ȣ���Ѵ�. --%>

		</div>
	</form>
</body>


</html>