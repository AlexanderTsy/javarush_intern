<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
    <c:forEach var="part" items="${partList}" varStatus="loop">
    {
        "id":"${part.id}",
        "name":"${part.name}",
        "obligate":"${part.obligate}",
        "quantity":"${part.quantity}",
        "_links": {
            "self": { "href":"${pageContext.request.contextPath}/editPart/${part.id}"
            },
            "parts" : { "href":"${pageContext.request.contextPath}/allPartsJson"
            }
        }
    }${!loop.last ? ',' : ''}
    </c:forEach>
]