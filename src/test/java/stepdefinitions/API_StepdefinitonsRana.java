package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.hamcrest.Matchers;
import org.junit.Assert;
import pojos.Pojo;
import pojos.VisitorsPojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.TestData;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_StepdefinitonsRana extends BaseTest {
    TestData testData = new TestData();
    String exceptionMesaj = null;
    Pojo pojoRequest;

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string},{string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(Integer dataIndex, String id, String name, String is_blood_group, String created_at) {
        repJP = response.jsonPath();
        Assert.assertEquals(id, repJP.getString("lists[" + dataIndex + "].id"));
        Assert.assertEquals(name, repJP.getString("lists[" + dataIndex + "].name"));
        Assert.assertEquals(is_blood_group, repJP.getString("lists[" + dataIndex + "].is_blood_group"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataIndex + "].created_at"));
    }



    @Given("The api user prepares a Get request doesnt contain information to send to the api getBloodGroupById endpoint.")
    public void the_api_user_prepares_a_get_request_doesnt_contain_information_to_send_to_the_api_get_blood_group_by_id_endpoint() {

    }


    @Given("The api user prepares a post request containing the Kan Grubu,{int} information to send to the api getBloodGroupById endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_kan_grubu_information_to_send_to_the_api_get_blood_group_by_id_endpoint(Integer id) {
        requestBody.put("id", id);
        System.out.println("Get Body : " + requestBody);
    }
    @Given("The Api user send Post request with data")
    public void the_api_user_send_post_request_with_data() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .get(fullPath);

        response.prettyPrint();
    }
    @Given("The api user prepares a post request containing the {string} and {string} information to send to the api getBloodGroup endpointt.")
    public void the_api_user_prepares_a_post_request_containing_the_and_information_to_send_to_the_api_get_blood_group_endpointt(String name, String is_blood_group) {
        response.then()
                .assertThat()
                .body("lists.name", Matchers.equalTo(name),
                        "lists.is_blood_group", Matchers.equalTo(is_blood_group));
    }
    @Given("The api user prepares a POST request that does not contain data")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data() {



    }
    @Given("The api user sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .post(fullPath);

        response.prettyPrint();
    }

    @Given("The api user sends a PATCH request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .patch(fullPath);
        response.prettyPrint();

    }


    @Given("The api user prepares a PATCH request containing {string} and {string} information to send to the api api\\/updateBloodGroup endpointt.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_api_update_blood_group_endpointt(String name, String is_blood_group) {

        pojoRequest=new Pojo(name,is_blood_group);

        System.out.println("Patch Body "+ pojoRequest);

    }
    @Given("The api user prepares a PATCH request that does not contain datas")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_datas() {
       pojoRequest=new Pojo();
    }


    @Given("The api user sends a Get request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbiddenn.")
    public void the_api_user_sends_a_Get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbiddenn(String string) {

       try {
           response = given()
                   .spec(spec)
                   .contentType(ContentType.JSON)
                   .when()
                   .body(map)
                   .patch(fullPath);
           response.prettyPrint();
       }catch (Exception e){
           exceptionMesaj=e.getMessage();
       }
        System.out.println("Exception message: "+ exceptionMesaj);
       Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage:"),exceptionMesaj);

    }


    @Given("The api user prepares a PATCH request containing {int}, {string} and {string} information to send to the api api\\/updateBloodGroup endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_api_update_blood_group_endpoint(Integer id, String name, String is_blood_group) {
        pojoRequest = new Pojo(name, is_blood_group);

        System.out.println("Patch Body : " + pojoRequest);
    }

    @Given("The api user prepares a PATCH request that does not contain an id but includes, {string} and {string} information to send to the api updateBloodGroup endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_an_id_but_includes_and_information_to_send_to_the_api_update_blood_group_endpoint(String name, String is_blood_group) {
        pojoRequest = new Pojo(name, is_blood_group);

        System.out.println("Patch Body : " + pojoRequest);


    }

    @Given("The api user prepares a DELETE request to send to the api deleteBloodGroup add endpoint.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_delete_blood_group_add_endpoint() {
        requestBody.put("id",521);

        System.out.println("Delete Body: "+requestBody);
    }

    @Given("The api user prepares a GET request containing the {int} information to send to the api bloodGroupId endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_blood_GroupId_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);

        //Rana
    }
}
