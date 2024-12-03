Feature: As an administrator (admin) I should be able to access the OPD List via API connection.
  Scenario Outline: When a GET request is sent to the api/opdList endpoint with valid authorization information, it should be verified that the status code returned is 200 and the message information in the response body is “Success” and   the information (patient_name, patient_id) returned in the response body of id(x) should be verified.

    * The api user sets "api/opdList" path parameters.
    # Api kullanicisi "api/opdList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<patient_name>", "<patient_id>".
     #  the information ("<patient_name>", "<patient_id>") returned in the response body of id(x) should be verified
    Examples:
      | dataindex | patient_name|patient_id |
      |3|Smith Marsh|10|

  Scenario: Invalid Token When a GET request is sent to the api/opdList endpoint with invalid authorization information, it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error.".

    * The api user sets "api/opdList" path parameters.
    # Api kullanicisi "api/opdList" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi gecersiz authorization bilgileri ile GET request gonderir, donen responsei kaydeder,
    # status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

