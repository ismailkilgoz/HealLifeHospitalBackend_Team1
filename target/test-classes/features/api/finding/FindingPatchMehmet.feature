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
      | 8        | bauchschmerzen  | Bauchproblem       | 188                 |
