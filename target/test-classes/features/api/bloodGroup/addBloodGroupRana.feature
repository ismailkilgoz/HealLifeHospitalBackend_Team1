Feature: As an administrator (admin) I would like to be able to create a new blood group via API connection.

  Scenario Outline: When a POST body with valid authorization information and correct data (name, is_blood_group)
  is sent to /api/addBloodGroup endpoint, it should be verified that the status code returned is 200 and the message information
  in the response body is “Success”.

    * The api user sets "api/addBloodGroup" path parameters.
    # Api kullanicisi "api/addBloodGroup" path parametrelerini olusturur
    * The api user prepares a post request containing the <name>,<is_blood_group> information to send to the api getBloodGroupById endpoint.
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The Api user send Post request with data
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular.

  Examples:
    |name         |is_blood_group |
    |Kan Grubu    |   1           |

    Scenario: When a POST request that does not contain valid authorization information and data is sent to the /api/addBloodGroup endpoint,
    the status code returned is 203 and the message information in the response body is "No information or missing information.
    Please check your input data." It should be verified that it is.

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

Scenario Outline:Invalid Token api/addBloodGroup endpoint'ine gecersiz authorization bilgileri ile dogru datalar
(name and is_blood_group) iceren bir  POST body gönderildiginde dönen status code'in 403 oldugu ve
response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

  * The api user sets "api/addBloodGroup" path parameters.
    # Api kullanicisi "api/addBloodGroup" path parametrelerini olusturur
  * The api user prepares a POST request containing "<name>" and "<is_blood_group>" information to send to the api addBloodGroup endpoint.
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<name>" ve "<is_blood_group>" bilgilerini iceren bir post request hazirlar
  * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
  * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
  * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
  Examples:
    | name | is_blood_group |
    |sanane|2               |

    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular



  Scenario Outline:The new blood group record to be created from the API must be verified from the API.
  (It can be verified that the record was created by sending GET body to /api/getBloodGroupById endpoint with "addId" returned in the response body).
    * The api user sets "api/addBloodGroupById" path parameters.
    # Api kullanicisi "api/addBloodGroup" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getBloodGroupById endpoint.
    # Api kullanicisi id iceren bir get request gonderir
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

  Examples:
    |id|
    | 506 |


