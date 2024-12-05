package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import pojos.Pojo;
import utilities.API_Utilities.TestData;

import static io.restassured.RestAssured.given;

public class API_StepsMustafa extends BaseTest {

    TestData testData = new TestData();

    @Given("The api user prepares a GET request containing the {int} information to send to the api getExpenseHeadById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_get_expense_head_by_id_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }

    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string}, {string} {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(String id, String exp_category, String description, String is_active, String is_deleted, String created_at) {
        response.then()
                .assertThat()
                .body("details.id", Matchers.equalTo(id),
                        "details.exp_category", Matchers.equalTo(exp_category),
                        "details.description", Matchers.equalTo(description),
                        "details.is_active", Matchers.equalTo(is_active),
                        "details.is_deleted", Matchers.equalTo(is_deleted),
                        "details.created_at", Matchers.equalTo(created_at));
    }

    @Given("The api user prepares a GET request containing the {int} information to send to the api api getExpenseHeadById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_api_get_expense_head_by_id_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }

    @Given("The api user prepares a POST request containing {string}, {string}, {string} and {string} information to send to the api addExpenseHead endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_add_expense_head_endpoint(String exp_category, String description, String is_active, String is_deleted) {
        map.put("exp_category", exp_category);
        map.put("description", description);
        map.put("is_active", is_active);
        map.put("is_deleted", is_deleted);

        System.out.println("Post Body : " + map);

    }
    @Given("The api user prepares a GET request containing the {int} information to send to the api addExpenseHead endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_add_expense_head_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }

    @Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string} and {string} information to send to the api updateExpenseHead endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_update_expense_head_endpoint(int id, String exp_category, String description, String is_active, String is_deleted) {
        map = testData.expenseHeadUpdateRequestBody(id, exp_category, description, is_active, is_deleted);

        System.out.println("Patch Body : " + map);
    }

    @Given("The api user prepares a PATCH request that does not contain an id but includes {string}, {string}, {string} and {string} information to send to the api updateExpenseHead endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_an_id_but_includes_and_information_to_send_to_the_api_update_expense_head_endpoint(String string, String string2, String string3, String string4) {

        // pojo
    }


    @Given("The api user prepares a GET request containing the {int} information to send to the api updateExpenseHead endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_update_expense_head_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }
}
