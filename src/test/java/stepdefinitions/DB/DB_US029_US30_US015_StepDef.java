package stepdefinitions.DB;

import HelperDB.CommonDataSeren;
import Manage.Manage_Seren_29_30_15;
import io.cucumber.java.en.Given;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.*;

public class DB_US029_US30_US015_StepDef extends Manage_Seren_29_30_15 {

    CommonDataSeren commonData=new CommonDataSeren();



    // US29

    @Given("I execute the query to get vehicle lists.")
    public void i_execute_the_query_to_get_vehicle_lists()  {


            query=getUS29();
            resultSet = getResultset(query);




    }
    @Given("Verify that both lists have the same vehicles at the same index.")
    public void verify_that_both_lists_have_the_same_vehicles_at_the_same_index() {
        List<Integer> manufactureYearIds = new ArrayList<>();
        List<Integer> createdYearIds = new ArrayList<>();

        try {
            while (resultSet.next()) {
                manufactureYearIds.add(resultSet.getInt("manufacture_year_id"));
                createdYearIds.add(resultSet.getInt("created_year_id"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Listelerin boyutları aynı
        assertEquals("List sizes are different!", manufactureYearIds.size(), createdYearIds.size());

        // Listelerdeki her bir elemanın aynı
        for (int i = 0; i < manufactureYearIds.size(); i++) {
            assertEquals("Mismatch at index " + i, manufactureYearIds.get(i), createdYearIds.get(i));
        }


    }

    // US30


    @Given("The visitors_book table contains data")
    public void the_visitors_book_table_contains_data() throws SQLException {
      query=getUS30();
      preparedStatement=getPraperedStatement(query);



    }
    @Given("I fetch the visitor's name with related_to {string} and purpose {string}.")
    public void i_fetch_the_visitor_s_name_with_related_to_and_purpose(String relatedTo, String purpose) throws SQLException {
        preparedStatement.setString(1, relatedTo );
        preparedStatement.setString(2, purpose );


    }
    @Given("The visitor's name should be {string}.")
    public void the_visitor_s_name_should_be(String expectedName) {


        try {
            // Sorguyu çalıştır
            resultSet = preparedStatement.executeQuery();

            // Sorgu sonucu kontrol et
            if (resultSet.next()) {
                // Sonuçtan alınan name değerini doğrula
                String actualName = resultSet.getString("name");
                assertEquals("Visitor name does not match!", expectedName, actualName);
            } else {
                // Sonuç bulunamazsa hata fırlat
               fail("No visitor found with the given related_to and purpose.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }





}
