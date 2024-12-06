Feature: As an administrator (admin), I should be able to access
  the relevant blood data by entering the id through the API connection.

  Scenario Outline: GET body with valid authorization information and correct data (id) is sent to the /api/getNoticeById endpoint, it should be verified that the status code returned is 200 and the message information in the response body is “Success”.
  GET body with valid authorization information and correct data (id) is sent to the api/getNoticeById endpoint, the data (id, type, slug, url, title, date) in the response body should be verified.

    * The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/getBloodGroupById" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getNoticeById endpoint.
    # Api kullanicisi bir id iceren get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body includes "<id>","<type>", "<slug>","<title>""<date>".
     #  the information ("<id>","<type>", "<slug>", "<url>","<title>""<date>") returned in the response body of id(x) should be verified
    Examples:
      | id    |id  | type    |slug |title|date      |
      | 341  |341  |notice   |Ein    |hallo|2023-06-02|


  Scenario Outline: When a GET body containing valid authorization information and invalid data (id) is sent to the
  /api/getNoticeById endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id." It should be verified that it is.

    * The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/getNoticeById" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getNoticeById endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular

    Examples:
      | id  |
      | 3422|


  Scenario: When a GET request that does not contain valid authorization information and data (id) is sent to the
    /api/getNoticeById endpoint, the status code returned is 203 and the message information in the response body is
  "No id or wrong id." It should be verified that it is.

    * The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a GET request that does not contain data
    # Api kullanicisi data icermeyen bir get request hazırlar
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular

  @XN
  Scenario Outline: Invalid Token When sending a GET body with invalid authorization information to the /api/getNoticeById
  endpoint, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    * The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getNoticeById endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    Examples:
      | id |
      | 341 |
