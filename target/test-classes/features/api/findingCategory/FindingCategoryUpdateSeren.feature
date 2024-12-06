Feature: API_US32 As an administrator (admin), I should be able to update the finding category information registered in the system via API connection.

  Scenario Outline: API_US32_TC01_ValidAuth_SuccessStatus_RecordUpdateValidation
    * The api user sets "api/updateFindingCategory" path parameters.
    * The api user prepares a PATCH request containing <id> and "<category>" information to send to the api Finding Category endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the "updateId" information in the Response body is the same as the id information in the patch request body.

    Examples:
              |id   |    category    |
              | 143 | ill category 1 |

  @seren
  Scenario Outline: API_US32_TC02_InvalidData_203Error_WrongOrMissingInput

    * The api user sets "api/updateFindingCategory" path parameters.
    * The api user prepares a PATCH request containing "<id>" and "<category>" information to send to the api FindingCategory endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

    Examples:
      | id   | category       |
      | 6523 | ill category 1 |








  Scenario Outline: Invalid Token API_US32_TC03_InvalidAuth_403Error_UnauthorizedMessage_UpdateCategory
    * The api user sets "api/updateFindingCategory" path parameters.
    * The api user prepares a PATCH request containing <id> and "<category>" information to send to the api Finding Category endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

    Examples:
      |id |category      |
      |61 | ill category Problems|




  Scenario Outline: Verify with GET Method that API_US32_TC01_ValidAuth_SuccessStatus_RecordUpdateValidation

    * The api user sets "api/getFindingCategoryById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api FindingCategoryById endpoint.
    * The api user sends a "GET" request body and saves the returned response.
    * The api user verifies that the "details.id" information in the response body is "61".
    * The api user verifies that the "details.category" information in the response body is "heart problem".


    Examples:
      |id   |
      | 61 |




