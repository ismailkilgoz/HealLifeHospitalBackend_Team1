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

public class API_StepdefinitonsRana extends BaseTest {
    String exceptionMesaj = null;

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(Integer dataIndex, String name, String is_blood_group, String created_at) {
        repJP = response.jsonPath();
        Assert.assertEquals(name, repJP.getString("lists[" + dataIndex + "].name"));
        Assert.assertEquals(is_blood_group, repJP.getString("lists[" + dataIndex + "].is_blood_group"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataIndex + "].created_at"));
    }



    @Given("The api user prepares a Get request doesnt contain information to send to the api getBloodGroupById endpoint.")
    public void the_api_user_prepares_a_get_request_doesnt_contain_information_to_send_to_the_api_get_blood_group_by_id_endpoint() {

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

    @Given("The api user prepares a post request containing the Kan Grubu,{int} information to send to the api getBloodGroupById endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_kan_grubu_information_to_send_to_the_api_get_blood_group_by_id_endpoint(Integer id) {
        requestBody.put("id", id);
        System.out.println("Get Body : " + requestBody);
    }
    @Given("The Api user send Post request with data")
    public void the_api_user_send_post_request_with_data() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .get(fullPath);

        response.prettyPrint();
    }
    @Given("The api user prepares a post request containing the {string} and {string} information to send to the api getBloodGroup endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_and_information_to_send_to_the_api_get_blood_group_endpoint(String name, String is_blood_group) {
        response.then()
                .assertThat()
                .body("lists.name", Matchers.equalTo(name),
                        "lists.is_blood_group", Matchers.equalTo(is_blood_group));
    }


    @Given("The api user prepares a POST request that does not contain data")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data() {

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





}
