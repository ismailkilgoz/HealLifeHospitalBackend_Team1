package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import pojos.Pojo;
import pojos.VisitorsPojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.TestData;
import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

import io.restassured.response.ValidatableResponse;
import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepdefinitionsFatma extends BaseTest {


    Pojo pojoRequest;
    TestData testData = new TestData();
    String exceptionMesaj = null;





    @Given("The api user verifies the information in the response body for the entry with the specified {int} , including {string}, {string},{string},{string},{string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_including(Integer dataIndex, String type, String slug, String url, String title, String date) {
        repJP =response.jsonPath();
        Assert.assertEquals(type, repJP.getString("lists[" + dataIndex + "].type"));
        Assert.assertEquals(slug, repJP.getString("lists[" + dataIndex + "].slug"));
        Assert.assertNull(url, repJP.getString("lists[" + dataIndex + "].url"));
        Assert.assertEquals(title, repJP.getString("lists[" + dataIndex + "].title"));
        Assert.assertEquals(date, repJP.getString("lists[" + dataIndex + "].date"));
    }


    @Given("The api user prepares a post request containing the {string} {string} and {string} information to send to the api getNotice endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_and_information_to_send_to_the_api_get_notice_endpoint(String dataIndex, String id, String type) {
        repJP = response.jsonPath();

        Assert.assertEquals(id, repJP.getString("lists[" + dataIndex + "].id"));
        Assert.assertEquals(type, repJP.getString("lists[" + dataIndex + "].type"));
    }


    @Given("The api user prepares a GET request containing the {int} information to send to the api getNoticeById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_get_notice_by_id_endpoint(Integer id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }

    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes(String id, String type, String slug, String url, String title, String date) {
       response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.type", Matchers.equalTo(type),
                        "lists.slug", Matchers.equalTo(slug),
                        "lists.url", Matchers.equalTo(url),
                        "lists.title",Matchers.equalTo(title),
                        "lists.date",Matchers.equalTo(date));
    }

    @Given("The api user sets {string} path parameters")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);

    }


    @Given("The api user prepares a POST request containing {string}, {string}, {string} and {string} information to send to the api visitorsPurposeAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_visitors_purpose_add_endpoint(String type, String title, String description, String slug) {
        map.put("type", type);
        map.put("title", title);
        map.put("description", description);
        map.put("slug", slug);

        System.out.println("Post Body : " + map);
    }



    @Given("The api user prepares a POST request containing {string}, {string}, {string}, {string} information to send to the api visitorsPurposeAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_information_to_send_to_the_api_visitors_purpose_add_endpoint(String type, String title, String description, String slug) {
        map.put("type", type);
        map.put("title", title);
        map.put("description", description);
        map.put("slug", slug);

        System.out.println("Post Body : " + map);
    }


    @Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string}, {string} information to send to the api noticeUpdate endpoint")
    public void the_api_user_prepares_a_patch_request_containing_information_to_send_to_the_api_notice_update_endpoint(Integer id, String type, String title, String description, String slug) {
        map = testData.NoticeUpdateRequestBody(id, type, title, description, slug);

        System.out.println("Patch Body : " + map);
    }



    @Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string} and {string} information to send to the api updateNotice endpoint")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_update_notice_endpoint(Integer id, String type, String title, String description, String slug) {
        map = testData.NoticeUpdateRequestBody(id, type, title, description, slug);

        System.out.println("Patch Body : " + map);
    }


    @Given("The api user prepares a PATCH request that does not contain an id but includes  {string}, {string}, {string} and {string} information to send to the api noticeUpdate endpoint")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_an_id_but_includes_and_information_to_send_to_the_api_visitors_purpose_update_endpoint(String type, String title, String description, String slug) {
        pojoRequest = new Pojo();

        System.out.println("Patch Body : " + pojoRequest);
    }


    @Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string} and {string} information to send to the api noticeUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_visitors_purpose_update_endpoint(Integer id, String type, String title, String description, String slug) {
        map = testData.NoticeUpdateRequestBody(id, type, title, description, slug);

        System.out.println("Patch Body : " + map);
    }


    @Given("The api user verifies that the updateId information in the Response body is the same as the id information in the patch request body")
    public void the_api_user_verifies_that_the_update_ıd_information_in_the_response_body_is_the_same_as_the_id_information_in_the_patch_request_body() {
        repJP = response.jsonPath();

        Assert.assertEquals(map.get("id"), repJP.getInt("updateId"));
    }
}



