Feature: Adding a Finding Category via API
  This feature tests the addition of finding categories using the POST API endpoint.
<<<<<<< HEAD
Scenario Outline:
  * The api user sets "api/visitorsPurposeAdd" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
  * The api user prepares a POST request containing "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeAdd endpoint.
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir post request hazirlar
  * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
  * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
  * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

  Examples:
    | visitors_purpose | description        |
    | deneme purpose   | deneme description |



=======
>>>>>>> main
