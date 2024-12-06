package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.junit.Assert;
import pojos.VisitorsPojo;
import utilities.API_Utilities.TestData;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepdefinitionsFatma extends BaseTest {

    VisitorsPojo pojoRequest;
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
        repJP =response.jsonPath();
        if(response==null) {
            throw new RuntimeException("Response is null. Please check the POST request.");
        }
        Assert.assertEquals(id, repJP.getString("lists[" + dataIndex + "].id"));
        Assert.assertEquals(type, repJP.getString("lists[" + dataIndex + "].type"));


        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj=e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);

    }

    }



