<%-- 
    Document   : Delete
    Created on : Jan 3, 2022, 2:27:14 PM
    Author     : sarhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="myDatasource" 
                   driver="org.apache.derby.jdbc.ClientDriver" 
                   url="jdbc:derby://localhost:1527/StudentDB" 
                   user="app" 
                   password="app"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Student</title>
    </head>
    <body>
        <h1>Delete Student</h1>
        
        <c:set var="id" value="${param.id}"/>
            <c:if test="${(id != null) && (id != 'select') }">
            <sql:update var="res" dataSource="${myDatasource}">
                DELETE FROM STUDENT WHERE ID = ?
                <sql:param value="${id}"/>
            </sql:update>
        </c:if>
                    <form action="Delete.jsp" method="POST">
                        ID: <select name="id">
                            <sql:query var="result" dataSource="${myDatasource}">
                                SELECT ID FROM STUDENT
                            </sql:query>
                            <c:forEach var="row" items="${result.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option>
                                        <c:out value="${column}"/>
                                    </option>
                                </c:forEach>
                            </c:forEach>
                            </select> <br/><br/>
                            <input type="submit" value="Delete Student" />
                            <a href="index.jsp"><button type="button">Home</button></a>
                    </form>
                    <br/>
            <br/>
            <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM APP.STUDENT
            </sql:query>
                
            <table border="1"
                <!--column headers-->
                <tr>
                    <c:forEach var="columnName" items="${result.columnNames}">
                        <th><c:out value="${columnName}"/></th>
                    </c:forEach>
                </tr>
                <!--column data-->
                <c:forEach var="row" items="${result.rowsByIndex}">
                    <tr>
                        <c:forEach var="column" items="${row}">
                            <td><c:out value="${column}"/></td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>                   
    </body>
</html>

