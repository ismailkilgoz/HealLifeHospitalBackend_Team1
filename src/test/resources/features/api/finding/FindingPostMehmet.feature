Feature: As an administrator (admin) I want to be able to create a new finding record via API connection.

  @US1
  Scenario Outline:   When a POST body with valid authorization information and correct data (name, description, finding_category_id)
  is sent to /api/addFinding endpoint, it should be verified that the status code returned is 200 and the message information
  in the response body is “Success”.

    When    The Api User sets "api/addFinding" path parameters.
    # Api kullanicisi "api/addFinding" path parametrelerini olusturur
    Then    The Api User prepares a POST request containing "<name>", "<description>" and <finding_category_id> information to send to the api addFinding endpoint.
    # Api kullanicisi api addFinding endpointine gondermek icin "<name>", "<description>" ve "<finding_category_id>" bilgilerini iceren bir post request hazirlar
    And     The Api User sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    Then    The Api User verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    Then    The Api User verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | name            | description        | finding_category_id |
      | bauchschmerzen  | Bauchproblem       | 188                 |



  Scenario:   When a POST request with valid authorization information and body that does not contain a data
  is sent to /api/addFinding endpoint, the status code returned is 203 and the message information in the response body
  is "No information or missing information. Please check your input data." It should be verified that it is.

    When    The Api User sets "api/addFinding" path parameters.
    # Api kullanicisi "api/addFinding" path parametrelerini olusturur
    Then    The Api User prepares a POST request that does not contain data.
    # Api kullanicisi api addFinding endpointine gondermek icin her hangi bir data icermeyen bir post request hazirlar
    And     The Api User sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    Then    The Api User verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    Then    The Api User verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular



  Scenario Outline: When a POST body is sent to /api/addFinding endpoint with invalid authorization (Invalid Token) information
  and correct data (name, description, finding_category_id), it should be verified that the status code returned
  is 403 and the message in the response body is "You do not have authorization or token error".

    When    The Api User sets "api/addFinding" path parameters.
    # Api kullanicisi "api/addFinding" path parametrelerini olusturur
    Then    The Api User prepares a POST request containing "<name>", "<description>" and <finding_category_id> information to send to the api addFinding endpoint.
    # Api kullanicisi api addFinding endpointine gondermek icin "<name>", "<description>" ve "<finding_category_id>" bilgilerini iceren bir post request hazirlar
    And     The Api User sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    Then    The Api User verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    Then    The Api User verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | name            | description        | finding_category_id |
      | bauchschmerzen  | Bauchproblem       | 188                 |


  Scenario Outline:   The new finding record to be created through the API must be verified from the API.
  (With the "addId" returned in the response body, the record creation can be verified by sending a GET body to
  the /api/getFindingById endpoint).

    Given   The Api User sets "api/getFindingById" path parameters.
    # Api kullanicisi "api/getFindingById" path parametrelerini olusturur
    Then    The Api User prepares a GET request containing the <id> information to send to the api getFindingById endpoint.
    # Api kullanicisi api getFindingById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And     The Api User sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen response'u' kaydeder
    Then    The Api User verifies that the status code is 200.
    # Api kullanicisi status code'unun 200 oldugunu dogrular
    And     The Api User verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id   |
      | 413  |
