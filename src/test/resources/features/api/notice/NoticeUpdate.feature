Feature: As an administrator (admin), I should be able to update the visitor purpose information registered in the
  system via API connection.

  Scenario Outline: A PATCH request to the "api/updateNotice" endpoint with valid authorization and correct
  data (id, type, title, description, slug) should return a 200 status code, a response body message of "Success," and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "api/visitorsPurposeId" endpoint using the "updateId" from the response.

    * The api user sets "api/updateNotice" path parameters.
    # Api kullanicisi "api/updateNotice" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<type>", "<title>", "<description>", "<slug>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<type>", "<title>", "<description>", "<slug>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the updateId information in the Response body is the same as the id information in the patch request body
    # Api kullanıcısı Response body icindeki updateId bilgisinin patch request body icindeki id bilgisi ile ayni oldugunu dogrular

    Examples:
      | id  | type   | title                  | description    | slug             |
      | 169 | notice | notice deneme 1234567  | notice deneme  | heallifehospital |



  Scenario Outline: When a PATCH body (id, type, title, description, slug) containing valid authorization information
  and invalid (id) is sent to the api/updateNotice endpoint, the status code returned is 203 and the message
  information in the response body is "Wrong information or missing information. Please check your input data and id
  number." should be verified.

    * The api user sets "api/updateNotice" path parameters.
    # Api kullanicisi "api/updateNotice" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<type>", "<title>", "<description>" and "<slug>" information to send to the api updateNotice endpoint.
    # Api kullanicisi api api/updateNotice endpointine gondermek icin  "<type>", "<title>", "<description>" and "<slug>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | id    | type   | title                  | description    | slug             |
      | 16990 | notice | notice deneme 1234567  | notice deneme  | heallifehospital |


  Scenario Outline: When a PATCH request is sent to the /api/updateNotice endpoint that does not contain data with valid authorization information,
  the status code returned is 203 and the message in the response body is "Wrong information or missing information. Please check your input data
  and id number."
    * The api user sets "api/updateNotice" path parameters.
    # Api kullanicisi "api/updateNotice" path parametrelerini olusturur
    * The api user prepares a PATCH request that does not contain an id but includes  "<type>", "<title>", "<description>" and "<slug>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api updateNotice endpointine gondermek icin id içermeyen ama  "<type>", "<title>", "<description>" and "<slug>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | type   | title                    | description    | slug              |
      |notice  | notice deneme 1234567    |  notice deneme |  heallifehospital |


  Scenario Outline: Invalid Token When sending a PATCH body (id, visitors_purpose, description) with invalid authorization information
  to the api/updateNotice endpoint, it should be verified that the status code returned is 403 and the message
  in the response body is "You do not have authorization or token error".

    * The api user sets "api/updateNotice" path parameters.
    # Api kullanicisi "api/updateNotice" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<type>", "<title>", "<description>" and "<slug>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api updateNotice endpointine gondermek icin <id>, "<type>", "<title>", "<description>" and "<slug>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id    | type   | title                  | description    | slug             |
      | 16990 | notice | notice deneme 1234567  | notice deneme  | heallifehospital |