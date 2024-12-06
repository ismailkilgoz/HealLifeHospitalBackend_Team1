package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.restassured.http.ContentType;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;


import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepDefinitionsMehmet extends BaseTest {

    String exceptionMesaj = null;

    @Given("The Api User sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    @Then("The Api User sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        //response.prettyPrint();
    }
    @Then("The Api User verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(Integer statusCode) {
        response.then()
                .assertThat()
                .statusCode(statusCode);
    }
    @Then("The Api User verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));
    }
    @Then("The Api User sends a GET request, saves the returned response, and verifies that the status code is {string} with the reason phrase Forbidden.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden(String string) {
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
    @Then("The Api User verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string} and {string}  .")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(Integer dataIndex, String name, String description, String finding_category_id, String created_at, String category) {
        repJP = response.jsonPath();

        Assert.assertEquals(name, repJP.getString("lists[" + dataIndex + "].name"));
        Assert.assertEquals(description, repJP.getString("lists[" + dataIndex + "].description"));
        Assert.assertEquals(finding_category_id, repJP.getString("lists[" + dataIndex + "].finding_category_id"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataIndex + "].created_at"));
        Assert.assertEquals(category, repJP.getString("lists[" + dataIndex + "].category"));

        //response.prettyPrint();
    }






}


