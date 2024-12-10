Feature: An administrator (admin) should be able to create a new visitor record via API connection.


  Scenario Outline: When sending a POST body with valid authorization information and correct data
  (purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id, related_to, no_of_pepple, date, in_time, out_time, note)
  to /api/visitorsAdd endpoint, it should be verified that the status code returned is 200 and the message information in the response body is “Success”.

    * An api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "api/visitorsAdd" path parametrelerini olusturur
    * An api user prepears a "POST" request with a body containing correct data of "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", "<note>"
    # Api kullanicisi gecerli yetki ve data bilgisiyle bir POST request hazırlar
    * An api user sends a "POST" request and saves the returned response.
    * An api user verifies that the returned status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response body'deki message bilgisinin "Success" oldugunu dogrular
    Examples:
      | purpose  | name       | email           | contact  | id_proof | visit_to    | ipd_opd_staff_id | related_to      | no_of_pepple | date       | in_time  | out_time | note                        |
      | deneme 7 | Karan Ates | karis@gmail.com | 14068377 | 2021     | ipd_patient | 7                | umit ureten(83) | 1            | 2023-10-05 | 09:30 PM | 10:30 PM | please check your mail box! |


  Scenario: Valid Token and No Data, When a POST body, with a valid authorization information and  without any data,
  is sent to the /api/visitorsAdd endpoint, it should be verified that the status code returned is 203 and
  the message in the response body is "No information or missing information. Please check your input data.".

    * An api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "api/visitorsAdd" path parametrelerini olusturur
    * An api user prepears a "POST" request with a body containing no "data"
    # Api kullanicisi data icermeyen bir POST request hazırlar
    * An api user sends a "POST" request and saves the returned response.
    # Api kullanicisi gecersiz yetki ile bir POST request gonderir ve donen response'i kaydeder
    * An api user verifies that the returned status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response body'deki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular




  Scenario Outline: Invalid Token and Correct Data, When a POST body, with invalid authorization information and correct data,
  (purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id, related_to, no_of_pepple, date, in_time, out_time, note)
  to /api/visitorsAdd endpoint, it should be verified that the status code returned is 403 and the message information in the response body is “You do not have authorization or token error.”.

    * An api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "api/visitorsAdd" path parametrelerini olusturur
    * An api user prepears a "POST" request with a body containing correct data of "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", "<note>"
    # Api kullanicisi gecerli yetki ve data bilgisiyle bir POST request hazırlar
    * An api user sends a "POST" request with invalid token and correct data, saves the returned response, verifies that the returned status code is 403 with the reason phrase "You do not have authorization or token error".

    Examples:
      | purpose   | name       | email           | contact  | id_proof | visit_to    | ipd_opd_staff_id | related_to      | no_of_pepple | date       | in_time  | out_time | note                        |
      | deneme 70 | Karan Ates | karan@gmail.com | 14068377 | 20240118 | ipd_patient | 7                | umit ureten(83) | 7           | 2023-10-05 | 09:30 PM | 10:30 PM | please check your mail box! |


  Scenario Outline: When sent a GET request with the data (addId) of the new visitor record to /api/visitorsAdd endpoint
  it should be verified that the new record is created through API successfully.


    * An api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    * An api user sends a "GET" request with a body containing the "data" of <id> and saves the returned response.
    # Api kullanicisi (id) bilgisi iceren bir GET request gonderir ve donen respons'i kaydeder.
    * An api user verifies that the returned status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id   |
      | 1160 |




