<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>Parts - Главная</title>
<!-- TODO copy resources with maven dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>

<script>
    var myApp = angular.module('partApp', ['ui.bootstrap']);
     myApp.controller('partController', function($scope, $http) {
		 $http.get('${pageContext.request.contextPath}/allPartsJson')
				 .then(function successCallback(response) {
					 $scope.parts = response.data;
					 $scope.minQtyObligate = Math.min.apply(Math, $scope.parts
                     			.filter(item => item.obligate == "true")
                     			.map(function(item) {return item.quantity}));

                     		$scope.filteredParts = []
                     		,$scope.currentPage = 1
                     		,$scope.numPerPage = 10
                     		,$scope.maxSize = 5;

                     		$scope.$watch('currentPage + numPerPage', function() {
                     			var begin = (($scope.currentPage - 1) * $scope.numPerPage)
                     			, end = begin + $scope.numPerPage;

                     			$scope.filteredParts = $scope.parts.slice(begin, end);
                     		});
                           });
	 });
</script>
</head>
<body>
<div ng-app = "partApp" ng-controller="partController">
<p>Фильтр деталей:</p>
<form>
        <input type="text" style="width:20em" ng-model = "$scope.search.name" placeholder = "Наименование" />
        <input type="reset" ng-click="$scope.search={}"/>
</form>
  <input type="radio" ng-model="sortBy" ng-value="" checked> все детали<br>
  <input type="radio" ng-model="sortBy.obligate" ng-value="true"> только необходимые<br>
  <input type="radio" ng-model="sortBy.obligate" ng-value="false"> опциональные<br>
  <br>
            <table class="table table-hover">
                <tr>
                    <th>Наименование</th>
                    <th>Необходимость</th>
                    <th>Количество</th>
                    <th>Редактировать</th>
                    <th>Удалить</th>
                </tr>
                <tr ng-repeat="part in filteredParts | filter:sortBy | filter:{name: $scope.search.name}">
                    <td>{{ part.name }}</td>
                    <td>{{ part.obligate === "true" ? "Да" : "Нет" }}</td>
                    <td>{{ part.quantity }}</td>
                    <td><a href="{{ part._links.self.href }}">Изменить</a></td>
                    <td><a href="/Parts/deletePart/{{ part.id }}">Удалить</a></td>
                </tr>
            </table>
			<pagination
				  ng-model="currentPage"
				  total-items="parts.length"
				  max-size="maxSize"
				  boundary-links="true">
</pagination>
            <p>Всего можно собрать компьютеров: {{ minQtyObligate }}</p>
        </div>
</body>
</html>