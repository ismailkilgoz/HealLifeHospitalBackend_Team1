
@merve
Feature:



  Scenario: US_034>TC_01 Successful GET validation test for api/getFinding endpoint

    * Api kullanicisi "api/getFinding" path parametrelerini olusturur.
    *  Api kullanicisi GET request gonderir ve donen response u kaydeder
    * Api kullanicisi statuscode un 200 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Success" oldugunu dogrular

  Scenario Outline: US_034>TC_03 api/getFinding endpoint Verifies that a record with a specific ID returns the correct information in a GET request with valid authorization information.
    * Api kullanicisi "api/getFinding" path parametrelerini olusturur.
    *  Api kullanicisi GET request gonderir ve donen response u kaydeder
    * Api kullanicisi <dataindex> index, "<name>", "<description>","<finding_category_id>","<created_at>","<category>" her bir alan için beklenen degerle eslestigini dogrulama

    Examples:
      | dataindex | name             | description         |  finding_category_id       | created_at | category |
      | 0         | Diarrhea or constipation | Some people with typhoid fever or paratyphoid fever develop a rash of flat, rose-colored spots.| 2 | 2021-10-25 06:05:39 | ill category 2|


  Scenario: US_034>TC_02 Invalid Token When a GET request is sent to the api/getFinding endpoint with invalid authorization
  information, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error.".

    * Api kullanicisi "api/getFinding" path parametrelerini olusturur.
    * API kullanicisi bir GET istegi gonderir, dondurulen yaniti kaydeder ve durum kodunun '403' oldugunu ve neden ifadesinin Yasak oldugunu dogrular.


  Scenario Outline: US_035>TC_01 When a GET body containing valid authorization information and correct data (id) is sent to the /api/getFindingById endpoint,
  the returned status code should be 200, the message information in the response body should be "Success", and the data in the
  returned response body (id, name, description, finding_category_id, created_at, category) should be verified.

    * Api kullanicisi "api/getFindingById" path parametrelerini olusturur.
    * Api kullanicisi, FindingById uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
    *  Api kullanicisi GET body  request gonderir ve donen response u kaydeder
    * Api kullanicisi statuscode un 200 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Success" oldugunu dogrular
    * Api kullanicisi "<id>" index, "<name>", "<description>","<finding_category_id>","<created_at>","<category>" her bir alan için beklenen degerle eslestigini dogrulama

    Examples:
      | id | id   | name        | description         |  finding_category_id       | created_at          | category |
      | 15 | 15   |mouth sore   | mouth sore is       | 2                          | 2023-05-15 10:55:48|   ill category 2  |


  Scenario: US_035>TC_02 /api/getFindingById endpoint'ine gecerli yetkilendirme bilgileri ve veri (id) içemeyen bir GET
  isteği gönderildiginde dönen durum kodu'nun  203 olduğu ve yanıt gövdesindeki mesaj bilgisinin "No id or false id." testi

    * Api kullanicisi "api/getFindingById" path parametrelerini olusturur.
    * Api kullanicisi, FindingById uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
    *  Api kullanicisi GET body  request gonderir ve donen response u kaydeder
    * Api kullanicisi statuscode un 203 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "No id or wrong id." oldugunu dogrular

  Scenario Outline: US_035>TC_03 /api/getFindingById endpoint'ine gecerli yetkilendirme bilgileri ile gecersiz veri (id) içeren bir GET gövdesi
  203'te dönen durum koduna gönderildi ve yanıt gövdesindeki mesaj bilgisinin "No id or wrong id." olduğu doğrulanmalı.

    * Api kullanicisi "api/getFindingById" path parametrelerini olusturur.
    * Api kullanicisi, FindingById uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
    *  Api kullanicisi GET body  request gonderir ve donen response u kaydeder
    * Api kullanicisi statuscode un 203 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "No id or wrong id." oldugunu dogrular

    Examples:
      | id |
      |1000 |

  Scenario: Invalid Token  US_035>TC_04  api/getFindingById endpoint'ine gecersiz yetkilendirme bilgileri ile bir GET gövdesinin gönderilenginde dönen durum kodu'in
  403 olduğu ve yanıt gövdesindeki mesaj bilgilerinin "You do not have authorization or token error" olduğu doğrulanmalı.

    * Api kullanicisi "api/getFindingById" path parametrelerini olusturur.
    * Api kullanicisi, FindingById uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
    *  Api kullanicisi GET body  request gonderir ve  donen response i kaydeder.




  Scenario Outline: US_036 >TC_01 /api/getFindingCategoryId endpoint'ine gecerli authorization bilgileri ve dogru data (finding_category_id)
  iceren bir GET body gönderildiginde dönen status code'in 200 oldugu ve response body'deki message bilgisinin "Success" oldugu  ve
  response body'de donen bilgileri (name, description, finding_category_id, created_at) dogrulanmali.
    * Api kullanicisi "api/getFindingCategoryId" path parametrelerini olusturur.
    * Api kullanicisi, finding_category_id uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
    *  Api kullanicisi GET body  request gonderir ve donen response u kaydeder
    * Api kullanicisi statuscode un 200 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Success" oldugunu dogrular
    * Api kullanicisi "<id>" index, "<name>", "<description>","<finding_category_id>","<created_at>" her bir alan için beklenen degerle eslestigini dogrulama



    Examples:
      | id     | name           | description         |  finding_category_id       | created_at          |
      | 11     |Damaged Hair  |                   | 5                           | 2023-05-26 13:36:06|


  Scenario: US_036>TC_02 /api/getFindingCategoryId endpoint'ine gecerli authorization bilgileri ve data (finding_category_id) icermeyen bir
  GET request gönderildiginde dönen status code'un 203 oldugu ve response body'deki message bilgisinin "No id or wrong id." oldugu testi

    * Api kullanicisi "api/getFindingCategoryId" path parametrelerini olusturur.
    * Api kullanicisi, finding_category_id uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
    *  Api kullanicisi GET body  request gonderir ve donen response u kaydeder
    * Api kullanicisi statuscode un 203 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "No id or wrong id." oldugunu dogrular


  Scenario Outline: US_036 >TC_03 /api/getFindingCategoryId endpoint'ine gecerli authorization bilgileri gecersiz data (finding_category_id) iceren bir
  GET body gönderildiginde de dönen status code'in 203 oldugu ve response body'deki message bilgisinin "No id or wrong id." oldugu testi


    * Api kullanicisi "api/getFindingCategoryId" path parametrelerini olusturur.
    * Api kullanicisi, FindingById uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
    *  Api kullanicisi GET body  request gonderir ve donen response u kaydeder
    * Api kullanicisi statuscode un 203 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "No id or wrong id." oldugunu dogrular


    Examples:
      | id |
      | |


  Scenario Outline:  Invalid Token  US_036>TC_004 /api/getFindingCategoryId endpoint'ine gecersiz authorization bilgileri ile bir GET body gönderildiginde dönen status code'in
  403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * Api kullanicisi "api/getFindingById" path parametrelerini olusturur.
    * Api kullanicisi, FindingById uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
    *  Api kullanicisi GET body  request gonderir ve  donen response i kaydeder.
    * Api kullanicisi statuscode un 403 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | id |
      | 3 |


  Scenario Outline: US_037>TC_01 /api/addFinding endpoint'ine gecerli authorization bilgileri ve dogru datalar (name, description, finding_category_id)
  iceren bir POST body gönderildiginde dönen status code'in 200 oldugu ve response body'deki message bilgisinin "Success" oldugu dogrulanmali.


    * Api kullanicisi "api/addFinding" path parametrelerini olusturur.
    * Api kullanicisi dogru datalar "<name>", "<description>" , "<finding_category_id>" iceren bir POST body gönderir.
    *  Api kullanicisi POST body  request gonderir ve  donen response i kaydeder.
    * Api kullanicisi statuscode un 200 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Success" oldugunu dogrular
    Examples:
      | name        | description         |  finding_category_id       |
      |mouth sore   | mouth sore is      | 2  |

  Scenario: US_037>TC_02 /api/addFinding endpoint'ine gecerli authorization bilgileri ve data icermeyen bir POST
  request gönderildiginde de dönen status code'in 203 oldugu ve response body'deki message bilgisinin
  "No information or missing information. Please check your input data." oldugu testi

    * Api kullanicisi "api/addFinding" path parametrelerini olusturur.
    * Api kullanicisi data içermeyen bir POST request hazırlar
    *  Api kullanicisi POST body  request gonderir ve  donen response i kaydeder.
    * Api kullanicisi statuscode un 203 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular

  Scenario Outline: Invalid Token  US_037>TC_03 api/addFinding endpoint'ine gecersiz authorization bilgileri ile dogru datalar (name, description, finding_category_id) iceren bir
  POST body gönderildiginde dönen status code'in 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * Api kullanicisi "api/addFinding" path parametrelerini olusturur.
    * Api kullanicisi dogru datalar "<name>", "<description>" , "<finding_category_id>" iceren bir POST body gönderir.
    *  Api kullanicisi POST body  request gonderir ve  donen response i kaydeder.
    * Api kullanicisi statuscode un 403 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | name        | description         |  finding_category_id       |
      |mouth sore   | mouth sore is      | 2  |

  Scenario Outline: US_037>TC_04 API uzerinden olusturulmak istenen yeni finding kaydinin olustugu API uzerinden dogrulanmali.
  (Response bodyde dönen "addId" ile /api/getFindingById endpoint'ine GET body gönderilerek kayıt oluşturulduğu doğrulanabilir.)


    * Api kullanicisi "api/getFindingById" path parametrelerini olusturur.
    * Api kullanicisi, FindingById uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
    *  Api kullanicisi GET body  request gonderir ve donen response u kaydeder
    * Api kullanicisi statuscode un 200 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Success" oldugunu dogrular

    Examples:
      | id |
      | 360 |

  Scenario Outline: US_038 >TC_01 /api/updateFinding endpoint'ine gecerli authorization bilgileri ve dogru datalar <id>,"<name>", "<description>" , "<finding_category_id>" iceren bir PATCH
  body gönderildiginde dönen status code'in 200 oldugu ve response body'deki message bilgisinin "Success" oldugu  ve Response body icindeki updateId bilgisinin
  /api/updateFinding endpoint'ine gönderilen patch request body icindeki id bilgisi ile ayni oldugu dogrulanmasi testi.

    * Api kullanicisi "api/updateFinding" path parametrelerini olusturur.
    * Api kullanicisi dogru datalar <id>,"<name>", "<description>" , "<finding_category_id>" iceren bir PATCH body gönderir.
    *  Api kullanicisi PATCH body  request gonderir ve  donen response i kaydeder.
    * Api kullanicisi statuscode un 200 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Success" oldugunu dogrular
    * Api kullanicisi  Response body icindeki updateId bilgisinin endpoint'e gönderilen PATCH request body icindeki id bilgisi ile ayni oldugu dogrular

    Examples:
      | id | name        | description         |  finding_category_id       |
      | 372  |mouth sore   | mouth sore is      | 2  |

  Scenario Outline: US_038 >TC_02 /api/updateFinding endpoint'ine gecerli authorization bilgileri ile gecersiz (id) iceren bir PATCH body
  (id, name, description, finding_category_id) gönderildiginde dönen status code'in 203
  oldugu ve response body'deki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugu testi

    * Api kullanicisi "api/updateFinding" path parametrelerini olusturur.
    * Api kullanicisi dogru datalar <id>,"<name>", "<description>" , "<finding_category_id>" iceren bir PATCH body gönderir.
    *  Api kullanicisi PATCH body  request gonderir ve  donen response i kaydeder.
    * Api kullanicisi statuscode un 203 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular


    Examples:
      | id | name        | description         |  finding_category_id       |
      | 326326  |mouth sore   | mouth sore is      | 2  |



  Scenario Outline: US_038 >TC_03  (id) icermeyen bir PATCH body (name, description, finding_category_id) gönderildiginde
  de dönen status code'in 203 oldugu ve response body'deki message bilgisinin "Wrong information or missing information.
  Please check your input data and id number." oldugu dogrulanmali.

    * Api kullanicisi "api/updateFinding" path parametrelerini olusturur.
    * Api kullanicisi dogru datalar "<name>", "<description>" , "<finding_category_id>" iceren bir PATCH body gönderir.
    *  Api kullanicisi PATCH body  request gonderir ve  donen response i kaydeder.
    * Api kullanicisi statuscode un 203 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | name        | description         |  finding_category_id       |
      |mouth sore   | mouth sore is      | 2  |

  Scenario:  US_038>TC_04 /api/updateFinding endpoint'ine gecerli authorization bilgileri ile data icermeyen bir PATCH request gönderildiginde dönen status code'in
  203 oldugu ve response body'deki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugu dogrulanmali.

    * Api kullanicisi "api/updateFinding" path parametrelerini olusturur.
    * Api kullanicisi dogru data iceröeyen  bir PATCH body gönderir.
    *  Api kullanicisi PATCH body  request gonderir ve  donen response i kaydeder.
    * Api kullanicisi statuscode un 203 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular


  Scenario Outline:Invalid Token  US_038 >TC_04 /api/updateFinding endpoint'ine gecersiz authorization bilgileri ile bir PATCH body (id, name, description, finding_category_id)
  gönderildiginde dönen status code'in 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * Api kullanicisi "api/updateFinding" path parametrelerini olusturur.
    * Api kullanicisi dogru datalar "<id>","<name>", "<description>" , "<finding_category_id>" iceren bir PATCH body gönderir.
    *  Api kullanicisi PATCH body  request gonderir ve  donen response i kaydeder.
    * Api kullanicisi statuscode un 403 oldugunu dogrular
    * Api kullanicisi response body deki "message" bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | id | name        | description         |  finding_category_id       |
      | 372  |mouth sore   | mouth sore is      | 2  |


   Scenario: US_039>TC_01 /api/deleteFinding endpoint'ine gecerli authorization bilgileri ve dogru data (id)
   iceren bir DELETE body gönderildiginde dönen status code'in 200 oldugu ve response body'deki message bilgisinin "Success" oldugu  ve
   Response body icindeki deletedId bilgisinin /api/deleteFinding endpoint'ine gönderilen delete request body icindeki id bilgisi ile ayni oldugu dogrulanmali.

     * Api kullanicisi "api/deleteFinding" path parametrelerini olusturur.
     *  Api kullanicisi api   deleteFinding endpointine gonderilmek üzere bir DELETE request hazırlar
     *  Api kullanicisi DELETE body  request gonderir ve  donen response i kaydeder.
     * Api kullanicisi statuscode un 200 oldugunu dogrular
     * Api kullanicisi response body deki "message" bilgisinin "Success" oldugunu dogrular
     *  Api kullanicisi DeleteId bilgisinin request body içindeki id bilgisi ile aynı oldugunu dogrular

     Scenario: US_039>TC_03 /api/deleteFinding endpoint'ine gecerli authorization bilgileri ve  gecersiz data (id) iceren bir
     DELETE body gönderildiginde de dönen status code'in 203 oldugu ve response body'deki message bilgisinin "No id or wrong id. Please check your id number." oldugu dogrulanmali.

       * Api kullanicisi "api/deleteFinding" path parametrelerini olusturur.
       *  Api kullanicisi api   deleteFinding endpointine gonderilmek üzere yeni  bir DELETE request hazırlar
       *  Api kullanicisi DELETE body  request gonderir ve  donen response i kaydeder.
       * Api kullanicisi statuscode un 203 oldugunu dogrular
       * Api kullanicisi response body deki "message" bilgisinin "No id or wrong id. Please check your id number" oldugunu dogrular


       Scenario: US_039 >TC_02 /api/deleteFinding endpoint'ine gecerli authorization bilgileri ve data (id) icermeyen bir DELETE request
       gönderildiginde dönen status code'un 203 oldugu ve response body'deki message bilgisinin "No id or wrong id. Please check your id number." oldugu


         * Api kullanicisi "api/deleteFinding" path parametrelerini olusturur.
         *  Api kullanicisi data icermeyen   bir DELETE request hazırlar
         *  Api kullanicisi DELETE body  request gonderir ve  donen response i kaydeder.
         * Api kullanicisi statuscode un 203 oldugunu dogrular
         * Api kullanicisi response body deki "message" bilgisinin "No id or wrong id. Please check your id number" oldugunu dogrular


       Scenario: Invalid Token US_039>TC_04 /api/deleteFinding endpoint'ine gecersiz authorization bilgileri ile bir DELETE body gönderildiginde dönen
       status code'in 403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.


         * Api kullanicisi "api/deleteFinding" path parametrelerini olusturur.
         *  Api kullanicisi data icermeyen   bir DELETE request hazırlar
         *  Api kullanicisi DELETE body  request gonderir ve  donen response i kaydeder.statuscode un 403 oldugunu dogrular

         Scenario:  US_039>TC_05 API uzerinden silinmek istenen finding kaydinin silindigi, API uzerinden dogrulandıgı testi
         (Response body'de dönen "deletedId" ile /api/getFindingById endpoint'ine GET body gönderilerek kaydın silindiği doğrulanabilir.)


           * Api kullanicisi "api/getFindingById" path parametrelerini olusturur.
           * Api kullanicisi, FindingById uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.
           *  Api kullanicisi GET body  request gonderir ve donen response u kaydeder
           * Api kullanicisi statuscode un 203 oldugunu dogrular
           * Api kullanicisi response body deki "message" bilgisinin "No id or wrong id." oldugunu dogrular




