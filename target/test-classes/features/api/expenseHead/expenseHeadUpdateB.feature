Feature: Bir yönetici (admin) olarak API baglantisi üzerinden sisteme kayitli Expense Head bilgilerini guncelleyebilmek istiyorum.

  Scenario Outline: /api/updateExpenseHead endpoint'ine gecerli authorization bilgileri ve dogru datalar (id, exp_category, description, is_active, is_deleted) iceren bir PATCH body gönderildiginde
  dönen status code'in 200 oldugu ve response body'deki message bilgisinin "Success" oldugu dogrulanmali.

    * The api user sets "api/updateExpenseHead" path parameters.
    * The api user prepares a PATCH request containing <id>, "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api updateExpenseHead endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body

    Examples:
    |  id | exp_category |    description     | is_active | is_deleted |
    | 577 |  stationary  | stationary expense |    yes    |     no     |

  Scenario Outline: /api/updateExpenseHead endpoint'ine gecerli authorization bilgileri ile gecersiz (id) iceren bir PATCH body (id, exp_category, description, is_active, is_deleted) gönderildiginde
  dönen status code'in 203 oldugu ve response body'deki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugu dogrulanmali.

    * The api user sets "api/updateExpenseHead" path parameters.
    * The api user prepares a PATCH request containing <id>, "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api updateExpenseHead endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

    Examples:
      |  id | exp_category |    description     | is_active | is_deleted |
      | 888 |  stationary  | stationary expense |    yes    |     no     |

  Scenario Outline: /api/updateExpenseHead endpoint'ine gecerli authorization bilgileri ile data icermeyen bir PATCH request gönderildiginde
  dönen status code'in 203 oldugu ve response body'deki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugu dogrulanmali.

    * The api user sets "api/updateExpenseHead" path parameters.
    * The api user prepares a PATCH request that does not contain an id but includes "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api updateExpenseHead endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

    Examples:
    | exp_category |    description     | is_active | is_deleted |
    |  stationary  | stationary expense |    yes    |     no     |

  Scenario Outline: Invalid Token /api/updateExpenseHead endpoint'ine gecersiz authorization bilgileri ile bir PATCH body (id, exp_category, description, is_active, is_deleted) gönderildiginde
  dönen status code'in 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * The api user sets "api/updateExpenseHead" path parameters.
    * The api user prepares a PATCH request containing <id>, "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api updateExpenseHead endpoint.
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      |  id | exp_category |    description     | is_active | is_deleted |
      | 577 |  stationary  | stationary expense |    yes    |     no     |

  Scenario Outline: Response body icindeki updateId bilgisinin /api/updateExpenseHead endpoint'ine gönderilen patch request body icindeki id bilgisi ile ayni oldugu dogrulanmali.

    * The api user sets "api/getExpenseHeadById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api updateExpenseHead endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the "details.exp_category" information in the response body is "updated_exp".

    Examples:
      | id  |
      | 588 |

