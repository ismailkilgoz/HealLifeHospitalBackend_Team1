Feature: API_US33 As an administrator (admin) I should be able to unregister the finding category registered in the system via API connection.


  Scenario Outline: API_US33_TC01_ValidAuth_SuccessStatus_RecordDeletionValidation

    * The api user sets "api/deleteFindingCategory " path parameters.
    * The api user prepares a "DELETE" request with <id> for the FindingCategoryById API endpoint.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    Examples:
      | id  |
      | 150 |



  Scenario: API_US33_TC02_InvalidData_203Error_NoId_Deletion
    * The api user sets "api/deleteFindingCategory " path parameters.
    * The api user prepares a "DELETE" request that does not contain data for FindingCategory.
    * The api user sends a "DELETE" request body and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".






  Scenario Outline: Invalid Token API_US33_TC03_InvalidAuth_403Error_UnauthorizedMessage_DeleteCategory

    * The api user sets "api/deleteFindingCategory " path parameters.
    * The api user prepares a "DELETE" request with <id> for the FindingCategoryById API endpoint.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    Examples:
      | id  |
      | 149 |



  Scenario Outline: API_US33_TC04_InvalidData_203Error_WrongId_Deletion

    * The api user sets "api/deleteFindingCategory " path parameters.
    * The api user prepares a "DELETE" request with <id> for the FindingCategoryById API endpoint.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    Examples:
      | id  |
      | 148841 |
