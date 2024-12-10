Feature: Bir yönetici (admin) olarak API baglantisi üzerinden id girerek ilgili Expense Head verisine erisebilmeliyim.

  Scenario Outline: /api/getExpenseHeadById endpoint'ine gecerli authorization bilgileri
  ve dogru data (id) iceren bir GET body gönderildiginde dönen status code'in 200 oldugu
  ve response body'deki message bilgisinin "Success" oldugu dogrulanmali.

    * The api user sets "api/getExpenseHeadById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the data in the response body includes "<id>", "<exp_category>", "<description>", "<is_active>" "<is_deleted>" and "<created_at>".
    Examples:
    | id | id | exp_category |    description     | is_active | is_deleted |      created_at     |
    | 12 | 12 |  stationary  | stationary expense |    yes    |     no     | 2023-05-16 12:35:20 |

  Scenario Outline: /api/getExpenseHeadById endpoint'ine gecerli authorization bilgileri ve data (id) icermeyen bir GET request gönderildiginde
  dönen status code'un 203 oldugu ve response body'deki message bilgisinin "No id or wrong id." oldugu dogrulanmali

    * The api user sets "api/getExpenseHeadById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    Examples:
    |  id  |
    | 4040 |

  Scenario Outline: Invalid Token /api/getExpenseHeadById endpoint'ine gecersiz authorization bilgileri ile bir GET body gönderildiginde
  dönen status code'in 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * The api user sets "api/getExpenseHeadById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
    | id |
    | 10 |