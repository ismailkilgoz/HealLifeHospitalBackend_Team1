Feature: As an administrator (admin) I should be able to access the Visitor List via API connection.

  @uygar
  Scenario: When a GET request is sent to the /api/visitorsList endpoint with valid authorization
  information, it should be verified that the status code returned is 200 and the message information
  in the response body is “Success”.
    Given The api user sets "api/visitorsList" path parameters.
    When The api user send the GET request and saves the returned response.
    Then The api user verifies that the returned code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".
