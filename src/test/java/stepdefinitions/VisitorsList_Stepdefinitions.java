package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.MatcherAssert.assertThat;
import static utilities.API_Utilities.API_Methods.fullPath;

public class VisitorsList_Stepdefinitions extends BaseTest {
    String exceptionMesaj = null;


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
                .body(key, Matchers.equalTo(value));


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


    @Then("The api user verifies the information in the response body for the entry with the specified {int} index, including{string}, {string}, {string}, {string}, {string}, {string},{string},{string},{string},{string},{string},{string},{string},{string},{string},{string}.")
    public void theApiUserVerifiesTheInformationInTheResponseBodyForTheEntryWithTheSpecifiedDataindexIndexIncluding(int dataindex, String source, String purpose, String name, String email, String contact, String id_proof, String visit_to, String ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String in_time, String out_time, String note, String image, String created_at) {
        repJP = response.jsonPath();
        Assert.assertEquals(source, repJP.getString("lists[" + dataindex + "].source"));
        Assert.assertEquals(purpose, repJP.getString("lists[" + dataindex + "].purpose"));
        Assert.assertEquals(name, repJP.getString("lists[" + dataindex + "].name"));
        Assert.assertEquals(email, repJP.getString("lists[" + dataindex + "].email"));
        Assert.assertEquals(contact, repJP.getString("lists[" + dataindex + "].contact"));
        Assert.assertEquals(id_proof, repJP.getString("lists[" + dataindex + "].id_proof"));
        Assert.assertEquals(visit_to, repJP.getString("lists[" + dataindex + "].visit_to"));
        Assert.assertEquals(ipd_opd_staff_id, repJP.getString("lists[" + dataindex + "].ipd_opd_staff_id"));
        Assert.assertEquals(related_to, repJP.getString("lists[" + dataindex + "].related_to"));
        Assert.assertEquals(no_of_pepple, repJP.getString("lists[" + dataindex + "].no_of_pepple"));
        Assert.assertEquals(date, repJP.getString("lists[" + dataindex + "].date"));
        Assert.assertEquals(in_time, repJP.getString("lists[" + dataindex + "].in_time"));
        Assert.assertEquals(out_time, repJP.getString("lists[" + dataindex + "].out_time"));
        Assert.assertEquals(note, repJP.getString("lists[" + dataindex + "].note"));
        Assert.assertEquals(image, repJP.getString("lists[" + dataindex + "].image"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataindex + "].created_at"));
    }


}
