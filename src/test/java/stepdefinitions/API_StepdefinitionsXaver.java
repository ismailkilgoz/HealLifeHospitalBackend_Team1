package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepdefinitionsXaver extends BaseTest {
    String exceptionMesaj = null;

    @Given("The api user sets {string} path  parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {

        API_Methods.pathParam(pathParam);
    }
    @Given("The api user sends a GET request and saves the returned  response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();
    }
    @Given("The api user verifies that the status code is  {int}.")
    public void the_api_user_verifies_that_the_status_code_is(Integer code) {
        response.then()
                .assertThat()
                .statusCode(code);
    }
    @Given("The api user verifies that the {string} information in the  response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));


}@Given("The api user verifies the information in the response  body for the entry with the specified {int} , including {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_including(Integer dataindex, String type, String slug, String title, String url, String date) {
        repJP =response.jsonPath();
        Assert.assertEquals(type, repJP.getString("lists[" + dataindex + "].type"));
        Assert.assertEquals(slug, repJP.getString("lists[" + dataindex + "].slug"));
        Assert.assertEquals(title, repJP.getString("lists[" + dataindex + "].title"));
        Assert.assertEquals(url, repJP.getString("lists[" + dataindex + "].url"));
        Assert.assertEquals(date, repJP.getString("lists[" + dataindex + "].date"));

    }
    }

