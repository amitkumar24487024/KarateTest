Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

Background: base url defined
  Given url 'https://jsonplaceholder.typicode.com'

  Scenario: get json data
    * def data = read('classpath:examples/users/jsonsDatas/data.json')
    And print data

  @Smoke
  Scenario: get rest api 
    And path '/users'
    When method get
    Then status 200
    And print response

  @Smoke
  Scenario Outline: print data
    * print 'name: ', '<name>'
    * print 'username: ', '<username>'
    * print 'email: ', '<email>'
    * print 'phone: ', '<phone>'

  Examples:
  | name | username | email | phone |
  | Leanne Graham | Bret |ami@gmail.coim | 1-770-736-8031 x56442 |
  | Ervin Howell | Antonette |test@gmail.com | 010-692-6593 x09125 |