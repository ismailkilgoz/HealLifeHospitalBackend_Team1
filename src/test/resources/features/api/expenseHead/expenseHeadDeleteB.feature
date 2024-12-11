Feature: Bir yönetici (admin) olarak API baglantisi üzerinden sistemdeki Expense Head kaydini silebilmeliyim.

  Scenario:   /api/deleteExpenseHead endpoint'ine gecerli authorization bilgileri ve dogru data (id) iceren bir DELETE body gönderildiginde
  dönen status code'in 200 oldugu ve response body'deki message bilgisinin "Success" oldugu dogrulanmali.

    * The api user sets "api/deleteExpenseHead" path parameters.
    * The api user prepares a DELETE request to send to the api deleteExpenseHead add endpoint.
    * The api user sends a DELETE request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the deletedId information is the same as the id information in the request body

  Scenario: /api/deleteExpenseHead endpoint'ine gecerli authorization bilgileri ve data (id) icermeyen bir DELETE request gönderildiginde
  dönen status code'un 203 oldugu ve response body'deki message bilgisinin "No id or wrong id. Please check your id number." oldugu dogrulanmali.

    * The api user sets "api/deleteExpenseHead" path parameters.
    * The api user prepares a DELETE request to send to the api deleteExpenseHead add endpoint.
    * The api user sends a DELETE request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".

  Scenario: Invalid Token /api/deleteExpenseHead endpoint'ine gecersiz authorization bilgileri ile bir DELETE body gönderildiginde
  dönen status code'in 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * The api user sets "api/deleteExpenseHead" path parameters.
    * The api user prepares a DELETE request that does not contain data
    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

  Scenario Outline: API uzerinden silinmek istenen Expense Head kaydinin silindigi, API uzerinden dogrulanmali.

    * The api user sets "api/getExpenseHeadById " path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".

    Examples:
    | id  |
    | 596 |