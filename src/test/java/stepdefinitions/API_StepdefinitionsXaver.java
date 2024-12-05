package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;

import static io.restassured.RestAssured.given;

public class API_StepdefinitionsXaver extends BaseTest {
    String exceptionMesaj = null;


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

    }














