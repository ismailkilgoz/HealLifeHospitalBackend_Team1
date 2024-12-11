package stepdefinitions.DB;

import HelperDB.CommonData;
import Manage.Manage_001_002_003;
import io.cucumber.java.en.Given;
import org.junit.jupiter.api.Assertions;

import java.sql.*;
import java.util.HashMap;

import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

public class DB_001_002_003 extends Manage_001_002_003 {
    CommonData data=new CommonData();


    Connection connection;
    Statement statement;
    ResultSet resultSet;
    PreparedStatement preparedStatement1;
    String query;
    int intResult;
    int silinecekID;

    Manage_001_002_003 queryManage = new Manage_001_002_003();


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
        query=getQuery02();
        preparedStatement1=getPraperedStatement(query);

        preparedStatement1.setInt(1,data.getId());
        preparedStatement1.setInt(2,data.getPatient_id());
        preparedStatement1.setNull(3, java.sql.Types.INTEGER);
        preparedStatement1.setInt(4,data.getVisit_details_id());
        preparedStatement1.setTimestamp(5,data.getDate());
        preparedStatement1.setTime(6,data.getTime());
        preparedStatement1.setString(7,data.getPriority());
        preparedStatement1.setString(8,data.getSpecialist());
        preparedStatement1.setInt(9,data.getDoctor());
        preparedStatement1.setString(10,"");
        preparedStatement1.setString(11,data.getMessage());
        preparedStatement1.setString(12,data.getAppointment_status());
        preparedStatement1.setString(13,data.getSource());
        preparedStatement1.setString(14,data.getIs_opd());
        preparedStatement1.setString(15,data.getIs_ipd());
        preparedStatement1.setInt(16,data.getGlobal_shift_id());
        preparedStatement1.setInt(17,data.getShift_id());
        preparedStatement1.setInt(18,data.getIs_queue());
        preparedStatement1.setString(19,data.getLive_consult());
        preparedStatement1.setTimestamp(20,data.getCreated_at());

        intResult = preparedStatement1.executeUpdate();
    }

    @Given("SQL Query01 is prepared and is run")
    public void sql_query01_is_prepared_and_is_run() throws SQLException {
        query = queryManage.getQuery01();
        resultSet = getStatement().executeQuery(query);

    }
    @Given("SQL Query01 results wil be tested")
    public void sql_query01_results_wil_be_tested() throws SQLException {

        int expectedData = 2;
        resultSet.last();
        int actualData = resultSet.getRow();
        System.out.println(" Actual Data = " + actualData);

        assertEquals(actualData,expectedData);
    }

    @Given("Verify result is returned US02")
    public void verify_result_is_returned_us02() throws SQLException {

        int expectedResult = 1;
        assertEquals(intResult,expectedResult);

    }


    @Given("SQL Query03 is prepared and is run")
    public void sql_query03_is_prepared_and_is_run() throws SQLException {
        query = queryManage.getQuery03();
        resultSet = getStatement().executeQuery(query);

    }
    @Given("SQL Query03 results wil be tested")
    public void sql_query03_results_wil_be_tested() throws SQLException {
        String expectedData = "yes";
        resultSet.next();
        String actualData = resultSet.getString("live_consult");

        System.out.println("Actual Data : " + actualData);

        assertEquals(actualData,expectedData);

    }

}
