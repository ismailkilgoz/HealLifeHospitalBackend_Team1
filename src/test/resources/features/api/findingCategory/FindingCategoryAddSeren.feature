Feature:   Adding a Finding Category via API
  This feature tests the addition of finding categories using the POST API endpoint.


@seren
Scenario Outline:API_US31_TC01_ValidAuth_SuccessStatus_RecordCreationValidation
  * The api user sets "api/addFindingCategory" path parameters.
  * The api user prepares a POST request containing "<category>" and "<created_at>" information to send to the api FindingCategory endpoint.
  * The api user sends a POST request body and saves the returned response.
  * The api user verifies that the status code is 200.
  * The api user verifies that the "message" information in the response body is "Success".

  Examples:
    | category            | created_at          |
    | Abdominal Diseases  | 2024-04-12 02:19:41 |






  Scenario:API_US31_TC02_InvalidOrMissingData_203Error_MissingOrIncorrectInput

    * The api user sets "api/addFindingCategory" path parameters.
    * The api user prepares a "POST" request that does not contain data for FindingCategory.
    * The api user sends a "POST" request body and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".



  Scenario Outline:Invalid Token  API_US31_TC03_InvalidAuth_403Error_UnauthorizedMessage_AddCategory
    * The api user sets "api/addFindingCategory" path parameters.
    * The api user prepares a POST request containing "<category>" and "<created_at>" information to send to the api FindingCategory endpoint.
    * The api user sends a "POST" request body and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
Examples:
  | category            | created_at          |
  | Abdominal Diseases  | 2024-04-12 02:19:41 |


  Scenario Outline:
    * The api user sets "api/getFindingCategoryById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api FindingCategoryById endpoint.
    * The api user sends a "GET" request body and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the data in the response body includes "<id>", "<category>", "<created_at>".
    Examples:
              |id   |id   |category           |created_at          |
              | 143 | 143 | Abdominal Diseases|2024-12-04 08:57:34 |


