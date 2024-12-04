Feature:  API_US30 As an administrator (admin), I should be able to access the relevant finding category data by entering id via API connection.

@seren
  Scenario Outline: API_US30_TC01_ValidAuth_SuccessStatus_ResponseBodyValidation_ById

    * The api user sets "api/getFindingCategoryById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api FindingCategoryById endpoint.
    * The api user sends a GET request body and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the data in the response body includes "<id>", "<category>", "<created_at>".
  Examples:
    |id|id|category              |created_at          |
    | 7| 7|Nose Diseases |2021-10-25 06:19:58 |









  Scenario:   API_US30_TC03_InvalidAuth_403Error_UnauthorizedMessage_ById





  Scenario: Invalid Token API_US30_TC02_InvalidOrMissingData_203Error_NoIdOrWrongId