<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Home</title>
</head>
<body>
    <div class="container">
	<h1>${headerMessage}</h1>
    <form:form method="POST" action="editPart" modelAttribute="part">

        <form:hidden path="id" />
         <table>
             <tr>
                 <td><form:label path="name">Наименование</form:label></td>
                 <td><form:input path="name"/></td>
             </tr>
             <tr>
                 <td><form:radiobutton path="obligate" value="true"/> необходимая</td>
                 <td><form:radiobutton path="obligate" value="false"/> опциональная</td>
             </tr>
             <tr>
                 <td><form:label path="quantity">Количество</form:label></td>
                 <td><form:input path="quantity"/></td>
             </tr>
             <tr>
                 <td><input type="submit" value="Submit"/></td>
             </tr>
         </table>
    </form:form>
    </div>
</body>
</html>