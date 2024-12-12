package stepdefinitions.DB;

import HelperDB.CommonData;
import Manage.Manage_DB038_039_040;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Given;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.assertEquals;


public class DB_038_039_040 extends Manage_DB038_039_040 {

    CommonData data=new CommonData();
    private List<Map<String, String>> actualDonors = new ArrayList<>();
    private String donorName;
    private String referenceNo;
    //US038


    @When("I query for donors with blood_bank_product_id = {int}")
    public void i_query_for_donors_with_blood_bank_product_id(Integer int1) throws SQLException {
        query = getUS038();
        preparedStatement = getPraperedStatement(query);
        preparedStatement.setInt(1, int1);
        resultSet = preparedStatement.executeQuery();
        System.out.println("Query Result:");

        while (resultSet.next()) {
            Map<String, String> donor = new HashMap<>();
            donor.put("id", resultSet.getString("id").trim());
            donor.put("donor_name", resultSet.getString("donor_name").trim());
            donor.put("date_of_birth", resultSet.getString("date_of_birth").trim());
            donor.put("blood_bank_product_id", resultSet.getString("blood_bank_product_id").trim());
            donor.put("gender", resultSet.getString("gender").trim());
            actualDonors.add(donor);

            // Print each donor for debugging
            System.out.println(donor);
        }
    }
   @Then("I should see the following donors:")
   public void i_should_see_the_following_donors(DataTable expectedDonorsTable) throws SQLException {
       List<Map<String, String>> expectedDonors = expectedDonorsTable.asMaps(String.class, String.class);

       System.out.println("Expected Donors: " + expectedDonors);
       System.out.println("Actual Donors: " + actualDonors);

       // Validate the two lists
       assertEquals("Donor records do not match", expectedDonors, actualDonors);
   }

  //US039
  @When("I query the table for donors over the age of fifty")
  public void iQueryTheTableForDonorsOverTheAgeOf() throws SQLException {
      query = getUS039();
      preparedStatement = getPraperedStatement(query);
      resultSet = preparedStatement.executeQuery();
      if (resultSet.next()) {
          donorName = resultSet.getString("donor_name");
      }

  }

    @Then("I should see the following names:")
    public void iShouldSeeTheFollowingNames(DataTable expectedNames) {
        String expectedDonorName = expectedNames.cell(0, 0);
        assertEquals(expectedDonorName, donorName);
    }


    //  //US040
 @When("I query the table for dispatches sent to Sadar")
 public void iQueryTheTableForDispatchesSentTo() throws SQLException {
     query = getUS040();
     preparedStatement = getPraperedStatement(query);
     resultSet = preparedStatement.executeQuery();
     if (resultSet.next()) {
         referenceNo = resultSet.getString("reference_no");
     }

 }

 @Then("I should see the following reference numbers:")
 public void iShouldSeeTheFollowingReferenceNumbers(DataTable referenceNums) {
     String expectedRefNum = referenceNums.cell(0, 0);
     assertEquals(expectedRefNum, referenceNo);
 }









}
