Feature: Adding a Finding Category via API
  This feature tests the addition of finding categories using the POST API endpoint.
@Seren
  Scenario Outline: Invalid Token for Adding Finding Category
    * The api user sets "/api/addFindingCategory" path parameters.
    When The API user sends a "POST" request with the following request body:
      | key       | value           |
      | category  | <category>      |
      | created_at| <created_at>    |
    Then The API user verifies the status code is 403
    And The API user verifies the response body contains "You do not have authorization or token error"

    Examples:
      | endpoint               | category      | created_at  |
      | api/findingCategoryAdd | Test Category | 2023-12-03 |

  Scenario Outline: Valid Token for Adding Finding Category
    Given The API user sets "<endpoint>" path parameters
    When The API user sends a "POST" request with the following request body:
      | key       | value           |
      | category  | <category>      |
      | created_at| <created_at>    |
    Then The API user verifies the status code is 200
    And The API user verifies the response body contains "Success"

    Examples:
      | endpoint               | category      | created_at  |
      | api/findingCategoryAdd | ValidCategory | 2023-12-03 |
