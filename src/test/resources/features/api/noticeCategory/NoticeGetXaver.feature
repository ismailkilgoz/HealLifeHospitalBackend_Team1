Feature: As an administrator (admin), I should be able to access announcements via API connection.

  Scenario :When a GET request is sent to the /api/getNotice endpoint with valid authorization information, it should be verified that the status code returned is 200 and the message information in the response body is “Success”.

    * The api user sets "api/getNotice" path  parameters.
    # Api kullanicisi "api/getNotice" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned  response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is  200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the  response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular



  Scenario: Invalid Token When a GET request is sent to the /api/getBloodGroup endpoint with invalid authorization information, it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error.".

    * The api user sets "api/getNotice" path  parameters.
      * The api user sends a GET request and saves the returned  response.
      * The api user verifies that the status code is  403.
      * The api user verifies that the "message" information in the  response body is "You do not have authorization or token error.".