Feature:


  @merve
  Scenario: US_034>TC_01 Successful GET validation test for api/getFinding endpoint

    * Api kullanicisi "api/getFinding" path parametrelerini olusturur.
    *  Api kullanicisi GET request gonderir ve donen response u kaydeder
    * Api kullanicisi statuscode un 200 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Success" oldugunu dogrular

  Scenario: US_034>TC_03 api/getFinding endpoint Verifies that a record with a specific ID returns the correct information in a GET request with valid authorization information.
    * Api kullanicisi "api/getFinding" path parametrelerini olusturur.
    *  Api kullanicisi GET request gonderir ve donen response u kaydeder
    * Api kullanicisi (name, description,finding_category_id,created_at,category) her bir alan için beklenen degerle eslestigini dogrulama
