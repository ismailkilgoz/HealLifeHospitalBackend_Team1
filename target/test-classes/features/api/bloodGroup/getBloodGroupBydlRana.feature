Feature: As an administrator (admin), I should be able to access
  the relevant blood data by entering the id through the API connection.

  Scenario Outline: GET body with valid authorization information and correct data (id) is sent to the /api/getBloodGroupById endpoint, it should be verified that the status code returned is 200 and the message information in the response body is “Success”.
    GET body with valid authorization information and correct data (id) is sent to the /api/getBloodGroupById endpoint, the data (id, name, is_blood_group, created_at) in the response body should be verified.

    * The api user sets "api/getBloodGroupById" path parameters.
    # Api kullanicisi "api/getBloodGroupById" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getBloodGroupById endpoint.
    # Api kullanicisi bir id iceren get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the data in the response body includes "<id>", "<name>", "<is_blood_group>" and "<created_at>".
    Examples:
      | id | id | name      | is_blood_group | created_at                    |
      | 0  | 4  |    AB+    |     1          |    2021-10-25 06:32:48        |
     #  the information ("<id>","<name>", "<is_blood_group>", "<created_at>) returned in the response body of id(x) should be verified


    Scenario Outline: When a GET body containing valid authorization information and invalid data (id) is sent to the
    api/getBloodGroupById endpoint, the status code returned is 203 and the message information in the response body
    is "No id or wrong id." It should be verified that it is.

      * The api user sets "api/getBloodGroupById" path parameters.
    # Api kullanicisi "api/getBloodGroupById" path parametrelerini olusturur
      * The api user prepares a Get request containing the <id> information to send to the api getBloodGroupById endpoint.
          # Api kullanicisi bir id iceren get request hazirlar
      * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
      * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 200 oldugunu dogrular
      * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
  Examples:
      |id |
      |34567|

      Scenario: When a GET request that does not contain valid authorization information and data (id) is sent to the
      api/getBloodGroupById endpoint, the status code returned is 203 and the message information in the response body is
      "No id or wrong id." It should be verified that it is
        * The api user sets "api/getBloodGroupById" path parameters.
    # Api kullanicisi "api/getBloodGroupById" path parametrelerini olusturur
        * The api user prepares a Get request doesnt contain information to send to the api getBloodGroupById endpoint.
         # Api kullanicisi bir id iceren get request hazirlar
        * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
        * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 200 oldugunu dogrular
        * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

  Scenario Outline: Invalid Token When sending a GET body with invalid authorization information to the /api/getBloodGroupById endpoint,
  it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error".

    * The api user sets "api/getBloodGroupById" path parameters.
    # Api kullanicisi "api/getBloodGroupById" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getBloodGroupById endpoint.
     # Api kullanicisi bir id iceren get request hazirlar
    * The api user sends a GET body, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi gecersiz authorization bilgileri ile GET request gonderir, donen responsei kaydeder,
    # status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

  Examples:
    |id |
    |4  |




