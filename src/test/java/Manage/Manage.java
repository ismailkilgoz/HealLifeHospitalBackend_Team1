package Manage;

import lombok.Getter;

@Getter
public class Manage {
    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    String US35="Insert Into u201212290_heallifeqa.email_config (email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at) \n" +
            "Values (?,?,?,?,SHA2(?,256),?,?,?,?)" ;
    String US25="Select gender,email From  u201212290_heallifeqa.patients Where patient_name LIKE '%Jain%';";

    String US07="SELECT * FROM u201212290_heallifeqa.bed WHERE created_at = '2023-05-04 06:41:17';";
    String US08="SELECT * FROM u201212290_heallifeqa.bed  WHERE bed_group_id = 4 AND is_active = 'no';";
    String US09="SELECT * FROM u201212290_heallifeqa.birth_report WHERE weight >= 2.5;";




    @Getter
    String US31 = "SELECT * FROM u201212290_heallifeqa.consultant_register WHERE instruction AND cons_doctor;";


    String US32 = "SELECT count(*) AS row_count  FROM u201212290_heallifeqa.consultant_register" +
                        "WHERE created_at BETWEEN '2024-11-01' AND '2024-11-31';";


    String US33 = "SELECT s.name, s.surname, cr.instruction from staff s " +
            "join consultant_register cr on cr.cons_doctor = s.id " +
            "join ipd_details id on id.cons_doctor = s.id and cr.cons_doctor =id.cons_doctor";

    String US033 =  "SELECT cr.instruction, ipd.ipd_registration_id, s.staff_name AS doctor_name " +
            "FROM consultant_register cr " +
            "JOIN ipd_details ipd ON cr.ipd_id = ipd.ipd_id " +
            "JOIN staff s ON cr.cons_doctor = s.staff_id";
}