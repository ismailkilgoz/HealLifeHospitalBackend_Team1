Feature: As an administrator (admin), I should be able to access the relevant finding category data by entering id
  through the API connection.


  Scenario Outline:   When a GET body with valid authorization information and correct data (id) is sent to
  the /api/getFindingCategoryId endpoint, it should be verified that the status code returned is 200 and
  the message information in the response body is “Success”.

    Given   The Api User sets "api/getFindingCategoryId" path parameters.
    # Api kullanicisi "api/getFindingCategoryId" path parametrelerini olusturur
    Then    The Api User prepares a GET request containing the <id> information to send to the api getFindingCategoryId endpoint.
    # Api kullanicisi api getFindingCategoryId  endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And     The Api User sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 200.
    # Api kullanicisi status code'unun 200 oldugunu dogrular
    And     The Api User verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id |
      | 5  |
      #| 6  |


  Scenario Outline:   When a GET body with valid authorization information and correct data (finding_category_id) is sent to
  the /api/getFindingCategoryId endpoint, the information (name, description, finding_category_id, created_at)
  of id(x) returned in the response body should be verified.

    Given   The Api User sets "api/getFindingCategoryId" path parameters.
    # Api kullanicisi "api/getFindingCategoryId " path parametrelerini olusturur
    Then    The Api User prepares a GET request containing the <id> information to send to the api getFindingCategoryId endpoint.
    # Api kullanicisi api getFindingCategoryId  endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And     The Api User sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen response'u kaydeder
    And     The Api User verifies the information in the response body for the entry with the specified information, including "<name>", "<description>", "<finding_category_id>" and "<created_at>".
    # Api kullanıcısı response body icindeki <id> numarasına sahip olanin "<name>", "<description>", "<finding_category_id>" ve "<created_at>"  bilgilerini doğrular.

    Examples:
      | id | name         | description       | finding_category_id | created_at          |
      | 5  | Damaged Hair | xxx               | 5                   | 2021-10-25 06:20:06 |


  Scenario: When a GET body that does not contain valid data (id) with valid authorization information is sent to
  the /api/getFindingCategoryId  endpoint, the status code returned is 203 and the message information
  in the response body is "No id or wrong id."

    Given   The Api User sets "api/getFindingCategoryId " path parameters.
    # Api kullanicisi "api/getFindingCategoryId " path parametrelerini olusturur
    Then    The Api User prepares a GET request that does not contain data
    # Api kullanicisi data icermeyen bir get request hazırlar
    And     The Api User sends a GET body and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 203.
    # Api kullanicisi status code'unun 203 oldugunu dogrular
    And     The Api User verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular


  Scenario Outline: When a GET body containing valid authorization information and invalid data (id) is sent to the
  /api/getFindingCategoryId endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id."

    When    The Api User sets "api/getFindingCategoryId" path parameters.
    # Api kullanicisi "api/getFindingCategoryId" path parametrelerini olusturur
    Then    The Api User prepares a GET request containing the <id> information to send to the api getFindingCategoryId endpoint.
    # Api kullanicisi api getFindingCategoryId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And     The Api User sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 203.
    # Api kullanicisi status code'unun 203 oldugunu dogrular
    And     The Api User verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular

    Examples:
      | id     |
      | 88888  |


  Scenario Outline: When a GET body is sent to the /api/getFindingCategoryId endpoint with invalid authorization (Invalid Token) information,
  it should be verified that the status code returned is 403 and the message in the response body
  is "You do not have authorization or token error".

    When    The Api User sets "api/getFindingCategoryId" path parameters.
    # Api kullanicisi "api/getFindingCategoryId" path parametrelerini olusturur
    Then    The Api User prepares a GET request containing the <id> information to send to the api getFindingCategoryId endpoint.
    # Api kullanicisi api getFindingCategoryId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    Then    The Api User sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen response'u' kaydeder, status code'unun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id |
      | 5  |
