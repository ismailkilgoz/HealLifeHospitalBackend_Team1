Feature: As an administrator (admin), I should be able to access announcements via API connection.

  Scenario Outline:When a GET request is sent to the /api/getNotice endpoint with valid authorization information, it should be verified that the status code returned is 200 and the message information in the response body is “Success”.

    * The api user sets "api/getNotice" path parameters.
    # Api kullanicisi "api/getNotice" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response  body for the entry with the specified <dataindex> , including "<type>", "<slug>", "<title>", "<date>".
     # the information (<type>", "<slag>", "<url>","<title>","<date>" ) returned in the response body of id(x) should be verified
    Examples:
      | dataindex | type    | slug          |   title               | date     |
      | 1         | notice  | noticedeneme  |  notice deneme 12345  |2024-12-05|

  Scenario: Invalid Token When a GET request is sent to the api/getNotice endpoint with invalid authorization information, it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error.".

    * The api user sets "api/getNotice" path parameters.
    # Api kullanicisi "api/getNotice" path parametrelerini olusturur
    # Api kullanicisi gecersiz authorization bilgileri ile GET request gonderir, donen responsei kaydeder,
    # status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular
  * The api user sends a GET request and saves the returned response.
  * The api user verifies that the status code is 403.
  * The api user verifies that the "message" information in the response body is "You do not have authorization or token error.".
  #Bende nullexception oldugu icin yukaridaki senaryodan 7,9,11 stepleri tekrardan alip 200-u 403 ve Success mesajini degistirerek yaptim