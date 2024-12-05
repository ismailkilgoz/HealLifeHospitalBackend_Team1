Feature: As an administrator (admin), I should be able to update the visitor purpose information registered in the
  system via API connection.


  Scenario Outline: When a PATCH body with valid authorization information and correct data (id, name, is_blood_group) is sent to /api/updateBloodGroup endpoint,
  it should be verified that the status code returned is 200 and the message information in the response body is “Success”.
  The blood group record that is requested to be updated via API should be verified that it has been updated via API.
  (It can be verified that the record has been updated by sending GET body to /api/getBloodGroupById endpoint with
  the "updatedId" returned in the response body).

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/updateBloodGroup" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id> , "<name>" and "<is_blood_group>" information to send to the api api/updateBloodGroup endpointt.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body
    # Api kullanıcısı Response body icindeki updateId bilgisinin patch request body icindeki id bilgisi ile ayni oldugunu dogrular

    Examples:
      | id  | name | is_blood_group     |
      | 506 | Kan Grubu Guncelle 1| 1|



  Scenario Outline: When a PATCH body (id, name, is_blood_group) containing valid authorization information
  and an invalid (id) is sent to the /api/updateBloodGroup endpoint, the status code returned is 203
  and the message in the response body is  "Wrong information or missing information. Please check your input data
  and id number."

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/updateBloodGroup" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<name>" and "<is_blood_group>" information to send to the api api/updateBloodGroup endpointt.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | id    | name             |is_blood_group          |
      | 57896 |Kan Grubu Güncelle 1| 1 |


  Scenario Outline:a PATCH body (id, name, is_blood_group) that does not contain valid authorization
  information (id) is sent to the /api/updateBloodGroup endpoint, the status code returned is 203 and the
  message information in the response body is "Wrong information or missing information. Please check your input
  data and id number." It should be verified that it is.

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/updateBloodGroup" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<name>" and "<is_blood_group>" information to send to the api api/updateBloodGroup endpointt.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin id içermeyen ama "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
    |name             |is_blood_group          |
    |Kan Grubu Güncelle 1| 1 |

  Scenario: When a PATCH request that does not contain valid authorization information and data is sent to the
  api/updateBloodGroup endpoint, the status code returned is 203 and the message information in the response
  body is "Wrong information or missing information. Please check your input data and id number."
  It should be verified that it is.

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/updateBloodGroup" path parametrelerini olusturur
    * The api user prepares a PATCH request that does not contain datas
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular


  Scenario Outline: Invalid Token When sending a PATCH body (id, name, is_blood_group) with invalid authorization information
  to the /api/visitorsPurposeUpdate endpoint, it should be verified that the status code returned is 403 and the message
  in the response body is "You do not have authorization or token error".

    * The api user sets "api/updateBloodGroup" path parameters.
    # Api kullanicisi "api/updateBloodGroup" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<name>" and "<is_blood_group>" information to send to the api api/updateBloodGroup endpointt.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbiddenn.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id  | name | is_blood_group     |
      | 506 | hello| 1|



  Scenario Outline: It must be verified via the API that the visitor purpose record that you want to update via the API
  has been updated.

    * The api user sets "api/getBloodGroup" path parameters.
    # Api kullanicisi "api/updateBloodGroup" path parametrelerini olusturur
    * The api user prepares a Get request containing the <id> information to send to the api getBloodGroupById endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the "lists.name" information in the response body is "hello".
    # Api kullanicisi response bodydeki lists.visitors_purpose bilgisinin "purpose update" oldugunu dogrular

    Examples:
      | id  |
      |  506|
