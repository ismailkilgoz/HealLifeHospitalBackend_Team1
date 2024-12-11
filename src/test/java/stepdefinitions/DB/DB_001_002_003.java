package stepdefinitions.DB;

import HelperDB.CommonData;
import Manage.Manage_001_002_003;
import io.cucumber.java.en.Given;

import java.sql.SQLException;
import java.util.HashMap;

import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.resultSet;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

public class DB_001_002_003 extends Manage_001_002_003 {
    CommonData data=new CommonData();




    @Given("I insert the new data to the ambulance_call")
    public void i_insert_the_new_data_to_the_ambulance_call() throws SQLException {
        query=getUS001();
        preparedStatement=getPraperedStatement(query);

        preparedStatement.setInt(1,data.getId());
        preparedStatement.setInt(2,data.getPatient_id());
        preparedStatement.setInt(3,data.getCase_reference_id());
        preparedStatement.setInt(4,data.getVehicle_id());
        preparedStatement.setString(5,data.getContact_no());
        preparedStatement.setString(6,data.getAddress());
        preparedStatement.setString(7,data.getVehicle_model());
        preparedStatement.setString(8,data.getDriver());
        preparedStatement.setTimestamp(9,data.getDate());
        preparedStatement.setString(10,data.getCall_from());
        preparedStatement.setString(11,data.getCall_to());
        preparedStatement.setInt(12,data.getCharge_category_id());
        preparedStatement.setInt(13,data.getCharge_id());
        preparedStatement.setFloat(14,data.getStandard_charge());
        preparedStatement.setFloat(15,data.getTax_percentage());
        preparedStatement.setFloat(16,data.getAmount());
        preparedStatement.setFloat(17,data.getNet_amount());
        preparedStatement.setInt(18,data.getTransaction_id());
        preparedStatement.setString(19,data.getNote());
        preparedStatement.setInt(20,data.getGenerated_by());

    }


    @Given("Verify that {int} added to the table.")
    public void verify_that_added_to_the_table(int row) {
        int rowCount=0;
        try {
            rowCount= preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        assertEquals(row,rowCount);

    }
    @Given("Verify that 1 added to the table ")
    public void verify_that_added_to_the_table() throws SQLException {
        query=getUS001();
        resultSet=getStatement().executeQuery(query);
    }
        /**   US25      */

    @Given("Query prepared into the ambulance call table")
    public void query_prepared_into_the_patients_table() throws SQLException {
        query=getUS001();
        resultSet=getStatement().executeQuery(query);
    }

}
