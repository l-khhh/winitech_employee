<%-- ����â���� �ش� ����� ���̺� ���� ����Ŭ�� �� ��� �ش� �˾�â���� ������ Ȱ��ȭ. --%>
<%-- ��� �������� ��Ÿ���� �ִ� ������ --%>
<%-- ���������� ����� ������ ��ȸ �� �� �ִ�. --%>
<%-- ���������� ����� ������ ���� �Է� �� �� �ִ�. --%>
<%-- ������ ���� �� �������� �ϴܿ� �����ϱ� ��ư�� ���� --%>
<%-- ���������� ����� ������ ���� �� �� �ִ�. --%>
<%-- �������� �ϴܿ� �����ϱ� ��ư�� ���� --%>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language=javascript>	
	function btn_click(n) {//���� �������� �ݰ� �����ϱ�, �����ϱ� ��ư�� ������ ��� ���� �ش��ϴ� �������� �̵��ϸ� main�������� ���ΰ�ħ�� ���� ������� �Լ�
		if (n == "modify") {	//�����ϱ� ��ư�� ���õǾ��� ���
			frm1.action = "/JspProject/update";	//�����ϱ� �������� �̵��ϸ�
			window.self.close();	//������ â�� �ݰ�
			opener.location.href = "/JspProject/main.jsp";	//main.jsp�� ���ΰ�ħ�Ѵ�.
		} else {	//�����ϱ� ��ư�� ���õǾ��� ���
			frm1.action = "/JspProject/delete";	//�����ϱ� �������� �̵��ϸ�
			window.self.close();	//������ â�� �ݰ�
			opener.location.href = "/JspProject/main.jsp";	//main.jsp�� ���ΰ�ħ�Ѵ�.
		}
	}
</script>
</head>


