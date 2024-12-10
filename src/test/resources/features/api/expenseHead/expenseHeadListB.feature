Feature: Bir yönetici (admin) olarak API baglantisi üzerinden Expense Head List'e erisebilmeliyim.

  Scenario Outline: /api/getExpenseHead endpoint'ine gecerli authorization bilgileri ile bir GET request gönderildiginde
  dönen status code'un 200 oldugu ve response body'deki message bilgisinin "Success" oldugu
  ve id(x) olaninin response body'de donen bilgileri (exp_category, description, is_active, is_deleted, created_at) dogrulanmali.

    * The api user sets "api/getExpenseHead" path parameters.
    * The api user sends a GET request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<exp_category>", "<description>", "<is_active>", "<is_deleted>" and "<created_at>"
    Examples:
      | dataindex | exp_category | description | is_active | is_deleted | created_at |
      |     1     |  Equipements |             |    yes    |    no      | 2021-10-25 13:50:50 |


  Scenario: Invalid Token /api/getExpenseHead endpoint'ine gecersiz authorization bilgileri ile bir GET request gönderildiginde dönen status code'un 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali

    * The api user sets "api/getExpenseHead" path parameters.
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.