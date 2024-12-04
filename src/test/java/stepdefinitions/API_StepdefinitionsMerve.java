package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import utilities.API_Utilities.API_Methods;


import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepdefinitionsMerve  extends BaseTest {



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
    public void api_kullanicisi_statuscode_un_oldugunu_dogrular(Integer code) {
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


    @Given("Api kullanicisi (name, description,finding_category_id,created_at,category) her bir alan için beklenen degerle eslestigini dogrulama")
    public void api_kullanicisi_name_description_finding_category_id_created_at_category_her_bir_alan_icin_beklenen_degerle_eslestigini_dogrulama() {

    }



}

