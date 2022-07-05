Feature: simple Api
 Background:
 * url 'https://simple-books-api.glitch.me'
 *  header Accept = 'application/json'
 * def token = '4bcfe0da03f8c798b2f5b9adaac6374d25a022df6eb793ef8fba89f448edf4c2'


  Scenario: First Test

    Given  url 'https://simple-books-api.glitch.me'
    When method Get
    Then status 200

  Scenario: Get Books Test
    Given path   '/books'
    When method Get
    Then status 200
    And  print response
    And  print responseStatus
    And  print responseHeaders
    And  print responseCookies
    And  print responseTime
    And assert response[0].name=='The Russian'





  Scenario: Post orders Test
    Given path   '/orders'
    * header Authorization = 'Bearer ' + token
    And request {"bookId": 1,"customerName": "John"}
    When method Post
    And print response


  Scenario: Get orders Test
    Given path   '/orders/S-hDYyFVDG0UTtJG4kDIE'
    * header Authorization = 'Bearer ' + token
    When method Get
    And print response



  Scenario: Patch orders Test

    Given path   '/orders/S-hDYyFVDG0UTtJG4kDIE'
    * header  Authorization  = 'Bearer ' + token
    And request {"customerName": "medo"}
    When method PATCH
    Then status 204
    And print response



  Scenario: Get orders Test
    Given path   '/orders'
    When method Get

    And  print response
    And  print responseStatus
    And  print responseHeaders
    And  print responseCookies
    And  print responseTime


  Scenario: Delete orders Test

    Given path   '/orders/S-hDYyFVDG0UTtJG4kDIE'
    * header  Authorization  = 'Bearer ' + token
    When method DELETE
    Then status 204
    And print response