<body>
	<%
		String userId = request.getParameter("id");	//main.jsp�� ���� �� id���� �д´�.
		//���� �����ϱ� ���ؼ� name, sex, position, dept, sal�� ���� �� �ʱ�ȭ�Ѵ�.
		String name=null;
		String sex=null;
		String position=null;
		String dept=null;
		String sal=null;
		
		//main�������� �� pk�� id�� ������� db�� �����Ͽ� �ش��ϴ� id�� �������� ����Ѵ�.
		//select name, sex, position,dept,sal from employee where id=" + userId;
		Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.

		//select.jsp�� db�� ������ �� ������ ������ ����� Ȯ���� ���� ������ ĳ�ÿ� �÷��ΰ� ���� ���� ����.
		//���� statement�� �ƴ� preparedstatement�� ����Ѵ�.
		PreparedStatement stmt = null;
		try {
			String connect = new String("jdbc:oracle:thin:@localhost:1521:TestDB");		//"�ּ�:��Ʈ:DB��"
			String user = "system";														//username
			String passwd = "tiger";													//password
			Class.forName("oracle.jdbc.driver.OracleDriver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
			conn = DriverManager.getConnection(connect, user, passwd); // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
			String sql = "select name, sex, position,dept,sal from employee where id=" + userId; // sql ����
			stmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
			ResultSet rset = stmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
			
			while (rset.next()) { // ����� �� �྿ ���ư��鼭 �����´�.
			name=rset.getString("name");//String�� name��  db�� name�Ӽ��� ���� �����´�.
			sex=rset.getString("sex");//String�� sex��  db�� sex�Ӽ����� �����´�.
			position=rset.getString("position");//String�� position��  db�� position�Ӽ��� ���� �����´�.
			dept=rset.getString("dept");//String�� dept��  db�� dept�Ӽ��� ���� �����´�.
			sal=rset.getString("sal");}//String�� sal��  db�� sal�Ӽ��� ���� �����´�.
			conn.close();
		} catch (Exception e) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
			e.printStackTrace();
			out.println("employee ���̺� ȣ�⿡ �����߽��ϴ�.");
		}
	%>
	<form name="frm1" method="POST"> 												<%--form�� ����, post �޼ҵ带 ��� --%>
		<table border="1" width="300" height="150" align="center">
			<tr>
				<td>���</td>															<%-- 1�� 1���� ��� --%>
				<td><input type="text" name="userId" value="<%=userId%>"></td>		<%-- 1�� 2���� �Է� �޾ƿ� userid�� ǥ�� --%>
			</tr>
			<tr>
				<td>�̸�</td>															<%-- 2�� 1���� �̸� --%>
				<td><input type="text" name="name" value="<%=name%>"></td>			<%-- 2�� 2���� �Է� �޾ƿ� name�� ǥ�� --%>
			</tr>
			<tr>
				<td>����</td>															<%-- 3�� 1���� ���� --%>
				<td>																<%-- 3�� 2���� ��쿡�� --%>
				<% if(sex.equals("��")) {%>											<%-- �Է¹��� sex�� ���� ������ ��� ������ ���� ��ư�� checked --%>
				<input type="radio" name="sex" value="��" checked>��
				<input type="radio" name="sex" value="��">��</td>	
				<%} 
				
				else {%>															<%-- �Է¹��� sex�� ���� ������ ��� ������ ���� ��ư�� checked --%>
				<input type="radio" name="sex" value="��" >��
				<input type="radio" name="sex" value="��" checked>��</td>
				<%} %>
			</tr>
			<tr>
				<td>����</td>															<%-- 4�� 1���� ���� --%>
				<td><select name="position">										<%-- 4�� 2���� ��� ������ �������� --%>
				<%if(position.equals("���")) {%>										<%-- ������ ����� ��� ����� ���� --%>
						<option value="���" selected="���">���</option>
						<option value="����">����</option>
						<option value="�븮">�븮</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<%}
				else if(position.equals("����")){%>									<%-- ������ ������ ��� ������ ���� --%>
					<option value="���" >���</option>							
						<option value="����" selected="����">���� </option>
						<option value="�븮">�븮</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<%}
				else if(position.equals("�븮")){%>									<%-- ������ �븮�� ��� �븮�� ���� --%>
				<option value="���" >���</option>
					<option value="����">����</option>
					<option value="�븮"selected="�븮">�븮 </option>
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<%}
				else if(position.equals("����")){%>									<%-- ������ ������ ��� ������ ���� --%>
				<option value="���">���</option>
					<option value="����">����</option>
					<option value="�븮">�븮</option>
					<option value="����" selected="����">����</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<%}
				else if(position.equals("����")){%>									<%-- ������ ������ ��� ������ ���� --%>
				<option value="���">���</option>
					<option value="����">����</option>
					<option value="�븮">�븮</option>
					<option value="����">����</option>
					<option value="����" selected="����">���� </option>
					<option value="����">����</option>
					<%}
				else if(position.equals("����")){%>									<%-- ������ ������ ��� ������ ���� --%>
				<option value="���" >���</option>
					<option value="����">����</option>
					<option value="�븮">�븮</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="����" selected="����">����</option>
					<%} %>
				</select></td>
			</tr>
			<tr>
				<td>�μ�</td>															<%--5�� 1���� �μ� --%>
				<td><input type="text" name="dept" value="<%=dept %>"></td>			<%--5�� 2���� �Է¹��� dept�� �� ǥ�� --%>
			</tr>
			<tr>
				<td>�޿�</td>															<%--6�� 1���� �޿� --%>
				<td><input type="text" name="sal" value="<%=sal%>"></td>			<%--6�� 2���� �Է¹��� sal�� �� ǥ�� --%>
			</tr>
		</table>
		<p align="right">
		<input type="submit" value="�����ϱ�" onClick='btn_click("delete");'>			<%--�����ϱ� submit����, ���ý� btn_click("delete")�Լ��� ȣ��ȴ�. --%>
		<input type="submit" value="�����ϱ�" onClick='btn_click("modify");'>			<%--�����ϱ� submit����, ���ý� btn_click("modify")�Լ��� ȣ��ȴ�. --%>
		</p>
			</form>
	<br>
	<br>
</body>
</html>