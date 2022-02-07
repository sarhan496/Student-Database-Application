<%-- 
    Document   : Insert
    Created on : Dec 31, 2021, 10:14:38 PM
    Author     : sarha
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insert JSP</h1>
    
    <c:set var="id" value="${param.id}"/>
    <c:set var="name" value="${param.name}"/>
    <c:set var="branch" value="${param.branch}"/>   
    
    <%--Kalau ada error nak keluar page = perlu tukar coding driver kepada ="org.apache.derby.jdbc.ClientDriver --%>

    <sql:setDataSource var="myDatasource"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/StudentDB" user="app"
                   password="app"/>  
    
    <c:if test="${(id!=null)&&(name!=null)&&(branch!=null)}" var="result">
        <sql:update var="result" dataSource="${myDatasource}">
    INSERT INTO STUDENT
    VALUES (?,?,?)
    
    <sql:param value="${id}"/>
    <sql:param value="${name}"/>
    <sql:param value="${branch}"/>
        </sql:update>
    
    </c:if>
        <form method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ID:</td>
                        <td><input type="text" id="id" name="id" value="001"><br></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" id="name" name="name" value="Ali"><br></td>
                    </tr>
                    <tr>
                        <td>branch</td>
                        <td><input type="text" id="branch" name="branch" value="Selangor"><br></td>
                    </tr>
                </tbody>
            </table>
            <br> <input type="submit" value="Submit"><a href="index.jsp"><button type="button">Home</button></a><br/><br/>
            
        </form>
    Outpout report send to DB:<br/>
    
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM APP.STUDENT
        </sql:query>
    
        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${result.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
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
