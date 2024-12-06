package stepdefinitions;

import base.BaseTest;

import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.hamcrest.Matchers;
import org.junit.Assert;
import pojos.VisitorsPojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.TestData;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepDefinitions_Umit extends BaseTest {

    VisitorsPojo pojoRequest;
    TestData testData = new TestData();
    String exceptionMesaj = null;


    @Given("An api user sets {string} path parameters.")
    public void an_api_user_sets_path_parameters(String pathParam) {

        API_Methods.pathParam(pathParam);

    }

    @Given("An api user sends a GET request and saves the returned response.")
    public void an_api_user_sends_a_get_request_and_saves_the_returned_response() {

       API_Methods.sendRequest("GET", null);

      }

    @Given("An api user verifies that the status code is {int}.")
    public void an_api_user_verifies_that_the_status_code_is(Integer code) {

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

    @Given("An api user verifies that the {string} information in the response body is {string}.")
    public void an_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {

        API_Methods.assertBody(key, value);

    }

    @Given("An api user sends a GET request with a body containing {int} and saves the returned response.")
    public void an_api_user_sends_a_get_request_with_a_body_containing_and_saves_the_returned_response(Integer id) {

        requestBody.put("id", id);

        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .get(fullPath);
        response.prettyPrint();

    }


    @Given("An api user verifies the data of {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} that is returned in the response body of id\\(x).")
    public void an_api_user_verifies_the_data_of_that_is_returned_in_the_response_body_of_id_x(String purpose, String source, String created_at, String name, String email, String no_of_pepple, String date, String note, String id_proof, String visit_to, String ipd_opd_staff_id, String related_to) {
        response.then()
                .assertThat()
                .body("lists.purpose", Matchers.equalTo(purpose),
                        "lists.source", Matchers.equalTo(source),
                        "lists.created_at", Matchers.equalTo(created_at),
                        "lists.name", Matchers.equalTo(name),
                        "lists.email", Matchers.equalTo(email),
                        "lists.no_of_pepple", Matchers.equalTo(no_of_pepple),
                        "lists.date", Matchers.equalTo(date),
                        "lists.note", Matchers.equalTo(note),
                        "lists.id_proof", Matchers.equalTo(id_proof),
                        "lists.visit_to", Matchers.equalTo(visit_to),
                        "lists.ipd_opd_staff_id", Matchers.equalTo(null),
                        "lists.related_to", Matchers.equalTo(related_to));


    }




    @Given("An api user sends a GET request with invalid authorization, saves the returned response, and verifies that the status code is {string} with the reason phrase Forbidden.")
    public void an_api_user_sends_a_get_body_with_invalid_authorization_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden(String code) {

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


}
