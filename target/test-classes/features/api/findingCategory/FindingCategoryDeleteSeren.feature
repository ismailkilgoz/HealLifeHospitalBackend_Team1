Feature: API_US33 As an administrator (admin) I should be able to unregister the finding category registered in the system via API connection.

  @seren
  Scenario: API_US33_TC01_ValidAuth_SuccessStatus_RecordDeletionValidation

    * The api user sets "api/deleteFindingCategory " path parameters.
    * The api user prepares a DELETE request to send to the api Finding Category endpoint.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".




  Scenario: API_US33_TC02_InvalidData_203Error_NoIdOrWrongId_Deletion







  Scenario: Invalid Token API_US33_TC03_InvalidAuth_403Error_UnauthorizedMessage_DeleteCategory



