Feature: As an administrator (admin) I should be able to access the list of blood types registered in the system via API connection.

  @US
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





  Scenario:Invalid Token api/getNotice endpoint'ine gecersiz authorization bilgileri ile bir GET request gönderildiginde
                   dönen status code'un 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token
                   error." oldugu dogrulanmali.

    * The api user sets "api/getNotice" path parameters.
    # Api kullanicisi "/api/getNotice" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


