package stepdefinitions;
import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepdefinitionsCan extends BaseTest {

    String exceptionMesaj = null;


    @Given("The api user prepares a POST request containing {string} and {string} information to send to the api addBloodGroup endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_addBloodGroup_add_endpoint(String name, String is_blood_group) {

        map.put("name", name);
        map.put("is_blood_group", is_blood_group);

        System.out.println("Post Body : " + map);
    }



    @Given("The api user prepares a Get request containing the {int} information to send to the api addBloodGroup endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_add_blood_group_endpoint(Integer id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);



    }
}
