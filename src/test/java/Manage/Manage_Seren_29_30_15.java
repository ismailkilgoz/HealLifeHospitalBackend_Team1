package Manage;
import lombok.Getter;

@Getter
public class Manage_Seren_29_30_15 {

   // id, vehicle_no, vehicle_model, manufacture_year, vehicle_type, driver_name, driver_licence, driver_contact, note, created_at


   private String US29="WITH manufactureYearOrdered AS(\n" +
            "SELECT id, vehicle_model, ROW_NUMBER() OVER(ORDER BY manufacture_year ASC) AS row_num_year\n" +
            "FROM vehicles\n" +
            "),\n" +
            "CreatedAtOrdered AS(\n" +
            "SELECT id, vehicle_model, ROW_NUMBER() OVER ( ORDER BY created_at ASC) AS row_num_created\n" +
            "FROM vehicles\n" +
            ")\n" +
            "SELECT\n" +
            "myo.id AS manufacture_year_id,\n" +
            "cao.id AS created_year_id,\n" +
            "myo.row_num_year,\n" +
            "cao.row_num_created\n" +
            "FROM \n" +
            "ManufactureYearOrdered myo\n" +
            "JOIN \n" +
            "CreatedAtOrdered cao\n" +
            "ON myo.row_num_year = cao.row_num_created\n" +
            "WHERE myo.id =cao.id;";


   private String US30="";

   private String US35="INSERT INTO email_config (email_type, smtp_server, smtp_port, smtp_username, smtp_password) \n" +
            "VALUES (?, ?, ?, ?, SHA2(?, 256));";




}
