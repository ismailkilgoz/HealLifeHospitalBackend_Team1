Feature: As an administrator (admin) I should be able to access the STAFF List via API connection.

  @iso
  Scenario Outline: When a GET request is sent to the  api/staffList endpoint with valid authorization information, it should be verified that the status code returned is 200 and the message information in the response body is “Success” and  the information (name, surname, employee_id) returned in the response body of id(x) should be verified.should be verified..

    * The api user sets "api/staffList" path parameters.
    # Api kullanicisi "api/staffList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, includes "<name>", "<surname>", "<employee_id>".
     #  the information ("<name>", "<surname>", "<employee_id>") returned in the response body of id(x) should be verified
    Examples:
      | dataindex | name        | surname        | employee_id|
      | 1         |Sonia  |Bush| 9002       |

  Scenario: Invalid Token When a GET request is sent to the /api/staffList endpoint with invalid authorization information, it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error.".

    * The api user sets "api/staffList" path parameters.
    # Api kullanicisi "api/staffList" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi gecersiz authorization bilgileri ile GET request gonderir, donen responsei kaydeder,
    # status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular
