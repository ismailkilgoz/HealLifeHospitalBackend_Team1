package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class FindingCategorySerenStepdefinitions extends BaseTest {


    @Given("The api user sends a {string} request and saves the returned response.")
    public void the_api_user_sends_a_request_and_saves_the_returned_response(String httpMethod ) {
        if (requestBody == null || requestBody.isEmpty()) {
            API_Methods.sendRequest(httpMethod, null);
        } else {
            API_Methods.sendRequest(httpMethod, requestBody);
        }


    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(Integer dataIndex, String category, String created_at) {
        repJP =response.jsonPath();


        Assert.assertEquals(category, repJP.getString("lists["+ dataIndex +"].category"));
       Assert.assertEquals(created_at, repJP.getString("lists["+ dataIndex +"].created_at"));


    }

    @Given("The api user prepares a GET request containing the {int} information to send to the api FindingCategoryById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_finding_category_by_id_endpoint( int id) {

       requestBody.put("id",id);



    }

    @Given("The api user sends a {string} request body and saves the returned response.")
    public void the_api_user_sends_a_request_body_and_saves_the_returned_response(String httpMethod) {

        API_Methods.sendRequest(httpMethod,requestBody.toString());


    }


    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes(String id, String category, String created_at) {

        API_Methods.assertBody("details.id",id);
        API_Methods.assertBody("details.category",category);
        API_Methods.assertBody("details.created_at",created_at);

    }


    @Given("The api user prepares a GET request with {int} for the FindingCategoryById API endpoint.")
    public void the_api_user_prepares_a_get_request_with_id_for_the_finding_category_by_id_api_endpoint(int id) {
        requestBody.put("id",id);


    }


}
