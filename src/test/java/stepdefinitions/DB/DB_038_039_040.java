package stepdefinitions.DB;

import Manage.Manage_DB038_039_040;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Given;


public class DB_038_039_040 extends Manage_DB038_039_040 {


    //US038


    @When("I query for donors with blood_bank_product_id = {int}")
    public void i_query_for_donors_with_blood_bank_product_id(Integer int1) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("I should see the following donors:")
    public void i_should_see_the_following_donors(io.cucumber.datatable.DataTable dataTable) {
        // Write code here that turns the phrase above into concrete actions
        // For automatic transformation, change DataTable to one of
        // E, List<E>, List<List<E>>, List<Map<K,V>>, Map<K,V> or
        // Map<K, List<V>>. E,K,V must be a String, Integer, Float,
        // Double, Byte, Short, Long, BigInteger or BigDecimal.
        //
        // For other transformations you can register a DataTableType.
        throw new io.cucumber.java.PendingException();
    }


    //US039
    @When("I query the table for donors over the age of {int}")
    public void iQueryTheTableForDonorsOverTheAgeOf(int arg0) {

    }

    @Then("I should see the following names:")
    public void iShouldSeeTheFollowingNames() {
    }


    //US040
    @When("I query the table for dispatches sent to {string}")
    public void iQueryTheTableForDispatchesSentTo(String arg0) {

    }

    @Then("I should see the following reference numbers:")
    public void iShouldSeeTheFollowingReferenceNumbers() {
    }









}
