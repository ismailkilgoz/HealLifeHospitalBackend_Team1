package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import pojos.Pojo;
import utilities.API_Utilities.TestData;

import static io.restassured.RestAssured.given;

public class API_StepdefinitionsXaver extends BaseTest {
    String exceptionMesaj = null;
    TestData testData= new TestData();
    Pojo pojoRequest;

    @Given("The api user prepares a Get request containing the {int} information to send to the api getNoticeById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_get_notice_by_id_endpoint(Integer id) {
        requestBody.put("id", id);


    }
    @Given("The api user verifies the information in the response  body for the entry with the specified {int} , including {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_including(Integer dataindex, String type, String slug, String title, String date) {
        repJP =response.jsonPath();
        Assert.assertEquals(type, repJP.getString("lists[" + dataindex + "].type"));
        Assert.assertEquals(slug, repJP.getString("lists[" + dataindex + "].slug"));
        Assert.assertEquals(title, repJP.getString("lists[" + dataindex + "].title"));
        Assert.assertNull( repJP.getString("lists[" + dataindex + "].url"));
        Assert.assertEquals(date, repJP.getString("lists[" + dataindex + "].date"));
    }
    @Given("The api user verifies the information in the response body includes {string},{string}, {string},{string}{string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_includes(String id, String type, String slug, String title, String date) {
        response.then()
                .assertThat()
                .body("lists.id",Matchers.equalTo(id),
                        "lists.type",Matchers.equalTo(type),
                        "lists.slug",Matchers.equalTo(slug),
                        "lists.url",Matchers.equalTo(null),
                        "lists.title",Matchers.equalTo(title),
                        "lists.date",Matchers.equalTo(date));
    }
    @Given("The api user prepares a POST request containing {string},{string}, {string} and {string} information to send to the api visitorsPurposeAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_visitors_purpose_add_endpoint(String type, String title, String description, String slug) {
    map.put("type", type);
    map.put("title",title);
    map.put("description",description);
    map.put("slug",slug);

        }
    @Given("The api user prepares a PATCH request that does not contain an id but includes {string},{string}, {string} and {string} information to send to the api updateNotice endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_an_id_but_includes_and_information_to_send_to_the_api_update_notice_endpoint(String type, String title, String description, String slug) {

    }
    @Given("The api user prepares a  DELETE request to send to the api visitorsPurposeDelete add endpoint.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_visitors_purpose_delete_add_endpoint() {

        requestBody.put("id", 775);

        System.out.println("Delete Body : " + requestBody);
    }
    }
















