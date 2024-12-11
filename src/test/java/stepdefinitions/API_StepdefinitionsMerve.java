package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.checkerframework.checker.units.qual.C;
import org.hamcrest.Matchers;
import org.junit.Assert;
import pojos.Pojo;
import utilities.API_Utilities.API_Methods;


import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepdefinitionsMerve  extends BaseTest {


    Pojo pojoRequest;
    String exceptionMesaj=null;

    @Given("Api kullanicisi {string} path parametrelerini olusturur.")
    public void api_kullanicisi_path_parametrelerini_olusturur(String pathParam) {

        API_Methods.pathParam(pathParam);

    }
    @Given("Api kullanicisi GET request gonderir ve donen response u kaydeder")
    public void api_kullanicisi_get_request_gonderir_ve_donen_response_u_kaydeder() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();

    }
    @Given("Api kullanicisi statuscode un {int} oldugunu dogrular")
    public void api_kullanicisi_statuscode_un_oldugunu_dogrular(int code) {
        response.then()
                .assertThat()
                .statusCode(code);

    }
    @Given("Api kullanicisi response body deki {string} bilgisinin {string} oldugunu dogrular")
    public void api_kullanicisi_response_body_deki_bilgisinin_oldugunu_dogrular(String key, String value) {

        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));
    }

    @Given("Api kullanicisi {int} index, {string}, {string},{string},{string},{string} her bir alan için beklenen degerle eslestigini dogrulama")
    public void api_kullanicisi_index_her_bir_alan_için_beklenen_degerle_eslestigini_dogrulama(Integer dataindex, String name, String description, String finding_category_id, String created_at, String category) {

        repJP = response.jsonPath();
        Assert.assertEquals(name, repJP.getString("lists[" + dataindex + "].name"));
        Assert.assertEquals(description, repJP.getString("lists[" + dataindex + "].description"));
        Assert.assertEquals(finding_category_id, repJP.getString("lists[" + dataindex + "].finding_category_id"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataindex + "].created_at"));
        Assert.assertEquals(category, repJP.getString("lists[" + dataindex + "].category"));

    }

    @Given("API kullanicisi bir GET istegi gonderir, dondurulen yaniti kaydeder ve durum kodunun {string} oldugunu ve neden ifadesinin Yasak oldugunu dogrular.")
    public void api_kullanicisi_bir_get_istegi_gonderir_dondurulen_yaniti_kaydeder_ve_durum_kodunun_oldugunu_ve_neden_ifadesinin_yasak_oldugunu_dogrular(String string) {


        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }



    @Given("Api kullanicisi, FindingById uc noktasiina gonderilecek {int} bilgisini iceren bir GET istegi hazirlar.")
    public void api_kullanicisi_finding_by_ıd_uc_noktasiina_gonderilecek_bilgisini_iceren_bir_get_istegi_hazirlar(int id) {
        requestBody.put("id",id);

        System.out.println("getbody "+requestBody);

    }
    @Given("Api kullanicisi GET body  request gonderir ve donen response u kaydeder")
    public void api_kullanicisi_get_body_request_gonderir_ve_donen_response_u_kaydeder() {
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .get(fullPath);

        response.prettyPrint();
    }
    @Given("Api kullanicisi {string} index, {string}, {string},{string},{string},{string} her bir alan için beklenen degerle eslestigini dogrulama")
    public void api_kullanicisi_index_her_bir_alan_için_beklenen_degerle_eslestigini_dogrulama(String id, String name, String description, String finding_category_id, String created_at, String category) {

        response.then()
                .assertThat()
                .body("details.id", Matchers.equalTo(id),
                        "details.name", Matchers.equalTo(name),
                        "details.description", Matchers.equalTo(description),
                        "details.finding_category_id", Matchers.equalTo(finding_category_id),
                        "details.created_at", Matchers.equalTo(created_at),
                        "details.category", Matchers.equalTo(category));

    }

    @Given("Api kullanicisi, FindingById uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.")
    public void api_kullanicisi_finding_by_ıd_uc_noktasiina_gonderilecek_id_bilgisini_iceren_bir_get_istegi_hazirlar() {

    }

    @Given("Api kullanicisi GET body  request gonderir ve  donen response i kaydeder.")
    public void api_kullanicisi_get_body_request_gonderir_ve_donen_response_i_kaydeder() {

        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(requestBody.toString())
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("Api kullanicisi, finding_category_id uc noktasiina gonderilecek {int} bilgisini iceren bir GET istegi hazirlar.")
    public void api_kullanicisi_finding_category_id_uc_noktasiina_gonderilecek_bilgisini_iceren_bir_get_istegi_hazirlar(int id) {

        requestBody.put("finding_category_id",id);

        System.out.println("getbody "+requestBody);

    }
    @Given("Api kullanicisi {string} index, {string}, {string},{string},{string} her bir alan için beklenen degerle eslestigini dogrulama")
    public void api_kullanicisi_index_her_bir_alan_için_beklenen_degerle_eslestigini_dogrulama(String id, String name, String description, String finding_category_id, String created_at) {

        repJP = response.jsonPath();

        Assert.assertEquals(map.get("name"), repJP.getString("name"));
        Assert.assertEquals(map.get("description"), repJP.getString("description"));
        Assert.assertEquals(map.get("finding_category_id"), repJP.getString("finding_category_id"));
        Assert.assertEquals(map.get("created_at"), repJP.getString("created_at"));


    }

    @Given("Api kullanicisi, finding_category_id uc noktasiina gonderilecek <id> bilgisini iceren bir GET istegi hazirlar.")
    public void api_kullanicisi_finding_category_id_uc_noktasiina_gonderilecek_id_bilgisini_iceren_bir_get_istegi_hazirlar() {


    }

    @Given("Api kullanicisi dogru datalar {string}, {string} , {string} iceren bir POST body gönderir.")
    public void api_kullanicisi_dogru_datalar_iceren_bir_post_body_gönderir(String name, String description, String finding_category_id) {

        map.put("name","mouth sore");
        map.put("description","mouth sore is");
        map.put("finding_category_id",2);
        System.out.println("post body : "+ map);
    }
    @Given("Api kullanicisi POST body  request gonderir ve  donen response i kaydeder.")
    public void api_kullanicisi_post_body_request_gonderir_ve_donen_response_i_kaydeder() {

        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .post(fullPath);
        response.prettyPrint();

    }

    @Given("Api kullanicisi data içermeyen bir POST request hazırlar")
    public void api_kullanicisi_data_içermeyen_bir_post_request_hazırlar() {


    }

    @Given("Api kullanicisi dogru datalar {int},{string}, {string} , {string} iceren bir PATCH body gönderir.")
    public void api_kullanicisi_dogru_datalar_iceren_bir_patch_body_gönderir(int  id, String name, String description, String finding_category_id) {

        requestBody.put("id",id);
        requestBody.put("name",name);
        requestBody.put("description",description);
        requestBody.put("finding_category_id",finding_category_id);





    }
    @Given("Api kullanicisi PATCH body  request gonderir ve  donen response i kaydeder.")
    public void api_kullanicisi_patch_body_request_gonderir_ve_donen_response_i_kaydeder() {

        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody)
                .patch(fullPath);


    }
    @Given("Api kullanicisi  Response body icindeki updateId bilgisinin endpoint'e gönderilen PATCH request body icindeki id bilgisi ile ayni oldugu dogrular")
    public void api_kullanicisi_response_body_icindeki_update_ıd_bilgisinin_endpoint_e_gönderilen_patch_request_body_icindeki_id_bilgisi_ile_ayni_oldugu_dogrular() {

        repJP=response.jsonPath();
        Assert.assertEquals(requestBody.get("id"),repJP.getInt("updateId"));




    }

    @Given("Api kullanicisi dogru datalar {string}, {string} , {string} iceren bir PATCH body gönderir.")
    public void api_kullanicisi_dogru_datalar_iceren_bir_patch_body_gönderir(String name, String description, String finding_category_id) {

        requestBody.put("name",name);
        requestBody.put("description",description);
        requestBody.put("finding_category_id",finding_category_id);



    }


    @Given("Api kullanicisi dogru datalar {string},{string}, {string} , {string} iceren bir PATCH body gönderir.")
    public void api_kullanicisi_dogru_datalar_iceren_bir_patch_body_gönderir(String id, String name, String description, String finding_category_id) {

        requestBody.put("id",id);
        requestBody.put("name",name);
        requestBody.put("description",description);
        requestBody.put("finding_category_id",finding_category_id);


    }


    @Given("Api kullanicisi api   deleteFinding endpointine gonderilmek üzere bir DELETE request hazırlar")
    public void api_kullanicisi_api_delete_finding_endpointine_gonderilmek_üzere_bir_delete_request_hazırlar() {

        requestBody.put("id",388);
        System.out.println("delete id : " + requestBody);

    }
    @Given("Api kullanicisi DELETE body  request gonderir ve  donen response i kaydeder.")
    public void api_kullanicisi_delete_body_request_gonderir_ve_donen_response_i_kaydeder() {

        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .delete(fullPath);

        response.prettyPrint();

    }
    @Given("Api kullanicisi DeleteId bilgisinin request body içindeki id bilgisi ile aynı oldugunu dogrular")
    public void api_kullanicisi_delete_ıd_bilgisinin_request_body_içindeki_id_bilgisi_ile_aynı_oldugunu_dogrular() {

        repJP=response.jsonPath();
        Assert.assertEquals(requestBody.get("id"),repJP.getInt("deletedId"));



    }
    @Given("Api kullanicisi api   deleteFinding endpointine gonderilmek üzere yeni  bir DELETE request hazırlar")
    public void api_kullanicisi_api_delete_finding_endpointine_gonderilmek_üzere_yeni_bir_delete_request_hazırlar() {
        requestBody.put("id",383383);
        System.out.println("delete id : " + requestBody);


    }
    @Given("Api kullanicisi data icermeyen   bir DELETE request hazırlar")
    public void api_kullanicisi_data_icermeyen_bir_delete_request_hazırlar() {


    }

    @Given("Api kullanicisi DELETE body  request gonderir ve  donen response i kaydeder.statuscode un {int} oldugunu dogrular")
    public void api_kullanicisi_delete_body_request_gonderir_ve_donen_response_i_kaydeder_statuscode_un_oldugunu_dogrular(Integer int1) {

        try {
            response=given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(requestBody.toString())
                    .delete(fullPath);
        } catch (Exception e) {
           exceptionMesaj=e.getMessage();
        }


        System.out.println("exceptionsMesaj : "+ exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"),exceptionMesaj);
    }
    @Given("Api kullanicisi statuscode un {int} oldugunu dogrular response body deki {string} bilgisinin {string} oldugunu dogrular")
    public void api_kullanicisi_statuscode_un_oldugunu_dogrular_response_body_deki_bilgisinin_oldugunu_dogrular() {


        try {
            response=given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(requestBody.toString())
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj=e.getMessage();
        }

        System.out.println("exceptionMesaj : "+ exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"),exceptionMesaj);


    }

    @Given("Api kullanicisi GET request gonderir, donen response'u' kaydeder, status code'unun '{int}' ve reason phrase bilgisinin Forbidden oldugunu dogrular")
    public void api_kullanicisi_get_request_gonderir_donen_response_u_kaydeder_status_code_unun_ve_reason_phrase_bilgisinin_forbidden_oldugunu_dogrular(Integer int1) {

        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);

    }



    @Given("Api kullanicisi dogru data iceröeyen  bir PATCH body gönderir.")
    public void api_kullanicisi_dogru_data_iceröeyen_bir_patch_body_gönderir() {

    }

    @Given("Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun {string} ve reason phrase bilgisinin Forbidden oldugunu dogrular")
    public void api_kullanicisi_patch_request_gonderir_donen_responsei_kaydeder_status_codeun_ve_reason_phrase_bilgisinin_forbidden_oldugunu_dogrular(String string) {

        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("Api kullanicisi api deleteFinding endpointine gondermek icin {int} bilgisini iceren bir get request hazirlar")
    public void api_kullanicisi_api_delete_finding_endpointine_gondermek_icin_bilgisini_iceren_bir_get_request_hazirlar(int id) {
        requestBody.put("id", id);

        System.out.println("Delete Body : " + requestBody);
    }
    @Given("Api kullanıcısı DeletedId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular")
    public void api_kullanıcısı_deleted_ıd_bilgisinin_request_body_icindeki_id_bilgisi_ile_ayni_oldugunu_dogrular() {
        repJP = response.jsonPath();

        Assert.assertEquals(requestBody.get("id"), repJP.getInt("deletedId"));
        System.out.println(repJP.getInt("deletedId"));
    }

    @Given("Api kullanicisi api updateFinding endpointine gondermek icin {int} {string}, {string} ve {string} bilgilerini iceren bir post request hazirlar")
    public void api_kullanicisi_api_update_finding_endpointine_gondermek_icin_ve_bilgilerini_iceren_bir_post_request_hazirlar(int id, String name, String description, String finding_category_id) {


        requestBody.put("id", id);
        requestBody.put("name", name);
        requestBody.put("description", description);
        requestBody.put("finding_category_id", finding_category_id);

        System.out.println("Patch Body:" + requestBody.toString());
    }
    @Given("Api kullanicisi PATCH body  request gonderir ve donen response u kaydeder")
    public void api_kullanicisi_patch_body_request_gonderir_ve_donen_response_u_kaydeder() {

        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody)
                .patch(fullPath);

        response.prettyPrint();

    }
    @Given("Api kullanıcısı updateId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular")
    public void api_kullanıcısı_update_ıd_bilgisinin_request_body_icindeki_id_bilgisi_ile_ayni_oldugunu_dogrular() {


        repJP = response.jsonPath();

        Assert.assertEquals(requestBody.get("id"), repJP.getInt("updateId"));
        System.out.println("updateId:" + repJP.getInt("updateId"));

    }














}



