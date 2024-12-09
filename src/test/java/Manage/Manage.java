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
}