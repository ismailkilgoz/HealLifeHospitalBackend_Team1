Feature: An administrator (admin), should be able to update the visitor information registered in the system via API connection.


  Scenario Outline: When sending a PATCH body with valid authorization information and correct data
  (id, purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id, related_to, no_of_pepple, date, in_time, out_time, note) to /api/visitorsUpdate endpoint,
  it should be verified that the status code returned is 200 and the message information in the response body is “Success”.

    * An api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * An api user prepears a "PATCH" request with a body containing correct data of <id>, "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", "<note>"
    # Api kullanicisi gecerli yetki ve data bilgisiyle bir POST request hazırlar
    * An api user sends a "PATCH" request and saves the returned response.
    * An api user verifies that the returned status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response body'deki message bilgisinin "Success" oldugunu dogrular
    Examples:
      | id   | purpose     | name       | email           | contact  | id_proof | visit_to    | ipd_opd_staff_id | related_to      | no_of_pepple | date       | in_time  | out_time | note                        |
      | 1255 | sorgulama 2 | Karan Ates | karis@gmail.com | 14068377 | 2021     | ipd_patient | 7                | umit ureten(83) | 1            | 2023-10-05 | 09:30 PM | 10:30 PM | please check your mail box! |


  Scenario Outline: Valid Token and Incorrect data, When a PATCH body (id, purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id, related_to, no_of_pepple, date, in_time, out_time, note)
  with valid authorization information and incorrect data (id) is sent to /api/visitorsUpdate endpoint,
  the status code returned is 203 and the message in the response body is "Wrong information or missing information. Please check your input data and id number."

    * An api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * An api user prepears a "PATCH" request with incorrect data of <id> and correct data of "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", "<note>"
    # Api kullanicisi gecerli yetki ve data bilgisiyle bir POST request hazırlar
    * An api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi gecersiz yetki ile bir POST request gonderir ve donen response'i kaydeder
    * An api user verifies that the returned status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response body'deki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular

    Examples:
      | id     | purpose     | name       | email           | contact  | id_proof | visit_to    | ipd_opd_staff_id | related_to      | no_of_pepple | date       | in_time  | out_time | note                        |
      | 125589 | sorgulama 2 | Karan Ates | karis@gmail.com | 14068377 | 2021     | ipd_patient | 7                | umit ureten(83) | 1            | 2023-10-05 | 09:30 PM | 10:30 PM | please check your mail box! |


  Scenario Outline: Valid Token and No Data (id), when a PATCH body (purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id, related_to, no_of_pepple, date, in_time, out_time, note)
  without (id) is sent, the status code returned is 203 and the message in the response body is "Wrong information or missing information. Please check your input data and id number."

    * An api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * An api user prepears a "PATCH" request without data of id and correct data of "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", "<note>"
    # Api kullanicisi gecerli yetki ve data bilgisiyle bir POST request hazırlar
    * An api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi gecerli yetki ile bir POST request gonderir ve donen response'i kaydeder
    * An api user verifies that the returned status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response body'deki message bilgisinin "Wrong information or missing information. Please check your input data." oldugunu dogrular

    Examples:
      | purpose     | name       | email           | contact  | id_proof | visit_to    | ipd_opd_staff_id | related_to      | no_of_pepple | date       | in_time  | out_time | note                        |
      | sorgulama 2 | Karan Ates | karis@gmail.com | 14068377 | 2021     | ipd_patient | 7                | umit ureten(83) | 1            | 2023-10-05 | 09:30 PM | 10:30 PM | please check your mail box! |


  Scenario: Valid Token and No Data, When a PATCH request is sent to the /api/visitorsUpdate endpoint
  that does not contain data (with valid authorization information),
  the status code returned is 203 and the message in the response body is
  "Wrong information or missing information. Please check your input data and id number.".


    * An api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * An api user prepears a "PATCH" request with a body containing no "data"
    # Api kullanicisi veri icermeyen bir PATCH request gonderir ve donen respons'i kaydeder.
    * An api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi gecerli yetki ile bir POST request gonderir ve donen response'i kaydeder
    * An api user verifies that the returned status code is 203.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".


  Scenario Outline: Invalid Token and Correct Data, When a PATCH body
  (id, purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id, related_to, no_of_pepple, date, in_time, out_time, note)
  with invalid authorization information is sent to /api/visitorsUpdate endpoint,
  it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error".

    * An api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * An api user prepears a "PATCH" request with a body containing correct data of <id>, "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", "<note>"
    # Api kullanicisi gecerli yetki ve data bilgisiyle bir POST request hazırlar
    * An api user sends a "PATCH" request with invalid token and correct data, saves the returned response, verifies that the returned status code is 403 with the reason phrase "You do not have authorization or token error".

    Examples:
      | id   | purpose  | name       | email          | contact  | id_proof | visit_to    | ipd_opd_staff_id | related_to      | no_of_pepple | date       | in_time  | out_time | note                        |
      | 1255 | deneme 3 | Murat Ates | ates@gmail.com | 14068377 | 20240118 | ipd_patient | 7                | umit ureten(83) | 7            | 2023-10-05 | 09:30 PM | 10:30 PM | please check your mail box! |



  Scenario Outline: Verify that the <updatedId> in the response body is the same as the <id> in the patch request body sent to the /api/visitorsUpdate endpoint.
    * An api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * An api user prepears a "PATCH" request with a body containing correct data of <id>, "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", "<note>"
    # Api kullanicisi gecerli yetki ve data bilgisiyle bir POST request hazırlar
    * An api user sends a "PATCH" request and saves the returned response.
    * An api user verifies that the updatedId in the response body is the same as the <id> in the "PATCH" request body.
    Examples:

      | id   | purpose     | name       | email           | contact  | id_proof | visit_to    | ipd_opd_staff_id | related_to      | no_of_pepple | date       | in_time  | out_time | note                        |
      | 1255 | sorgulama 2 | Karan Ates | karis@gmail.com | 14068377 | 2021     | ipd_patient | 7                | umit ureten(83) | 1            | 2023-10-05 | 09:30 PM | 10:30 PM | please check your mail box! |



  Scenario Outline: When sent a GET request with the data (updatedId) of the new visitor record to /api/visitorsId endpoint
  it should be verified that the new record is created through API successfully.


    * An api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    * An api user sends a "GET" request with a body containing the "data" of <updatedId> and saves the returned response.
    # Api kullanicisi (id) bilgisi iceren bir GET request gonderir ve donen respons'i kaydeder.
    * An api user verifies that the returned status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "Success".

    Examples:
      | updatedId  |
      | 1255 |