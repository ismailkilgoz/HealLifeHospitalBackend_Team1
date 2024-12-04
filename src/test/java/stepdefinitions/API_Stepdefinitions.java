package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.TestData;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_Stepdefinitions extends BaseTest {

    TestData testData = new TestData();
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

    @Given("The api user prepares a Get request containing the {int} information to send to the api getBloodGroupById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_get_blood_group_by_id_endpoint(Integer id) {
       requestBody.put("key",id);
    }

    @Given("The api user sends a GET body and saves the returned response.")
    public void the_api_user_sends_a_get_body_and_saves_the_returned_response() {
       response=given()
               .spec(spec)
               .contentType(ContentType.JSON)
               .when()
               .body(requestBody.toString())
               .get(fullPath);
    }
    @Given("The api user verifies the information in the response body includes {string},{string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_includes(String id, String name, String is_blood_group, String created_at) {

        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.name", Matchers.equalTo(name),
                        "lists.is_blood_group", Matchers.equalTo(is_blood_group),
                        "lists.created_at", Matchers.equalTo(created_at));
    }

    @Given("The api user prepares a GET request containing the {int} information to send to the api visitorsPurposeid endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_visitors_purposeid_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }

    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(String id, String visitors_purpose, String description, String created_at) {
        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.visitors_purpose", Matchers.equalTo(visitors_purpose),
                        "lists.description", Matchers.equalTo(description),
                        "lists.created_at", Matchers.equalTo(created_at));

    }

    @Given("The api user prepares a GET request that does not contain data")
    public void the_api_user_prepares_a_get_request_that_does_not_contain_data() {
    }

    @Given("The api user sends a GET body, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_get_body_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
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

    @Given("The api user prepares a POST request containing {string} and {string} information to send to the api visitorsPurposeAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_visitors_purpose_add_endpoint(String visitors_purpose, String description) {
        map.put("visitors_purpose", visitors_purpose);
        map.put("description", description);

        System.out.println("Post Body : " + map);
    }

    @Given("The api user sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .post(fullPath);

        response.prettyPrint();
    }

    @Given("The api user prepares a POST request that does not contain data")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data() {
    }

    @Given("The api user prepares a PATCH request containing {int}, {string} and {string} information to send to the api visitorsPurposeUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_visitors_purpose_update_endpoint(int id, String visitors_purpose, String description) {
        map = testData.visitorsPurposeUpdateRequestBody(id, visitors_purpose, description);

        System.out.println("Patch Body : " + map);
    }

    @Given("The api user sends a PATCH request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .patch(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body")
    public void the_api_user_verifies_that_the_updateid_information_in_the_response_body_is_the_same_as_the_id_information_in_the_patch_request_body() {
        repJP = response.jsonPath();

        Assert.assertEquals(map.get("id"), repJP.getInt("updateId"));
    }
}

