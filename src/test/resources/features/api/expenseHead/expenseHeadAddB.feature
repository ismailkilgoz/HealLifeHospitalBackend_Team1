Feature: Bir yönetici (admin) olarak API baglantisi üzerinden yeni bir Expense Head kaydi olusturabilmek istiyorum.

  Scenario Outline: /api/addExpenseHead endpoint'ine gecerli authorization bilgileri ve
  dogru datalar (exp_category, description, is_active, is_deleted) iceren bir POST body gönderildiginde
  dönen status code'in 200 oldugu ve response body'deki message bilgisinin "Success" oldugu dogrulanmali.

    * The api user sets "api/addExpenseHead" path parameters.
    * The api user prepares a POST request containing "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api addExpenseHead endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".

    Examples:
    | exp_category |     description    | is_active | is_deleted |
    |  stationary  | stationary expense |    yes    |     no     |

  Scenario: /api/addExpenseHead endpoint'ine gecerli authorization bilgileri ve data icermeyen bir POST request gönderildiginde de
  dönen status code'in 203 oldugu ve response body'deki message bilgisinin "No information or missing information.Please check your input data." oldugu dogrulanmali.

    * The api user sets "api/addExpenseHead" path parameters.
    * The api user prepares a POST request that does not contain data
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".

  Scenario Outline: Invalid Token /api/addExpenseHead endpoint'ine gecersiz authorization bilgileri ile dogru datalar (exp_category, description, is_active, is_deleted) iceren bir  POST body gönderildiginde
  dönen status code'in 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * The api user sets "api/addExpenseHead" path parameters.
    * The api user prepares a POST request containing "<exp_category>", "<description>", "<is_active>" and "<is_deleted>" information to send to the api addExpenseHead endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

    Examples:
    | exp_category |     description    | is_active | is_deleted |
    |  stationary  | stationary expense |    yes    |     no     |

  Scenario Outline: API uzerinden olusturulmak istenen yeni Expense Head kaydinin olustugu API uzerinden dogrulanmali.

    * The api user sets "api/getExpenseHeadById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api addExpenseHead endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".

    Examples:
    | id  |
    | 300 |
