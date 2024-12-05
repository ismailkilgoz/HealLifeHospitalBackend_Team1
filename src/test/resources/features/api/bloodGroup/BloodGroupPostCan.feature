Feature: As an administrator (admin) I want to be able to create a new visitor purpose record via API connection.

  Scenario Outline: A POST request to the "/api/addBloodGroup" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new visitor
  purpose record should be verified via a GET request to the "/api/addBloodGroup" endpoint using the "addId"
  from the response body.

    * The api user sets "api/addBloodGroup" path parameters.
    # Api kullanicisi "api/addBloodGroup" path parametrelerini olusturur
    * The api user prepares a POST request containing "<name>" and "<is_blood_group>" information to send to the api visitorsPurposeAdd endpoint.
    # Api kullanicisi api addBloodGroup endpointine gondermek icin "<name>" ve "<is_blood_group>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | name        | is_blood_group |
      | Kan Grubu   | 2              |


  Scenario: When a POST request that does not contain valid authorization information and data is sent to the
  /api/addBloodGroup endpoint, the status code returned is 203 and the message information in the response
  body is "No information or missing information. Please check your input data." It should be verified that it is.

    * The api user sets "api/addBloodGroup" path parameters.
    # Api kullanicisi "api/addBloodGroup" path parametrelerini olusturur
    * The api user prepares a POST request that does not contain data
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular


  Scenario Outline: Invalid Token /api/addBloodGroup endpoint'ine gecersiz authorization bilgileri ile dogru datalar
  (name, is_blood_group) iceren bir  POST body gönderildiginde dönen status code'in 403 oldugu ve
  response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * The api user sets "api/addBloodGroup" path parameters.
    # Api kullanicisi "api/addBloodGroup" path parametrelerini olusturur
    * The api user prepares a POST request containing "<name>" and "<is_blood_group>" information to send to the api visitorsPurposeAdd endpoint.
    # Api kullanicisi api addBloodGroup endpointine gondermek icin "<name>" ve "<is_blood_group>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | name        | is_blood_group  |
      | Kan Grubu   | 2               |


  Scenario Outline: The creation of the new visitor purpose record to be created via the API must be verified via the API.

    * The api user sets "api/addBloodGroup" path parameters.
    # Api kullanicisi "api/addBloodGroup" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getBloodGroupById endpoint.
    # Api kullanicisi api addBloodGroup endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id  |
      | 509 |


