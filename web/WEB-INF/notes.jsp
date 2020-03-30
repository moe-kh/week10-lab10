<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <style>
      table, th, td {
      padding: 10px;
      border: 1px solid black; 
      border-collapse: collapse;
      }
    </style>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/notes.js"></script>
    </head>
    <body>
        <h1>Notes!</h1>
        <table>
            <col width="250">
            <col width="150">
            <tr>
                <td>Date Created</td>
                <td>Title</td>
            </tr>
            <c:forEach var="oneNote" items="${noteList}" varStatus="status">
                <form method="POST">
                    <input type="hidden" name="action" value="editClicked=${oneNote.noteid}"/>
                    <tr>
                        <td>${oneNote.datecreated}</td>
                        <td>${oneNote.title}</td>
                        <td><input type="submit" value="Edit"/></td>
                    </tr>
                </form>    
            </c:forEach>
        </table><br>
        <h2>${whatToDo} Note</h2>
        <c:if test="${whatToDo eq 'Edit'}">
            <form method="POST">
            <input type="hidden" name="action" value="delete=${editNoteID}"/>
            <input type="submit" value="Delete note"/><br><br>
            </form>
        </c:if>
        <form method="POST" id="form2">
            <c:if test="${whatToDo eq 'Add'}">
                <input type="hidden" name="action" value="add"/>
            </c:if>
            <c:if test="${whatToDo eq 'Edit'}">
                <input type="hidden" name="action" value="edit=${editNoteID}"/>
            </c:if>
            <input type="text" placeholder="Title" value="${titleBox}" name="inputTitle"/><br>
            <textarea rows="7" cols="30" form="form2" name="inputContents">${textareaBox}</textarea>
            <input type="submit" value="${whatToDo}"/>
        </form>
    </body>
</html>
