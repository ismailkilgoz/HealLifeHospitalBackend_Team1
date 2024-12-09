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

        response.prettyPrint();
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

        //response.prettyPrint();
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

    @Then("The Api User prepares a GET request containing the {int} information to send to the api getFindingById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_id_information_to_send_to_the_api_get_finding_by_id_endpoint(Integer id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }

    @Then("The Api User sends a GET body and saves the returned response.")
    public void the_api_user_sends_a_get_body_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .get(fullPath);

        response.prettyPrint();
    }

    @Then("The Api User sends a GET body and saves the returned response body.")
    public void the_api_user_sends_a_get_body_and_saves_the_returned_response_body() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .get(fullPath);

        response.prettyPrint();
    }

    @Then("The Api User verifies the information in the response body for the entry with the specified {int}, including {string}, {string}, {string}, {string} and {string}  .")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_including_and(Integer id, String name, String description, String finding_category_id, String created_at, String category) {
        repJP = response.jsonPath();

        Assert.assertEquals(map.get("id"), repJP.getString("id"));
        Assert.assertEquals(map.get("name"), repJP.getString("name"));
        Assert.assertEquals(map.get("description"), repJP.getString("description"));
        Assert.assertEquals(map.get("finding_category_id"), repJP.getString("finding_category_id"));
        Assert.assertEquals(map.get("created_at"), repJP.getString("created_at"));
        Assert.assertEquals(map.get("category"), repJP.getString("category"));

        response.prettyPrint();
        System.out.println("repJP:");
        repJP.prettyPrint();
    }

    @Then("The Api User prepares a GET request that does not contain data")
    public void the_api_user_prepares_a_get_request_that_does_not_contain_data() {
    }

    @Then("The Api User prepares a GET request containing the {int} information to send to the api getFindingCategoryId endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_get_finding_category_id_endpoint(Integer id) {
        requestBody.put("finding_category_id", id);

        System.out.println("Get Body : " + requestBody);
    }
    @Then("The Api User verifies the information in the response body for the entry with the specified information, including {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_information_including_and(String name, String description, String finding_category_id, String created_at) {
        repJP = response.jsonPath();

        Assert.assertEquals(map.get("name"), repJP.getString("name"));
        Assert.assertEquals(map.get("description"), repJP.getString("description"));
        Assert.assertEquals(map.get("finding_category_id"), repJP.getString("finding_category_id"));
        Assert.assertEquals(map.get("created_at"), repJP.getString("created_at"));


        System.out.println("repJP:");
        repJP.prettyPrint();
    }
    @Then("The Api User prepares a POST request containing {string}, {string} and {int} information to send to the api addFinding endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_add_finding_endpoint(String name, String description, Integer finding_category_id) {
        map.put("name", name);
        map.put("description", description);
        map.put("finding_category_id", finding_category_id);

        System.out.println("Post Body : " + map);
    }
    @Then("The Api User sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .post(fullPath);

        response.prettyPrint();
    }
    @Then("The Api User prepares a POST request that does not contain data.")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data() {     }

    @Then("The Api User sends a Post request, saves the returned response, and verifies that the status code is {string} and the message in the response body is {string}.")
    public void the_api_user_sends_a_post_request_saves_the_returned_response_and_verifies_that_the_status_code_is_and_the_message_in_the_response_body_is(String string, String string2) {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(map)
                    .post(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }
    @Then("The Api User prepares a PATCH request containing {int}, {string}, {string} and {int} information to send to the api updateFinding endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_update_finding_endpoint(Integer id, String name, String description, Integer finding_category_id) {
        requestBody.put("id", id);
        requestBody.put("name", name);
        requestBody.put("description", description);
        requestBody.put("finding_category_id", finding_category_id);

        System.out.println("Patch Body:" + requestBody);



    }
    @Then("The Api User sends a Patch request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {
        /*response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .patch(fullPath);
        */
        API_Methods.sendRequest("PATCH",requestBody.toString());

    }










    @Then("The Api User prepares a Delete request containing the {int} information to send to the api deleteFinding endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_information_to_send_to_the_api_delete_finding_endpoint(Integer id) {
        requestBody.put("id", id);

        System.out.println("Delete Body : " + requestBody);
    }
    @Then("The Api User sends a Delete body and saves the returned response.")
    public void the_api_user_sends_a_delete_body_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .delete(fullPath);

        response.prettyPrint();
    }
    @Then("The Api User prepares a Delete request that does not contain data")
    public void theApiUserPreparesADeleteRequestThatDoesNotContainData() {  }

    @Then("The Api User verifies that the DeletedId information is the same as the id information in the request body")
    public void theApiUserVerifiesThatTheDeletedIdInformationIsTheSameAsTheIdInformationInTheRequestBody() {
        repJP = response.jsonPath();

        Assert.assertEquals(requestBody.get("id"), repJP.getInt("deletedId"));
        System.out.println(repJP.getInt("deletedId"));

    }
}


