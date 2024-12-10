Feature: As an administrator (admin) I should be able to delete the visitor puspose record in the system via API connection.

  Scenario: A DELETE request to the "api/deleteNotice" endpoint with valid authorization
  and correct data (id) should return a 200 status code, a response body message of "Success," and the "DeletedId" in the
  response should match the "id" in the request body. The deletion should be confirmed by sending a GET request to the
  "api/deleteNotice" endpoint using the "DeletedId" from the response.

    * The api user sets "api/deleteNotice" path parameters.
    # Api kullanicisi "api/deleteNotice" path parametrelerini olusturur
    * The api user prepares a DELETE request to send to the api api/deleteNotice add endpoint
    # Api kullanıcısı api deleteNotice endpointine gönderilmek üzere bir DELETE request hazırlar.
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the Deletedid information is the same as the id information in the request body
    # Api kullanıcısı DeletedId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular

  # api