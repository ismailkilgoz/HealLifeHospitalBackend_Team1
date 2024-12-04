package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_Stepdefinitions extends BaseTest {

    String exceptionMesaj = null;

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    @Given("The api user sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        response.then()
                .assertThat()
                .statusCode(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));

    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String visitors_purpose, String description, String created_at) {
        repJP = response.jsonPath();

        Assert.assertEquals(visitors_purpose, repJP.getString("lists[" + dataIndex + "].visitors_purpose"));
        Assert.assertEquals(description, repJP.getString("lists[" + dataIndex + "].description"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataIndex + "].created_at"));
    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
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

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String exp_category, String description, String is_active, String is_deleted, String created_at) {
        repJP = response.jsonPath();

        Assert.assertEquals(exp_category, repJP.getString("lists[" + dataIndex + "].exp_category"));
        Assert.assertEquals(description, repJP.getString("lists[" + dataIndex + "].description"));
        Assert.assertEquals(is_active, repJP.getString("lists[" + dataIndex + "].is_active"));
        Assert.assertEquals(is_deleted, repJP.getString("lists[" + dataIndex + "].is_deleted"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataIndex + "].created_at"));
    }


    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(Integer dataIndex, String name, String is_blood_group, String created_at) {
        repJP = response.jsonPath();
        Assert.assertEquals(name, repJP.getString("lists[" + dataIndex + "].name"));
        Assert.assertEquals(is_blood_group, repJP.getString("lists[" + dataIndex + "].is_blood_group"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataIndex + "].created_at"));
    }


    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, includes {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_includes(Integer dataindex, String name, String surname, String employee_id) {
        repJP =response.jsonPath();
        Assert.assertEquals(name, repJP.getString("lists[" + dataindex + "].name"));
        Assert.assertEquals(surname, repJP.getString("lists[" + dataindex + "].surname"));
        Assert.assertEquals(employee_id, repJP.getString("lists[" + dataindex + "].employee_id"));
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(Integer dataindex, String patient_name, String patient_id) {
        repJP = response.jsonPath();
        Assert.assertEquals(patient_name, repJP.getString("lists[" + dataindex + "].patient_name"));
        Assert.assertEquals(patient_id, repJP.getString("lists[" + dataindex + "].patient_id"));
    }

    @Given("The api user verifies in IPDList the information in the response body for the entry with the specified {int} index, including, {string}, {string}.")
    public void the_api_user_verifies_in_ipd_list_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(Integer dataindex, String patient_name, String patient_id) {
        repJP = response.jsonPath();
        Assert.assertEquals(patient_name, repJP.getString("lists[" + dataindex + "].patient_name"));
        Assert.assertEquals(patient_id, repJP.getString("lists[" + dataindex + "].patient_id"));
    }
}

