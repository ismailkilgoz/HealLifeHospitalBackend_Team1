Feature: An administrator (admin) should be able to access the Visitors List via API connection.


  Scenario:When sending a GET request with a valid authorization and without a body to the /api/visitorsList endpoint,
  it should be verified that the status code returned is 200 and the message
  information in the response body is “Success”.

    * An api user sets "api/visitorsList" path parameters.
    # Api kullanicisi "api/visitorsList" path parametrelerini olusturur
    * An api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen response'i kaydeder
    * An api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * An api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response body'deki message bilgisinin "Success" oldugunu dogrular


  Scenario Outline: When sending a GET request with a valid authorization and without a body to the /api/visitorsList endpoint,
  it should be verified that the status code returned is 200 and the message
  information in the response body is “Success”.

    * An api user sets "api/visitorsList" path parameters.
    # Api kullanicisi "api/visitorsList" path parametrelerini olusturur
    * An api user sends a GET request with a body containing <id> and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen response'i kaydeder
    * An api user verifies the data of "<purpose>", "<source>", "<created_at>", "<name>", "<email>", "<no_of_pepple>", "<date>", "<note>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>" that is returned in the response body of id(x).
    # Api kullanicisi response body'deki "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>","<ipd_opd_staff_id>","<related_to>", "<no_of_people>", "<date, in_time>", "<out_time>", "<note>", "<image>", "<created_at>" bilgilerini dogrular

    Examples:
      | id   | purpose                                           | source | created_at          | name            | email                   | no_of_pepple | date       | note                                                                                     | id_proof | visit_to | ipd_opd_staff_id | related_to |
      | 1118 | Let's turn up the heat tonight... Just you and me | Online | 2024-11-11 22:12:33 | AmandaSofRenue1 | amandafrotte2@gmail.com | 0            | 2024-11-11 | I want you tonight... just the two of us, no distractions -  https://rb.gy/ycu4is?Diaphy |          |          |                  |            |


  Scenario: Invalid Token When sending a GET request with an invalid authorization to the /api/visitorsList endpoint,
  it should be verified that the status code returned is 403 and the message
  information in the response body is “You do not have authorization or token error.”.

    * An api user sets "api/visitorsList" path parameters.
    # Api kullanicisi "api/visitorsList" path parametrelerini olusturur
    * An api user sends a GET request with invalid authorization, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen response'i kaydeder ve status code'un 403 oldugunu dogrular.
