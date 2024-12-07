package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.hamcrest.Matchers;
import utilities.API_Utilities.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.MatcherAssert.assertThat;
import static utilities.API_Utilities.API_Methods.fullPath;

public class VisitorsList_Stepdefinitions extends BaseTest {

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {API_Methods.pathParam(pathParam); }

    @When("The api user send the GET request and saves the returned response.")
    public void the_api_user_send_the_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);
        response.prettyPrint(); }

    @Then("The api user verifies that the returned code is {int}.")
    public void the_api_user_verifies_that_the_returned_code_is(int code) {
        response.then()
                .assertThat()
                .statusCode(code); }

    @Then("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value)); }
}
