package stepdefinitions.API;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import pojos.Pojo;
import utilities.API_Utilities.TestData;

public class API_StepdefinitionsBunyamin extends BaseTest {

    Pojo pojoRequest;
    TestData testData = new TestData();
    String exceptionMesaj = null;

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string} and {string}")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataindex, String exp_category, String description, String is_active, String is_deleted, String created_at) {
        repJP = response.jsonPath();

        Assert.assertEquals(exp_category, repJP.getString("lists[" + dataindex + "].exp_category"));
        Assert.assertEquals(description, repJP.getString("lists[" + dataindex + "].description"));
        Assert.assertEquals(is_active, repJP.getString("lists[" + dataindex + "].is_active"));
        Assert.assertEquals(is_deleted, repJP.getString("lists[" + dataindex + "].is_deleted"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataindex + "].created_at"));

    }

    @Given("The api user verifies that the {string} information in the response body is {string}")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));
    }



}
