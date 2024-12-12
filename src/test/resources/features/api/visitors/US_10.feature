Feature: An administrator (admin) should be able to access the Visitor information of the user whose id is given through the API connection.


  Scenario Outline:When sending a GET body with valid authorization and correct data (id) to the /api/visitorsId endpoint,
  it should be verified that the status code returned is 200 and the message information in the response body is “Success”.

    * An api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    * An api user sends a GET request with a body containing "<id>" and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen response'i kaydeder
    * An api user verifies that the returned status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response body'deki message bilgisinin "Success" oldugunu dogrular
    Examples:
      | id   |
      | 1118 |


  Scenario Outline: When a GET body with valid authorization information and correct data (id) is sent to the /api/visitorsId endpoint,
  the data in the response body (id, source, purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id,
  related_to, no_of_pepple, date, in_time, out_time, note, image, created_at) should be verified.

    * An api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    * An api user sends a GET request with a body containing "<id>" and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen response'i kaydeder
    * An api user verifies the data of "<purpose>", "<source>", "<created_at>", "<name>", "<email>", "<no_of_pepple>", "<date>", "<note>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>" that is returned in the response body of id(x).
    # Api kullanicisi response body'deki "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>","<ipd_opd_staff_id>","<related_to>", "<no_of_people>", "<date, in_time>", "<out_time>", "<note>", "<image>", "<created_at>" bilgilerini dogrular

    Examples:
      | id   | purpose                                           | source | created_at          | name            | email                   | no_of_pepple | date       | note                                                                                     | id_proof | visit_to | ipd_opd_staff_id | related_to |
      | 1118 | Let's turn up the heat tonight... Just you and me | Online | 2024-11-11 22:12:33 | AmandaSofRenue1 | amandafrotte2@gmail.com | 0            | 2024-11-11 | I want you tonight... just the two of us, no distractions -  https://rb.gy/ycu4is?Diaphy |          |          |                  |            |


  Scenario: Invalid Token When sending a GET body with invalid authorization information to the /api/visitorsId endpoint,
  it should be verified that the status code returned is 403 and
  the message in the response body is "You do not have authorization or token error".

    * An api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    * An api user sends a "GET" body with invalid authorization, saves the returned response, and verifies that the status code is 403 with the reason phrase "Forbidden".
    # Api kullanicisi GET request gonderir, donen response'i kaydeder ve status code'un 403 oldugunu dogrular.



  Scenario: Valid Token and No Data, When a GET request with a valid authorization information and no data (id) is sent to the /api/visitorsId endpoint,
  it should be verified that the status code returned is 203
  and the message information in the response body is "No id or wrong id."

    * An api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    * An api user prepears a GET body without "id"
    # Api kullanicisi eksik bir veri (id) ile bir GET body'si hazirlar
    * An api user sends a GET request and saves the returned response.
    * An api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi GET request gonderir, donen response'i kaydeder ve status code'un 203 mesaj iceriginin "No id or wrong id." oldugunu dogrular.




  Scenario Outline: Valid Token and Incorrect Data, When a GET body containing incorrect data (id) is sent, it should be verified that
  the status code returned is 203 and the message information in the response body is "No id or wrong id."

    * An api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    #* An api user prepears a GET body with incorrect id
    # Api kullanicisi yanlis bir veri (id) ile bir GET body'si hazirlar
    * An api user sends a GET request with valid authorization and incorrect "<id>", saves the returned response, and verifies that the status code is 203 with the reason phrase "No id or wrong id.".
    # Api kullanicisi GET request gonderir, donen response'i kaydeder ve status code'un 203 ve mesaj iceriginin "No id or wrong id." oldugunu dogrular.

    Examples:
      | id    |
      | 23450 |
