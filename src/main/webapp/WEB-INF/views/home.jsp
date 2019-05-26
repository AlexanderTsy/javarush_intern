<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Parts - Главная</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
<script>
    var myApp = angular.module('partApp', []);
     myApp.controller('partController', function($scope, $http) {
		 $http.get('${pageContext.request.contextPath}/allPartsJson')
				 .then(function successCallback(response) {
					 $scope.parts = response.data;
					 $scope.minQtyObligate = Math.min.apply(Math, $scope.parts
						.filter(item => item.obligate == "true")
						.map(function(item) {return item.quantity}));
				 }, function errorCallback(response) {
					 console.log('Something went wrong.');
				 });
      });
</script>
</head>
<body>
<div ng-app = "partApp" ng-controller="partController">
<p>Фильтр деталей:</p>
  <input type="radio" ng-model="sortBy" ng-value="" checked> все детали<br>
  <input type="radio" ng-model="sortBy.obligate" ng-value="true"> только необходимые<br>
  <input type="radio" ng-model="sortBy.obligate" ng-value="false"> опциональные<br>
            <table style="border:1px solid #CCC; margin-top:10px">
                <tr>
                    <th>Наименование</th>
                    <th>Необходимость</th>
                    <th>Количество</th>
                    <th>Редактировать</th>
                    <th>Удалить</th>
                </tr>
                <tr ng-repeat="part in parts | filter:sortBy ">
                    <td>{{ part.name }}</td>
                    <td>{{ part.obligate === "true" ? "Да" : "Нет" }}</td>
                    <td>{{ part.quantity }}</td>
                    <td><a href="{{ part._links.self.href }}">Изменить</a></td>
                    <td><a href="${pageContext.request.contextPath}/deletePart/{{ part.id }}">Удалить</a></td>
                </tr>
            </table>
            <p>Всего можно собрать компьютеров: {{ minQtyObligate }}</p>
        </div>
</body>
</html>