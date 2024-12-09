Feature: As an administrator (admin), I should be able to update the finding information registered in the system via API connection.


  Scenario Outline:   When a PATCH body with valid authorization information and correct data (id, name, description, finding_category_id)
  is sent to /api/updateFinding endpoint, it should be verified that the status code returned is 200 and the message information
  in the response body is “Success”.

    When    The Api User sets "api/updateFinding" path parameters.
    # Api kullanicisi "api/updateFinding" path parametrelerini olusturur
    Then    The Api User prepares a PATCH request containing <id>, "<name>", "<description>" and <finding_category_id> information to send to the api updateFinding endpoint.
    # Api kullanicisi api updateFinding endpointine gondermek icin "<name>", "<description>" ve "<finding_category_id>" bilgilerini iceren bir post request hazirlar
    And     The Api User sends a Patch request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 200.
    # Api kullanicisi status code'unun 200 oldugunu dogrular
    Then    The Api User verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular



    Examples:
      | id       | name            | description        | finding_category_id |
      | 413      | bauchschmerzen  | Bauchproblem       | 1888                |


  Scenario Outline:   When a PATCH body (id, name, description, finding_category_id) containing an invalid (id)
  with valid authorization information is sent to the /api/updateFinding endpoint, the status code returned is 203 and
  the message in the response body is "Wrong information or missing information. Please check your input data and id number."

    When    The Api User sets "api/updateFinding" path parameters.
    # Api kullanicisi "api/updateFinding" path parametrelerini olusturur
    Then    The Api User prepares a PATCH request containing <id>, "<name>", "<description>" and <finding_category_id> information to send to the api updateFinding endpoint.
    # Api kullanicisi api updateFinding endpointine gondermek icin "<name>", "<description>" ve "<finding_category_id>" bilgilerini iceren bir post request hazirlar
    And     The Api User sends a Patch request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 203.
    # Api kullanicisi status code'unun 200 oldugunu dogrular
    Then    The Api User verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id       | name            | description        | finding_category_id |
      | 8888     | bauchschmerzen  | Bauchproblem       | 188                 |



  Scenario Outline:   When a PATCH body (name, description, finding_category_id) without (id) is sent with valid authorization information
  to the /api/updateFinding endpoint, the status code returned is 203 and  the message in the response body
  is "Wrong information or missing information. Please check your input data and id number."

  when a PATCH body (name, description, finding_category_id) without (id) is sent,

    When    The Api User sets "api/updateFinding" path parameters.
    # Api kullanicisi "api/updateFinding" path parametrelerini olusturur
    Then    The Api User prepares a PATCH request containing "<name>", "<description>" and <finding_category_id> information to send to the api updateFinding endpoint.
    # Api kullanicisi api updateFinding endpointine gondermek icin "<name>", "<description>" ve "<finding_category_id>" bilgilerini iceren bir post request hazirlar
    And     The Api User sends a Patch request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 203.
    # Api kullanicisi status code'unun 200 oldugunu dogrular
    Then    The Api User verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | name            | description        | finding_category_id |
      | bauchschmerzen  | Bauchproblem       | 188                 |



  Scenario:   When a PATCH body that does not contain any data is sent with valid authorization information
  to the /api/updateFinding endpoint, the status code returned is 203 and  the message in the response body
  is "Wrong information or missing information. Please check your input data and id number."


    When    The Api User sets "api/updateFinding" path parameters.
    # Api kullanicisi "api/updateFinding" path parametrelerini olusturur
    Then    The Api User prepares a PATCH request that does not contain data.
    # Api kullanicisi api updateFinding endpointine gondermek icin her hangi bir data icermeyen bir post request hazirlar
    And     The Api User sends a Patch request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the status code is 203.
    # Api kullanicisi status code'unun 200 oldugunu dogrular
    Then    The Api User verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular


  Scenario Outline:   When a PATCH body with correct data (id, name, description, finding_category_id) and invalid authorization (Invalid Token) information
  is sent to /api/updateFinding endpoint, it should be verified that the status code returned is 403 and the message in the response body
  is "You do not have authorization or token error".

    When    The Api User sets "api/updateFinding" path parameters.
    # Api kullanicisi "api/updateFinding" path parametrelerini olusturur
    Then    The Api User prepares a PATCH request body containing <id>, "<name>", "<description>" and <finding_category_id> information to send to the api updateFinding endpoint.
    # Api kullanicisi api updateFinding endpointine gondermek icin "<name>", "<description>" ve "<finding_category_id>" bilgilerini iceren bir post request hazirlar
    Then    The Api User sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen response'u' kaydeder, status code'unun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular


    Examples:
      | id       | name            | description        | finding_category_id |
      | 8        | bauchschmerzen  | Bauchproblem       | 188                 |


  Scenario Outline: Verify that the updateId in the response body is the same as the id in the patch request body sent to
  the /api/updateFinding endpoint.

    Given   The Api User sets "api/updateFinding" path parameters.
    # Api kullanicisi "api/updateFinding" path parametrelerini olusturur
    Then    The Api User prepares a PATCH request containing <id>, "<name>", "<description>" and <finding_category_id> information to send to the api updateFinding endpoint.
    # Api kullanicisi api updateFinding endpointine gondermek icin "<name>", "<description>" ve "<finding_category_id>" bilgilerini iceren bir post request hazirlar
    And     The Api User sends a Patch request and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen response'u kaydeder
    Then    The Api User verifies that the updateId information is the same as the id information in the request body
    # Api kullanıcısı updateId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular


    Examples:
      | id       | name            | description        | finding_category_id |
      | 413      | bauchschmerzen  | Bauchproblem       | 1888                |



  Scenario Outline: It should be verified that the finding record that is requested to be updated via API has been updated via API.
  (It can be verified that the record has been updated by sending GET body to /api/getFindingById endpoint with
  the "updateId" returned in the response body).


    Given   The Api User sets "api/getFindingById" path parameters.
    # Api kullanicisi "api/getFindingById" path parametrelerini olusturur
    Then    The Api User prepares a GET request containing the <id> information to send to the api getFindingById endpoint.
    # Api kullanicisi api getFindingById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And     The Api User sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen response'u' kaydeder


    Examples:
      | id       |
      | 413      |
      | 414      |


