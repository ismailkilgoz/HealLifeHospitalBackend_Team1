Feature: As an administrator (admin) I should be able to access the finding list via API connection.


  Scenario: When a GET request is sent to the /api/getFinding endpoint with valid authorization information,
  it should be verified that the status code returned is 200
  and the message information in the response body is “Success”.

    Given   The Api User sets "api/getFinding" path parameters.
    # Api kullanicisi "api/getFinding" path parametrelerini olusturur
    Then    The Api User sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen response'u kaydeder
    And     The Api User verifies that the status code is 200.
    # Api kullanicisi status code'unun 200 oldugunu dogrular
    Then    The Api User verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular


  Scenario: When a GET request is sent to the /api/getFinding endpoint with invalid authorization (Invalid Token) information,
  it should be verified that the status code returned is 403
  and the message in the response body is "You do not have authorization or token error".

    Given   The Api User sets "api/getFinding" path parameters.
    # Api kullanicisi "api/getFinding" path parametrelerini olusturur
    Then    The Api User sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

  @US1
  Scenario Outline: When a GET request is sent to /api/getFinding endpoint with valid authorization information,
  the information (name, description, finding_category_id, created_at, category) returned in the response body of id(x)
  should be verified.

    Given   The Api User sets "api/getFinding" path parameters.
    # Api kullanicisi "api/getFinding" path parametrelerini olusturur
    Then    The Api User sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen response'u kaydeder
    And     The Api User verifies the information in the response body for the entry with the specified <dataIndex> index, including "<name>", "<description>", "<finding_category_id>", "<created_at>" and "<category>"  .
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<visitors_purpose>", "<description>" ve "<created_at>" bilgilerini doğrular.

    Examples:
      | dataIndex | name          | description         | finding_category_id  | created_at          | category               |
      |   42      | MAHMUT        | trial description   | 2                    | 2023-05-26 11:39:04 | ill category 2         |
      |   6       | mouth sore    | mouth sore is       | 2                    | 2024-12-06 08:53:46 | ill category 2         |
