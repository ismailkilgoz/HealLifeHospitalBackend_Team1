package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import static org.hamcrest.CoreMatchers.equalTo;

public class FindingCategoryStepdefinitions extends BaseTest {

    public static String requestBody;

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
        respJP =response.jsonPath();


        Assert.assertEquals(category, respJP.getString("lists["+ dataIndex +"].category"));
       Assert.assertEquals(created_at, respJP.getString("lists["+ dataIndex +"].created_at"));


    }




}
