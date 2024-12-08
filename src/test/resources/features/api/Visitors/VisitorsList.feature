Feature: As an administrator (admin) I should be able to access the Visitor List via API connection.

  @uygar
  Scenario: When a GET request is sent to the /api/visitorsList endpoint with valid authorization
  information, it should be verified that the status code returned is 200 and the message information
  in the response body is “Success”.
    Given The api user sets "api/visitorsList" path parameters.
    When The api user send the GET request and saves the returned response.
    Then The api user verifies that the returned code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".

  Scenario: When a GET request is sent to the /api/visitorsList endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error.".
    Given The api user sets "api/visitorsList" path parameters.
    When The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Scenario Outline:  When a GET request is sent to the /api/visitorsList endpoint with valid authorization information
    ,the information (source, purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id, related_to,
    no_of_pepple, date, in_time, out_time, note, image, created_at) returned in the response body of id(x)
    should be verified.
      Given The api user sets "api/visitorsId" path parameters.
      Then The api user send the GET request and saves the returned response.
      Then The api user verifies the information in the response body for the entry with the specified  <dataindex> index, including"<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>","<visit_to>","<ipd_opd_staff_id>","<related_to>","<no_of_pepple>","<date>","<in_time>","<out_time>","<note>","<image>","<created_at>".
      Examples:
        |  dataindex | source | purpose |name | email | contact | id_proof | visit_to | ipd_opd_staff_id | related_to | no_of_pepple | date | in_time | out_time | note | image |created_at|
        |     0      | Online |Let's turn up the heat tonight... Just you and me|AmandaSofRenue1|amandafrotte2@gmail.com| | | | null| | 0 |2024-11-11| | |I want you tonight... just the two of us, no distractions -  https://rb.gy/ycu4is?Diaphy| | 2024-11-11 22:12:33