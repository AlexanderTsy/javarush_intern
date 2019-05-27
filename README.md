# javarush_intern
Javarush internship test task

#### H3 Known issues:
#### H4  charset issue:
#### H5  description:
      when saving part with utf-8 name "материнская плата" turns to "Ð¼Ð°ÑÐµÑÐ¸Ð½ÑÐºÐ°Ñ Ð¿Ð»Ð°ÑÐ°"
#### H5  didn't work:
      set accept-charset="utf-8" in form tag
      add enctype="application/x-www-form-urlencoded" to form tag
      controller @RequestMapping( consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
      controller @RequestMapping( headers = {"content-type=application/x-www-form-urlencoded"})
#### H5  solution:
      to be done
#### H4  pagination filter issue:
#### H5  description:
      when setting obligate radio, filter applies to pages. Correct functionality: filer array of parts than paginate it.
    solution:
      to be done
  
Setup
  mvn install
  deploy Parts.war to server
  run sql_data_script.sql to 'test' database supporting mysql5 dialect
  open application in browser
  
