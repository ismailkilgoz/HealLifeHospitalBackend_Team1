Feature: As an administrator (admin) I should be able to access the list of blood types registered in the system via API connection.


  Scenario Outline: When a GET request is sent to the /api/getBloodGroup endpoint with valid authorization information,
                    it should be verified that the status code returned is 200 and the message information in the response
                    body is “Success” and  the information (name, is_blood_group, created_at) returned in the response body
                    of id(x) should be verified..

    * The api user sets "api/getNotice" path parameters.
    # Api kullanicisi "api/getNotice" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> , including "<type>", "<slug>","<url>","<title>","<date>".
     #  the information (<name>", "<is_blood_group>", "<created_at>) returned in the response body of id(x) should be verified
    Examples:
      |dataIndex| type | slug           | url   | title           |  date            |
      |  0      |notice|noticehospital  |       | notice hospital |  2024-12-06      |



  Scenario: Invalid Token api/getNotice endpoint'ine gecersiz authorization bilgileri ile bir GET request gönderildiginde
                   dönen status code'un 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token
                   error." oldugu dogrulanmali.

    * The api user sets "api/getNotice" path parameters.
    # Api kullanicisi "/api/getNotice" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.




  Scenario Outline: When sending a GET body with valid authorization information and correct data (id) to the
  /api/visitorsPurposeId endpoint, it should be verified that the status code returned is 200 and the message
  information in the response body is “Success”.

    * The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "/api/getNoticeById" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the data in the response body includes "<id>", "<type>", "<slug>", "<url>", "<title>", "<date>".
    # Api kullanicisi response bodydeki data "<id>", "<visitors_purpose>", "<description>" ve "<created_at>" içeriklerini doğrular.

    Examples:
      | id | id   | type    | slug           | url    | title            | date       |
      | 408| 408  | notice  | noticehospital |        | notice hospital  | 2024-12-06 |


  @ftm
  Scenario: When a GET request that does not contain valid authorization information and data (id) is sent to the
  api/getNoticeById endpoint, the status code returned is 203 and the message information in the response body is
  "No id or wrong id." It should be verified that it is

    * The api user sets "api/getNoticeById" path parameters
    # Api kullanicisi "api/getNoticeById" path parametrelerini olusturur
    * The api user prepares a GET request that does not contain data
    # Api kullanicisi data icermeyen bir get request hazırlar
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular



  Scenario Outline: Invalid Token When sending a GET body with invalid authorization information to the api/getNoticeById
  endpoint, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    * The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/getNoticeById" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id   |
      | 40880|