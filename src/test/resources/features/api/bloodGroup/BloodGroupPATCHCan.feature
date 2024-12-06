Feature: As an administrator (admin), I should be able to update the visitor purpose information registered in the
  system via API connection.

  Scenario Outline: A PATCH request to the "/api/updateBloodGroup" endpoint with valid authorization and correct
  data (id, name, is_blood_group) should return a 200 status code, a response body message of "Success," and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/visitorsPurposeId" endpoint using the "updateId" from the response.

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<name>" and "<is_blood_group>" information to send to the api api/updateBloodGroup endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<name>" ve "<is_blood_group>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body
    # Api kullanıcısı Response body icindeki updateId bilgisinin patch request body icindeki id bilgisi ile ayni oldugunu dogrular

    Examples:
      | id  | name             | is_blood_group |
      | 520 | havacokguzel     | Z+             |


  Scenario Outline: When a PATCH body (id, name, is_blood_group) containing valid authorization information
  and invalid (id) is sent to the /api/updateBloodGroup endpoint, the status code returned is 203 and the message
  information in the response body is "Wrong information or missing information. Please check your input data and id
  number." should be verified.

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<name>" and "<is_blood_group>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | id    | name         | is_blood_group |
      | 520   | name update | K+             |


  Scenario Outline: When a PATCH body (name, is_blood_group) that does not contain valid authorization
  information (id) is sent to the /api/updateBloodGroup endpoint, the status code returned is 203 and the
  message information in the response body is "Wrong information or missing information. Please check your input
  data and id number." It should be verified that it is.

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request that does not contain an id but includes "<name>" and "<is_blood_group>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin id içermeyen ama "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | name          | is_blood_group             |
      | name update   | blood group update details |


  Scenario: When a PATCH request that does not contain valid authorization information and data is sent to the
  /api/updateBloodGroup endpoint, the status code returned is 203 and the message information in the response
  body is "Wrong information or missing information. Please check your input data and id number."
  It should be verified that it is.

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request that does not contain data
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular


  Scenario Outline: Invalid Token When sending a PATCH body (id, name, is_blood_group) with invalid authorization information
  to the /api/updateBloodGroup endpoint, it should be verified that the status code returned is 403 and the message
  in the response body is "You do not have authorization or token error".

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<name>" and "<is_blood_group>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<name>" ve "<is_blood_group>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id  | name | is_blood_group            |
      | 774 | name update   | is_blood_group update details |


  Scenario Outline: It must be verified via the API that the visitor purpose record that you want to update via the API
  has been updated.

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the "lists.updateBloodGroup" information in the response body is "name update".
    # Api kullanicisi response bodydeki lists.updateBloodGroup bilgisinin "name update" oldugunu dogrular

    Examples:
      | id  |
      | 520 |
