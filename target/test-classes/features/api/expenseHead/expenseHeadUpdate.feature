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

