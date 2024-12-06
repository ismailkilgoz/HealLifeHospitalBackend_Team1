Feature: API_US32 As an administrator (admin), I should be able to update the finding category information registered in the system via API connection.
@seren
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


  Scenario: API_US32_TC02_InvalidData_203Error_WrongOrMissingInput








  Scenario: Invalid Token API_US32_TC03_InvalidAuth_403Error_UnauthorizedMessage_UpdateCategory


    Scenario Outline: Verify with GET Method that API_US32_TC01_ValidAuth_SuccessStatus_RecordUpdateValidation

      * The api user sets "api/updateFindingCategory" path parameters.
      * The api user prepares a PATCH request containing <id> and "<category>" information to send to the api Finding Category endpoint.
      * The api user sends a "GET" request and saves the returned response.



      Examples:
        |id   |    category    |
        | 143 | ill category 1 |






