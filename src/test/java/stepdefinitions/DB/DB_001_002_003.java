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

    @Given("Database connection established")
    public void database_connection_established() {
        createConnection();
    }
    @Given("Database closed")
    public void database_closed() {
        closeConnection();
    }

    @Given("I insert the new data to the email_config table")
    public void i_insert_the_new_data_to_the_email_config_table() throws SQLException {
        query=getUS35();
        preparedStatement=getPraperedStatement(query);
        //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
        preparedStatement.setString(1,data.getEmail_type());
        preparedStatement.setString(2,data.getStmp_server());
        preparedStatement.setString(3,data.getSmtp_port());
        preparedStatement.setString(4,data.getSmtp_username());
        preparedStatement.setString(5,data.getSmtp_password());
        preparedStatement.setString(6,data.getSsl_tls());
        preparedStatement.setString(7,data.getSmtp_auth());
        preparedStatement.setString(8,data.getIs_active());
        preparedStatement.setTimestamp(9,data.getCreated_at());

    }

    @Given("I insert the new data to the ambulance_call")
    public void ı_insert_the_new_data_to_the_ambulance_call() throws SQLException {
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


    @Given("Verify that {int} added to the table")
    public void verify_that_added_to_the_table(int row) {
        int rowCount=0;
        try {
            rowCount= preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        assertEquals(row,rowCount);

    }
    @Given("Verify that {int} added to the table .")
    public void verify_that_added_to_the_table(Integer int1) throws SQLException {
        query=getUS001();
        resultSet=getStatement().executeQuery(query);
    }
        /**   US25      */

    @Given("Query prepared into the patients table")
    public void query_prepared_into_the_patients_table() throws SQLException {
        query=getUS001();
        resultSet=getStatement().executeQuery(query);
    }
    @Given("Verify result is returned")
    public void verify_result_is_returned() throws SQLException {
        data.patientsEmailGender =new HashMap<>();
        while (resultSet.next()) {
            data.patientsEmailGender.put(resultSet.getString("gender"),resultSet.getString("email"));

        }
        if(!data.patientsEmailGender.isEmpty()){
            for (int i = 0; i <data.patientsEmailGender.size() ; i++) {
                // buraya expected Liste karşılaşması yazılır.
                System.err.println( data.patientsEmailGender.get(i));
            }
        }else{
            assertFalse("Resultset is EMPTY", resultSet.next());
        }
    }

}
