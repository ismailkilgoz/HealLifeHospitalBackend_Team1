package stepdefinitions.DB;

import HelperDB.CommonData;
import HelperDB.Organisation;
import Manage.Manage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.query;
import static HelperDB.Organisation.*;
import static org.junit.Assert.*;

public class DB_023_024_025 extends Manage {

    CommonData data=new CommonData();

    @Then("User creates Query for DB_US23")
    public void userCreatesQueryForDB_US23() throws SQLException {
        query=getUS023();
        resultSet=getStatement().executeQuery(query);
    }
    @And("Verifies that the returned informations for the data are correct")
    public void verifiesThatTheReturnedInformationsForTheDataAreCorrect() throws SQLException {
        List<Object> medicine_supplier_info = new ArrayList<>();
        while (resultSet.next()) {
            medicine_supplier_info.add(0,resultSet.getInt("id"));
            medicine_supplier_info.add(1,resultSet.getString("supplier"));
            medicine_supplier_info.add(2,resultSet.getString("contact"));
            medicine_supplier_info.add(3,resultSet.getString("supplier_person"));
            medicine_supplier_info.add(4,resultSet.getString("supplier_person_contact"));
            medicine_supplier_info.add(5,resultSet.getString("supplier_drug_licence"));
            medicine_supplier_info.add(6,resultSet.getString("address"));
            medicine_supplier_info.add(7,resultSet.getString("created_at"));

            System.out.println(medicine_supplier_info);
        }
        List<Object> exp_info_List = new ArrayList<>();
        exp_info_List = List.of(3, "VKS Pharmacy", "7546985214", "Vinay Shrivastava", "9754632587", "DFDR555--000", "Andheri, Mumbai", "2021-10-25 07:09:11");

        if(!medicine_supplier_info.isEmpty()){
            for (int i = 0; i <medicine_supplier_info.size() ; i++) {
                assertEquals(exp_info_List.get(i),medicine_supplier_info.get(i));
                System.err.println(medicine_supplier_info.get(i));
            }
        }else{
            assertFalse("Resultset is EMPTY", resultSet.next());
        }
    }
    @Then("User creates Query for multiple data {int} entry on the nurse_note table")
    public void userCreatesQueryForMultipleDataEntryOnTheNurse_noteTable(int count) throws SQLException {
        query=getUS024();
        preparedStatement = getPraperedStatement(query);
        nurse_notes = generateNN(count);
        int flag = 0;
        for (Organisation NurseNote: nurse_notes) {
            preparedStatement.setTimestamp(1,nurse_notes.get(flag).getDate());
            preparedStatement.setInt(2,nurse_notes.get(flag).getIpd_id());
            preparedStatement.setInt(3,nurse_notes.get(flag).getStaff_id());
            preparedStatement.setString(4,nurse_notes.get(flag).getNote());
            preparedStatement.setString(5,nurse_notes.get(flag).getComment());
            preparedStatement.setTimestamp(6,nurse_notes.get(flag).getUpdated_at());
            preparedStatement.addBatch();
            flag ++;

            if (flag == nurse_notes.size()){ CommonData.result = preparedStatement.executeBatch();}
        }
        System.err.println("Result Sayısı:" + CommonData.result.length);
    }
    @And("Verifies that the {int} datas added to the nurse_note table")
    public void verifiesThatTheDatasAddedToTheNurse_noteTable(int raw) {    assertEquals(raw, CommonData.result.length);
    }
    @Then("User creates Query for DB_US25")
    public void userCreatesQueryForDB_US() throws SQLException {
        query=getUS025();
        resultSet=getStatement().executeQuery(query);
    }
    @And("Verifies that the returned information for the patient_name, gender and email are correct")
    public void verifiesThatTheReturnedInformationForThePatient_nameGenderAndEmailAreCorrect() throws SQLException {
        List<Object> patient_info = new ArrayList<>();
        while (resultSet.next()) {
            patient_info.add(0,resultSet.getString("patient_name"));
            patient_info.add(1,resultSet.getString("gender"));
            patient_info.add(2,resultSet.getString("email"));

            System.out.println(patient_info);
        }
        List<Object> exp_patient_info_List = new ArrayList<>();
        exp_patient_info_List = List.of("Ajit Jain", "Male", "jain@jain.com");

        if(!patient_info.isEmpty()){
            for (int i = 0; i <patient_info.size() ; i++) {
                assertEquals(exp_patient_info_List.get(i),patient_info.get(i));
                System.err.println(patient_info.get(i));
            }
        }else{
            assertFalse("Resultset is EMPTY", resultSet.next());
        }
    }

}