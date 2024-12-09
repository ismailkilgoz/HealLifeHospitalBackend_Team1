Feature: As an administrator (admin) I should be able to delete the announcement record in the system via API connection.
@XN
  Scenario: A DELETE request to the "api/deleteNotice" endpoint with valid authorization
  and correct data (id) should return a 200 status code, a response body message of "Success," and the "deletedId" in the
  response should match the "id" in the request body. The deletion should be confirmed by sending a GET request to the
  "/api/getNoticeById" endpoint using the "DeletedId" from the response.

  * The api user sets "api/deleteNotice" path parameters.
    # Api kullanicisi "api/deleteNotice" path parametrelerini olusturur
  * The api user prepares a  DELETE request to send to the api deleteNotice add endpoint.
    # Api kullanıcısı api visitorsPurposeDelete endpointine gönderilmek üzere bir DELETE request hazırlar.
  * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsi kaydeder
  * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
  * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
  * The api user verifies that the deletedId information is the same as the id information in the request body.
    # Api kullanıcısı DeletedId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular



  Scenario: When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  /api/deleteNotice endpoint, the status code returned is 203 and the message information in the response
  body is "No id or wrong id. Please check your id number." It should be verified that it is.

    * The api user sets "api/deleteNotice" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a  DELETE request to send to the api deleteNotice add endpoint.
    # Api kullanıcısı api visitorsPurposeDelete endpointine gönderilmek üzere bir DELETE request hazırlar.
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular


  Scenario: When a DELETE request that does not contain valid authorization information and data (id) is sent to the
  /api/deleteNotice endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id. Please check your id number." It should be verified that it is.

    * The api user sets "api/deleteNotice" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request that does not contain data
    # Api kullanicisi data icermeyen bir delete request hazırlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular


  Scenario: Invalid Token When a DELETE body is sent to the /api/deleteNotice endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    * The api user sets "api/deleteNotice" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request that does not contain data
    * The api user sends a DELETE request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular


  Scenario Outline: It must be verified via the API that the visitor purpose record that is requested to be deleted via
  the API has been deleted.

    * The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getNoticeById endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular

    Examples:
      | id  |
      | 487 |