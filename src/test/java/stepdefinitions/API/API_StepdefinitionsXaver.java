package stepdefinitions.API;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import pojos.Pojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.TestData;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepdefinitionsXaver extends BaseTest {
    Pojo pojoRequest;
    TestData testData = new TestData();
    String exceptionMesaj = null;

    @Given("The api user sets {string} path  parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {

        API_Methods.pathParam(pathParam);
    }
    @Given("The api user sends a GET request and saves the returned  response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();
    }
    @Given("The api user verifies that the status code is  {int}.")
    public void the_api_user_verifies_that_the_status_code_is(Integer code) {
        response.then()
                .assertThat()
                .statusCode(code);
    }
    @Given("The api user verifies that the {string} information in the  response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));


}@Given("The api user verifies the information in the response  body for the entry with the specified {int} , including {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_including(Integer dataindex, String type, String slug, String title, String url, String date) {
        repJP =response.jsonPath();
        Assert.assertEquals(type, repJP.getString("lists[" + dataindex + "].type"));
        Assert.assertEquals(slug, repJP.getString("lists[" + dataindex + "].slug"));
        Assert.assertNull(url, repJP.getString("lists[" + dataindex + "].url"));
        Assert.assertEquals(title, repJP.getString("lists[" + dataindex + "].title"));
        Assert.assertEquals(date, repJP.getString("lists[" + dataindex + "].date"));

    }
    @Given("The api user prepares a Get request containing the {int} information to send to the api getNoticeById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_get_notice_by_id_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }
    @Given("The api user verifies the information in the response body includes {string},{string}, {string},{string}{string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_includes(String id, String type, String slug, String title, String date) {
        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.type", Matchers.equalTo(type),
                        "lists.slug", Matchers.equalTo(slug),
                        "lists.url", Matchers.equalTo(null),
                        "lists.title", Matchers.equalTo(title),
                        "lists.date", Matchers.equalTo(date));

}
@Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string} and {string} information to send to the api updateNotice endpoint.")
public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_update_notice_endpoint(int id, String type, String title, String description, String slug) {

    map.put("id", id);
    map.put("type", type);
    map.put("title", title);
    map.put("description", description);
    map.put("slug", slug);

    System.out.println("Patch : " + map);
}
@Given("The api user prepares a PATCH request containing {string}, {string}, {string} and {string} information to send to the api updateNotice endpoint.")
public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_update_notice_endpoint(String type, String title, String description, String slug) {
    map.put("type", type);
    map.put("title", title);
    map.put("description", description);
    map.put("slug", slug);
}
    @Given("The api user verifies that the updatedid information in the Response body is the same as the id information in the patch request body")
    public void the_api_user_verifies_that_the_updatedid_information_in_the_response_body_is_the_same_as_the_id_information_in_the_patch_request_body() {
        repJP = response.jsonPath();

        Assert.assertEquals(map.get("id"), repJP.getInt("updateId"));
    }
    @Given("The api user prepares a  DELETE request to send to the api deleteNotice add endpoint.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_delete_notice_add_endpoint() {
        requestBody.put("id", 520);
        System.out.println("Delete Body : " + requestBody);
    }

    @Given("The api user prepares a POST request containing {string},{string}, {string} and {string} information to send to the api visitorsPurposeAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_visitors_purpose_add_endpoint(String type, String title, String description, String slug) {
      map.put("type", type);
      map.put("title", title);
      map.put("description", description);
      map.put("slug",slug);
    }
    @Given("The api user verifies that the deletedId information is the same as the id information in the request body.")
    public void the_api_user_verifies_that_the_deleted_id_information_is_the_same_as_the_id_information_in_the_request_body() {
        repJP = response.jsonPath();

        Assert.assertEquals(requestBody.get("id"), repJP.getInt("deletedId"));

    }
}



