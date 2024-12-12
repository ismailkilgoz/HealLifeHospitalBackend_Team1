package stepdefinitions.API;

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
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepDefinitions_09_10_11_12 extends BaseTest {

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

    @Given("An api user sends a GET request with a body containing {string} and saves the returned response.")
    public void an_api_user_sends_a_get_request_with_a_body_containing_and_saves_the_returned_response(String id) {

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


    @Given("An api user sends a GET request with invalid authorization, saves the returned response, and verifies that the status code is {string} with the reason phrase {string}.")
    public void an_api_user_sends_a_get_body_with_invalid_authorization_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden(String code, String message) {


        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), code);


    }


    @Given("An api user sends a {string} body with invalid authorization, saves the returned response, and verifies that the status code is {int} with the reason phrase {string}.")
    public void an_api_user_sends_a_get_request_with_invalid_authorization_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden(String httpMethod, Integer code, String message) {
        Integer id = 1118;
        requestBody.put("id", id);

        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(requestBody.toString())
                    .post(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);


    }


    @Given("An api user sends a GET request with valid authorization and incorrect {string}, saves the returned response, and verifies that the status code is {int} with the reason phrase {string}.")
    public void an_api_user_sends_a_get_request_with_valid_authorization_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase(String id, Integer code, String message) {

        requestBody.put("id", id);

        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .get(fullPath);
        response.prettyPrint();


    }

    @Given("An api user prepears a GET body without {string}")
    public void an_api_user_prepears_a_get_body_without_data_id(String id) {

        id = null;
        requestBody.put("key", id);


    }

    @Given("An api user verifies that the returned status code is {int}.")
    public void an_api_user_verifies_that_the_returned_status_code_is(Integer code) {
        API_Methods.statusCodeAssert(code);
    }


    @Given("An api user prepears a {string} request with a body containing correct data of {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void an_api_user_preapers_and_sends_a_request_with_a_body_containing_correct_data_of_and_saves_the_returned_response(String httpMethod, String purpose, String name, String email, String contact, String id_proof, String visit_to, String ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String in_time, String out_time, String note) {

        requestBody.put("purpose", purpose);
        requestBody.put("name", name);
        requestBody.put("email", email);
        requestBody.put("contact", contact);
        requestBody.put("id_proof", id_proof);
        requestBody.put("visit_to", visit_to);
        requestBody.put("ipd_opd_staff_id", ipd_opd_staff_id);
        requestBody.put("related_to", related_to);
        requestBody.put("no_of_pepple", no_of_pepple);
        requestBody.put("date", date);
        requestBody.put("in_time", in_time);
        requestBody.put("out_time", out_time);
        requestBody.put("note", note);

        System.out.println("Post Body : " + requestBody.toString());


    }

    @Given("An api user sends a {string} request and saves the returned response.")
    public void an_api_user_sends_a_request_and_saves_the_returned_response(String httpMethod) {

        API_Methods.sendRequest(httpMethod, requestBody.toString());


    }

    @Given("An api user prepears a {string} request with a body containing no data")
    public void an_api_user_prepears_a_request_with_a_body_containing_no_data(String httpMethod) {


    }

    @Given("An api user sends a {string} request with a body with invalid token and saves the returned response.")
    public void an_api_user_sends_a_request_with_a_body_with_invalid_token_and_saves_the_returned_response(String httpMethod) {

        API_Methods.sendRequest(httpMethod, requestBody);


    }

    @Given("An api user sends a {string} request with invalid token and correct data, saves the returned response, verifies that the returned status code is {int} with the reason phrase {string}.")
    public void an_api_user_sends_a_request_with_invalid_token_and_correct_data_saves_the_returned_response_verifies_that_the_information_in_the_response_body_is(String httpMethod, Integer code, String value) {


        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .post(fullPath);

        response.prettyPrint();

        API_Methods.statusCodeAssert(code);
        API_Methods.assertBody("message", value);

    }

    @Given("An api user prepears a {string} request with a body containing correct data of {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void an_api_user_prepears_a_request_with_a_body_containing_correct_data_of(String httpMethod, Integer id, String purpose, String name, String email, String contact, String id_proof, String visit_to, String ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String in_time, String out_time, String note) {

        requestBody.put("id", id);
        requestBody.put("purpose", purpose);
        requestBody.put("name", name);
        requestBody.put("email", email);
        requestBody.put("contact", contact);
        requestBody.put("id_proof", id_proof);
        requestBody.put("visit_to", visit_to);
        requestBody.put("ipd_opd_staff_id", ipd_opd_staff_id);
        requestBody.put("related_to", related_to);
        requestBody.put("no_of_pepple", no_of_pepple);
        requestBody.put("date", date);
        requestBody.put("in_time", in_time);
        requestBody.put("out_time", out_time);
        requestBody.put("note", note);

        System.out.println("Patch Body : " + requestBody.toString());


    }

    @Given("An api user prepears a {string} request with incorrect data of {int} and correct data of {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void an_api_user_prepears_a_request_with_a_body_containing_incorrect_data_of_and_correct_data_of(String httpMethod, Integer incorrecId, String updatePurpose, String updateName, String updateEmail, String updateContact, String updatId_proof, String updateVisit_to, String updateOpd_opd_staff_id, String updateRelated_to, String updateNo_of_pepple, String updateDate, String updateIn_time, String updatOut_time, String updateNote) {

        requestBody.put("id", incorrecId);
        requestBody.put("purpose", updatePurpose);
        requestBody.put("name", updateName);
        requestBody.put("email", updateEmail);
        requestBody.put("contact", updateContact);
        requestBody.put("id_proof", updatId_proof);
        requestBody.put("visit_to", updateVisit_to);
        requestBody.put("ipd_opd_staff_id", updateOpd_opd_staff_id);
        requestBody.put("related_to", updateRelated_to);
        requestBody.put("no_of_pepple", updateNo_of_pepple);
        requestBody.put("date", updateDate);
        requestBody.put("in_time", updateIn_time);
        requestBody.put("out_time", updatOut_time);
        requestBody.put("note", updateNote);

        System.out.println("Patch Body : " + requestBody.toString());
    }

    @Given("An api user prepears a {string} request without data of id and correct data of {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void an_api_user_prepears_a_request_without_data_of_id_and_correct_data_of(String httpMethod, String updatePurpose, String updateName, String updateEmail, String updateContact, String updatId_proof, String updateVisit_to, String updateOpd_opd_staff_id, String updateRelated_to, String updateNo_of_pepple, String updateDate, String updateIn_time, String updatOut_time, String updateNote) {

        requestBody.put("purpose", updatePurpose);
        requestBody.put("name", updateName);
        requestBody.put("email", updateEmail);
        requestBody.put("contact", updateContact);
        requestBody.put("id_proof", updatId_proof);
        requestBody.put("visit_to", updateVisit_to);
        requestBody.put("ipd_opd_staff_id", updateOpd_opd_staff_id);
        requestBody.put("related_to", updateRelated_to);
        requestBody.put("no_of_pepple", updateNo_of_pepple);
        requestBody.put("date", updateDate);
        requestBody.put("in_time", updateIn_time);
        requestBody.put("out_time", updatOut_time);
        requestBody.put("note", updateNote);

        System.out.println("Patch Body : " + requestBody.toString());

    }

    @Given("An api user verifies that the updatedId in the response body is the same as the {int} in the {string} request body.")
    public void an_api_user_verifies_that_the_updated_ıd_in_the_response_body_is_the_same_as_the_id_in_the_patch_request_body_sent_to_the_api_visitors_update_endpoint(Integer id,String httpMethod) {


        response.then()
                .assertThat()
                .body("updatedId", Matchers.equalTo(id));

    }
}

