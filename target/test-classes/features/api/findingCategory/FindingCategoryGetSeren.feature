Feature: API_US29 As an administrator (admin) I should be able to access the finding category list via API connection.

  Scenario Outline: API_US29_TC01 Valid Authorization: Success Status Code and Response Body Validation

    * The api user sets "api/getFindingCategory" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<category>" and "<created_at>".

  Examples:
    | dataindex | category | created_at           |
    | 0         | KBB      | 2023-06-01 13:21:03 |



  Scenario: Invalid Token API_US29_TC02 Invalid Authorization: 403 Error and Unauthorized Message

    * The api user sets "api/getFindingCategory" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

