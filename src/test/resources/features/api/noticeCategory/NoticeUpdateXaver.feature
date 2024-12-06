Feature: As an administrator (admin), I should be able to update the visitor purpose information registered in the
  system via API connection.

  @XN
  Scenario Outline: A PATCH request to the "api/updateNotice" endpoint with valid authorization and correct
  data (id, type, title, description, slug) should return a 200 status code, a response body message of "Success," and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/getNoticeById" endpoint using the "updateId" from the response.

    * The api user sets "api/updateNotice" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<type>", "<title>", "<description>" and "<slug>" information to send to the api updateNotice endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body
    # Api kullanıcısı Response body icindeki updateId bilgisinin patch request body icindeki id bilgisi ile ayni oldugunu dogrular

    Examples:
      | id  | type   | title           | description   | slug           |
      | 409 | notice | notice hospital | notice deneme | noticehospital |


  Scenario Outline: A PATCH request to the "api/updateNotice" endpoint with valid authorization and correct
  data (id, type, title, description, slug) should return a 203 status code, a response body message of "Wrong information or missing information. Please check your input data and id number." and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/getNoticeById" endpoint using the "updateId" from the response.

    * The api user sets "api/updateNotice" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<type>","<title>", "<description>" and "<slug>" information to send to the api updateNotice endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin ""Wrong information or missing information. Please check your input data and id number."" oldugunu dogrular
    * The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body
    # Api kullanıcısı Response body icindeki updateId bilgisinin patch request body icindeki id bilgisi ile ayni oldugunu dogrular

    Examples:
      | id    | type   | title           | description   | slug           |
      | 34567 | notice | notice hospital | notice deneme | noticehospital |

  Scenario Outline: A PATCH request to the "api/updateNotice" endpoint with valid authorization and correct
  data (id, type, title, description, slug) should return a 203 status code, a response body message of "Wrong information or missing information. Please check your input data and id number." and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/getNoticeById" endpoint using the "updateId" from the response.

    * The api user sets "api/updateNotice" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request that does not contain an id but includes "<type>","<title>", "<description>" and "<slug>" information to send to the api updateNotice endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin ""Wrong information or missing information. Please check your input data and id number."" oldugunu dogrular
    * The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body
    Examples:
      | type   | title           | description   | slug           |
      | notice | notice hospital | notice deneme | noticehospital |