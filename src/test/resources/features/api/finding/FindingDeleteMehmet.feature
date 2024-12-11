Feature: As an administrator (admin) I should be able to unregister finding registered in the system via API connection.


  Scenario Outline: When a DELETE body with valid authorization information and correct data (id) is sent to the /api/deleteFinding endpoint,
  it should be verified that the status code returned is 200 and the message information in the response body is “Success”.

    Given   The Api User sets "api/deleteFinding" path parameters.
    # Api kullanicisi "api/deleteFinding" path parametrelerini olusturur
    Then    The Api User prepares a Delete request containing the <id> information to send to the api deleteFinding endpoint.
    # Api kullanicisi api deleteFinding endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And     The Api User sends a Delete body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen response'u' kaydeder
    Then    The Api User verifies that the status code is 200.
    # Api kullanicisi status code'unun 200 oldugunu dogrular
    And     The Api User verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id   |
      | 418  |


  Scenario: When a DELETE request that does not contain data (id) with valid authorization information is sent to
  the /api/deleteFinding endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id. Please check your id number."

    Given   The Api User sets "api/deleteFinding" path parameters.
      # Api kullanicisi "api/deleteFinding" path parametrelerini olusturur
    Then    The Api User prepares a Delete request that does not contain data
      # Api kullanicisi data icermeyen bir get request hazırlar
    And     The Api User sends a Delete body and saves the returned response.
      # Api kullanicisi GET request gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 203.
      # Api kullanicisi status code'unun 203 oldugunu dogrular
    And     The Api User verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
      # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular



  Scenario Outline: When a DELETE request containing invalid data (id) with valid authorization information is sent to
  the /api/deleteFinding endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id. Please check your id number." It should be verified that it is.

    Given   The Api User sets "api/deleteFinding" path parameters.
      # Api kullanicisi "api/deleteFinding" path parametrelerini olusturur
    Then    The Api User prepares a Delete request containing the <id> information to send to the api deleteFinding endpoint.
      # Api kullanicisi api deleteFinding endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And     The Api User sends a Delete body and saves the returned response.
      # Api kullanicisi GET body gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 203.
      # Api kullanicisi status code'unun 203 oldugunu dogrular
    And     The Api User verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
      # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular


    Examples:
      | id    |
      | 88888 |


  Scenario Outline: When a DELETE body is sent to the /api/deleteFinding endpoint with invalid authorization (Invalid Token) information,
  it should be verified that the status code returned is 403 and the message in the response body
  is "You do not have authorization or token error".

    Given   The Api User sets "api/deleteFinding" path parameters.
      # Api kullanicisi "api/deleteFinding" path parametrelerini olusturur
    Then    The Api User prepares a Delete request containing the <id> information to send to the api deleteFinding endpoint.
      # Api kullanicisi api deleteFinding endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    Then    The Api User sends a Delete request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
      # Api kullanicisi GET request gonderir, donen response'u' kaydeder, status code'unun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular


    Examples:
      | id   |
      | 341  |


  Scenario Outline: It must be verified that the deletedId in the response body is the same as the id in
  the delete request body sent to the /api/deleteFinding endpoint.

    Given   The Api User sets "api/deleteFinding" path parameters.
        # Api kullanicisi "api/deleteFinding" path parametrelerini olusturur
    Then    The Api User prepares a Delete request containing the <id> information to send to the api deleteFinding endpoint.
        # Api kullanicisi api deleteFinding endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And     The Api User sends a Delete body and saves the returned response.
        # Api kullanicisi GET body gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the DeletedId information is the same as the id information in the request body
        # Api kullanıcısı DeletedId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular


    Examples:
      | id   |
      | 419  |


  Scenario Outline: It should be verified from the API that the finding record to be deleted has been deleted.
  (It can be verified that the record has been deleted by sending GET body to /api/getFindingById endpoint with
  the "deletedId" returned in the response body).

    When    The Api User sets "api/getFindingById" path parameters.
        # Api kullanicisi "api/getFindingById" path parametrelerini olusturur
    Then    The Api User prepares a GET request containing the <id> information to send to the api getFindingById endpoint.
        # Api kullanicisi api getFindingById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And     The Api User sends a GET body and saves the returned response.
        # Api kullanicisi GET body gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 203.
        # Api kullanicisi status code'unun 203 oldugunu dogrular
    And     The Api User verifies that the "message" information in the response body is "No id or wrong id.".
        # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular


    Examples:
      | id   |
      | 419  |
