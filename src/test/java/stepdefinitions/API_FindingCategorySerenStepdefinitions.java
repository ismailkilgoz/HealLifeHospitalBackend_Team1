package stepdefinitions;

import base.BaseTest;
import com.google.gson.Gson;
import com.google.gson.JsonParser;
import io.cucumber.java.en.Given;
import org.json.JSONObject;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.RequestBuilder;
import utilities.API_Utilities.TestData;

import static io.restassured.RestAssured.given;

public class API_FindingCategorySerenStepdefinitions extends BaseTest {
    TestData testData=new TestData();
    Gson gson = new Gson();




    @Given("The api user sends a {string} request and saves the returned response.")
    public void the_api_user_sends_a_request_and_saves_the_returned_response(String httpMethod ) {
        if (requestBody == null || requestBody.isEmpty()) {
            API_Methods.sendRequest(httpMethod, null);
        } else {
            API_Methods.sendRequest(httpMethod, requestBody.toString());
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

    @Given("The api user prepares a POST request containing {string} and {string} information to send to the api FindingCategory endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_finding_category_endpoint(String category, String created_at) {
       requestBody=requestBody.put("category",category);
       requestBody=requestBody.put("created_at",created_at);

    }

    @Given("The api user prepares a {string} request that does not contain data for FindingCategory.")
    public void the_api_user_prepares_a_request_that_does_not_contain_data_for_finding_category(String HttpMethod) {

    }


    @Given("The api user prepares a PATCH request containing {int} and {string} information to send to the api Finding Category endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_ill_category_information_to_send_to_the_api_finding_category_endpoint(Integer id, String category) {
      requestBody.put("id",id);
      requestBody.put("category",category);


    }
    @Given("The api user verifies that the {string} information in the Response body is the same as the id information in the patch request body.")
    public void the_api_user_verifies_that_the_updated_information_in_the_response_body_is_the_same_as_the_id_information_in_the_patch_request_body(String updateId) {

        repJP=response.jsonPath();

      Assert.assertEquals(requestBody.getInt("id"), repJP.getInt(updateId));

    }


    @Given("The api user prepares a PATCH request containing {string} and {string} information to send to the api FindingCategory endpoint.")
    public void the_api_user_prepares_a_request_containing_and_information_to_send_to_the_api_finding_category_endpoint(String id, String category) {
        stringRequestBody= builder
                .addParameterForMap("id",id)
                .addParameterForMap("category",category)
                .buildUsingMap();

            API_Methods.toJSONObject(stringRequestBody);



    }


}
