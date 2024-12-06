Feature: As an administrator (admin), I want to be able to update the Expense Head information registered in the system via API connection.

  Scenario Outline: A PATCH request to the "/api/updateExpenseHead" endpoint with valid authorization and correct
  data (id, exp_category, description, is_active, is_deleted) should return a 200 status code, a response body message of "Success," and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/updateExpenseHead" endpoint using the "updateId" from the response.

    * The api user sets "api/updateExpenseHead" path parameters.
    # Api kullanicisi "api/updateExpenseHead" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api updateExpenseHead endpoint.
    # Api kullanicisi api updateExpenseHead endpointine gondermek icin "<exp_category>", "<description>", "<is_active>" ve "<is_deleted>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body
        # Api kullanıcısı Response body icindeki updateId bilgisinin patch request body icindeki id bilgisi ile ayni oldugunu dogrular
    Examples:
      | id | exp_category | description | is_active | is_deleted |
      | 588| updated_exp  | updated_desc | yes       | no       |


  Scenario Outline: When a PATCH body (id, visitors_purpose, description) containing valid authorization information
  and invalid (id) is sent to the /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the message
  information in the response body is "Wrong information or missing information. Please check your input data and id
  number." should be verified.

    * The api user sets "api/updateExpenseHead" path parameters.
    # Api kullanicisi "api/updateExpenseHead" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api updateExpenseHead endpoint.
    # Api kullanicisi api updateExpenseHead endpointine gondermek icin "<exp_category>", "<description>", "<is_active>" ve "<is_deleted>"bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular
    Examples:
      | id | exp_category | description | is_active | is_deleted |
      | 999|  updated_exp | updated_desc| yes       | no         |


  Scenario Outline: When a PATCH body (visitors_purpose, description) that does not contain valid authorization
  information (id) is sent to the /api/updateExpenseHead endpoint, the status code returned is 203 and the
  message information in the response body is "Wrong information or missing information. Please check your input
  data and id number." It should be verified that it is.

    * The api user sets "api/updateExpenseHead" path parameters.
    # Api kullanicisi "api/updateExpenseHead" path parametrelerini olusturur
    * The api user prepares a PATCH request that does not contain an id but includes "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api updateExpenseHead endpoint.
    # Api kullanicisi api updateExpenseHead endpointine gondermek icin id içermeyen ama "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
     # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular
    Examples:
      | exp_category | description | is_active | is_deleted |
      | updated_exp  |  updated_desc| yes      | no         |

  Scenario: When a PATCH request that does not contain valid authorization information and data is sent to the
  /api/updateExpenseHead endpoint, the status code returned is 203 and the message information in the response
  body is "Wrong information or missing information. Please check your input data and id number."
  It should be verified that it is.

    * The api user sets "api/updateExpenseHead" path parameters.
    # Api kullanicisi "api/updateExpenseHead" path parametrelerini olusturur
    * The api user prepares a PATCH request that does not contain data
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

  Scenario Outline: Invalid Token When sending a PATCH body (id, visitors_purpose, description) with invalid authorization information
  to the /api/visitorsPurposeUpdate endpoint, it should be verified that the status code returned is 403 and the message
  in the response body is "You do not have authorization or token error".

    * The api user sets "api/updateExpenseHead" path parameters.
    # Api kullanicisi "api/updateExpenseHead" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api updateExpenseHead endpoint.
    # Api kullanicisi api updateExpenseHead endpointine gondermek icin "<exp_category>", "<description>", "<is_active>" ve "<is_deleted>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular
    Examples:
      | id | exp_category | description | is_active | is_deleted |
      |  588 |  updated_exp  | updated_desc |    yes   |   no   |


  Scenario Outline: It must be verified via the API that the visitor purpose record that you want to update via the API
  has been updated.

    * The api user sets "api/getExpenseHeadById" path parameters.
    # Api kullanicisi "api/getExpenseHeadById" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api updateExpenseHead endpoint.
    # Api kullanicisi api getExpenseHeadById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the "details.exp_category" information in the response body is "updated_exp".
    # Api kullanicisi response bodydeki details.exp_category bilgisinin "updated_exp" oldugunu dogrular.

    Examples:
      | id  |
      | 588 |

