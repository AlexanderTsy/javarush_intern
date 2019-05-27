# javarush_intern
Javarush internship test task

## Setup
  mvn install
  
  deploy Parts.war to server
  
  run sql_data_script.sql to 'test' database supporting mysql5 dialect
  
  open application in browser

## Known issues
### charset issue
#### description
      when saving part with utf-8 name "материнская плата" turns to "Ð¼Ð°ÑÐµÑÐ¸Ð½ÑÐºÐ°Ñ Ð¿Ð»Ð°ÑÐ°"
#### didn't work
      set accept-charset="utf-8" in form tag
      add enctype="application/x-www-form-urlencoded" to form tag
      controller @RequestMapping( consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
      controller @RequestMapping( headers = {"content-type=application/x-www-form-urlencoded"})
#### solution
      to be done
### pagination + filter issue
#### description
      when setting obligate radio (все детали, только необходимые, опциональные), filter applies to every page separately.
#### correct functionality 
      filer whole array of parts than paginate it.
#### didn't work
      javascript angularjs filters
      $scope.filteredParts = $filter('filter')($scope.parts,$scope.search.name);
			$scope.filteredParts = $filter('limitTo')($scope.filteredParts, end, begin);
#### solution
      consider using above mentioned filters inside pageChanged event
      to be done
