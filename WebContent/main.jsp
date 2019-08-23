<%-- ó�� ����� ��Ÿ���� ȭ������ id�� name�� ������ �����ϰ� ��������� �������ش�. --%>
<%-- ���� ��ܿ��� ������ ��ư�� �ִ�. --%>
<%-- ȭ�� �߰����� id�� name�� ������ ��Ÿ���� �����͵��� ���̺� ���� �Ǿ��ִ�. --%>
<%-- ����� ������ �ڼ��� ���� �ʹٸ� �ش��ϴ� ����� ���̺��࿡�� ����Ŭ���ϴ� ����� ������ �ִ�. --%>


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
		<br> <br>												<%-- �ٹٲ� --%>
	</div>

	<table align="right">
		<tr>
			
			<td><input type="button" value="��ü ������ ���"				<%-- ��ü ������ ��� ��ư �߰� --%>
				<%-- ����߰� ��ư ���ý� insert.jsp �˾�â ���� --%>
				onclick="window.open('backup.jsp','����ϱ�','width=400, height=100, menubar=no, status=no, toolbar=no');"><br></td>  
		</tr>
		<tr>
			<td><input type="button" value="��� ���"				<%-- ������ ��ư �߰� --%>
				<%-- ����߰� ��ư ���ý� insert.jsp �˾�â ���� --%>
				onclick="window.open('insert.jsp','����߰��ϱ�','width=400, height=300, menubar=no, status=no, toolbar=no');"><br></td> 
		</tr>
	</table>

	<div>
		<br> <br>
	</div>



	<%--���̺� ���� --%>
	<table id="employee" border="1" width="300"
		class="table table-bordered table-hover text-center">

		<thead>
			<tr>
				<th>���</th>												<%-- ���̺��� ù �࿡ ���  --%>
				<th>�̸�</th>												<%-- ���̺��� ù �࿡ �̸�  --%>
			</tr>
		</thead>
		
		<%			//main�������� pk�� id�� �̸��� �����ϰ� ǥ�����ֱ� ���� DB�� �����Ͽ� employee���̺��� ��� ������ id�� ������������ ����Ѵ�.
					//select id, name from employee order by id;
			Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.
			
			//main.jsp�� db�� ���� �����ϸ� ������ ������ ����ϱ� ������ ĳ�ÿ� �÷��ΰ� ���� ���� ����.
			//���� statement�� �ƴ� preparedstatement�� ����Ѵ�.
			PreparedStatement stmt = null;	

			try {
				String connect = new String("jdbc:oracle:thin:@localhost:1521:TestDB");		//"�ּ�:��Ʈ:DB��"
				String user = "system";														//username
				String passwd = "tiger";													//password

				Class.forName("oracle.jdbc.driver.OracleDriver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
				conn = DriverManager.getConnection(connect, user, passwd); // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
				String sql = "select id, name from employee order by id"; // sql ���� , id�� ������������ ��ü id�� name�� ����Ѵ�.
				stmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
				ResultSet rset = stmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.

				while (rset.next()) { // ����� �� �྿ ���ư��鼭 �����´�.
					String id = rset.getString("id");		//String�� id�� �����Ͽ� db�� id�Ӽ��� ���� �����´�.
					String name = rset.getString("name");	//String�� name�� �����Ͽ� db�� name�Ӽ��� ���� �����´�.
		%>
		<tbody>
			<tr>
				<td width="100"><%=id%></td>			<%--������������ ���� db�������� ���� ���� id���� �� �߰� --%>
				<td width="100"><%=name%></td>			<%--������������ ���� db�������� ���� ���� id�� name���� �� �߰� --%>
			</tr>
			<%
				}
				conn.close();
				} catch (Exception e) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
					e.printStackTrace();
					out.println("employee ���̺� ȣ�⿡ �����߽��ϴ�.");
				}
			%>
		</tbody>
	</table>


	<script>
		// ���̺��� Row Ŭ���� �� ��������
		$("#employee tr").dblclick(
						function() {
							// ���� Ŭ���� Row(<tr>)
							var tr = $(this);
							var td = tr.children();
							// �ݺ����� �̿��ؼ� �迭�� ���� ��� ����� �� �� �ִ�.

							// td.eq(index)�� ���� ���� ������ ���� �ִ�.
							var userId = td.eq(0).text();
							//var name = td.eq(1).text();

							//���� Ŭ���� ���õ� ���� id���� ��Ű�� select.jsp�������� ȣ���Ѵ�.
							window.open('select.jsp?id=' + userId, '��ȸ', 'width=400, height=300, menubar=no, status=no, toolbar=no');
						});
	</script>
</body>
</html>