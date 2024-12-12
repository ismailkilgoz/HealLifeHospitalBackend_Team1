Feature: As an administrator (admin), I want to be able to create a new announcement record via API connection.

  Scenario Outline: A POST request to the "/api/addNotice " endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new visitor
  purpose record should be verified via a GET request to the "/api/addNotice" endpoint using the "addId"
  from the response body.

    * The api user sets "api/addNotice" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing "<type>","<title>", "<description>" and "<slug>" information to send to the api visitorsPurposeAdd endpoint.
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | type  | title              |description  |slug       |
      | notice| notice deneme 12345|notice deneme|noticedeneme|

  Scenario: When a POST request that does not contain valid authorization information and data is sent to the
  /api/addNotice endpoint, the status code returned is 203 and the message information in the response
  body is "No information or missing information. Please check your input data." It should be verified that it is.

    * The api user sets "api/addNotice" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
    * The api user prepares a POST request that does not contain data
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular

  Scenario Outline: Invalid Token /api/addNotice endpoint'ine gecersiz authorization bilgileri ile dogru datalar
  (visitors_purpose, description) iceren bir  POST body gönderildiginde dönen status code'in 403 oldugu ve
  response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.
    * The api user sets "api/addNotice" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing "<type>","<title>", "<description>" and "<slug>" information to send to the api visitorsPurposeAdd endpoint.
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | type  | title              |description  |slug       |
      | notice| notice deneme 12345|notice deneme|noticedeneme|


  Scenario Outline: The creation of the neww noticeAdd record to be created via the API must be verified via the API.

    * The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getNoticeById endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    Examples:
      | id  |
      | 399 |