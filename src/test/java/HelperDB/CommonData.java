package HelperDB;

import com.github.javafaker.DateAndTime;
import com.github.javafaker.Faker;
import lombok.Getter;

import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;

@Getter
public class CommonData {

    Faker faker=new Faker();
    public static HashMap<String,String> patientsEmailGender;
    public static int [] result;

    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    //smtp.gmail.com  // 587/465
    private String email_type;
    private String stmp_server;
    private String smtp_port;
    private String smtp_username;
    private String smtp_password;
    private String ssl_tls;
    private String smtp_auth;
    private String is_active;
    private Timestamp created_at;

    HashMap<String, String> ambulancaCall;

    int id;
    int patient_id;
    int case_reference_id;
    int vehicle_id;
    String contact_no;
    String address;
    String vehicle_model;
    String driver;
    Timestamp date;
    String call_from;
    String call_to;
    int charge_category_id;
    int charge_id;
    float standard_charge;
    float tax_percentage;
    float amount;
    float net_amount;
    int transaction_id;
    String note;
    int generated_by;

    HashMap<String, String> appointment;

    int visit_details_id;
    Time time;
    String priority;
    String specialist;
    int doctor;
    //amount,
    String message;
    String appointment_status;
    String source;
    String is_opd;
    String is_ipd;
    int global_shift_id;
    int shift_id;
    int is_queue;
    String live_consult;

    //id, patient_id, case_reference_id, vehicle_id, contact_no, address, vehicle_model, driver,date ) \n" +
//            "call_from, call_to, charge_category_id, charge_id, standard_charge, tax_percentage, amount,  net_amount, transaction_id, note, generated_by, created_at
    public CommonData() {
        this.email_type = faker.internet().domainName();
        this.stmp_server = "smtp.gmail.com";
        this.smtp_port = "587/465";
        this.smtp_username = faker.internet().emailAddress();
        this.smtp_password = faker.internet().password();
        this.ssl_tls = "ssl";
        this.smtp_auth = "true";
        this.is_active = "yes";

        this.email_type = faker.internet().domainName();
        this.stmp_server = "smtp.gmail.com";
        this.smtp_port = "587/465";
        this.smtp_username = faker.internet().emailAddress();
        this.smtp_password = faker.internet().password();
        this.ssl_tls = "ssl";
        this.smtp_auth = "true";
        this.is_active = "yes";
        this.created_at = Timestamp.valueOf(LocalDateTime.now());

        this.id = 233;
        this.patient_id = 1;
        this.case_reference_id = 0;
        this.vehicle_id = 2;
        this.contact_no = faker.internet().domainName();
        this.address = "Main street";
        this.vehicle_model = "stationary";
        this.driver = "Smith";
        this.date = Timestamp.valueOf(LocalDateTime.now());
        this.call_from = "Deeneme";
        this.call_to = "parents";
        this.charge_category_id = 23;
        this.charge_id = 2;
        this.standard_charge = 1.0f;
        this.tax_percentage = 5.0f;
        this.amount = 500.0f;
        this.net_amount = 550.0f;
        this.transaction_id = 2;
        this.note = "Deneme";
        this.generated_by = 3;

        this.visit_details_id = 214;
        this.time = Time.valueOf(LocalTime.now());
        this.priority = "5";
        this.specialist = "1";
        this.doctor = 792;
        //amount,
        this.message = "T144_SQL";
        this.appointment_status = "approved";
        this.source = "Online";
        this.is_opd = "";
        this.is_ipd = "";
        this.global_shift_id = 1;
        this.shift_id = 52;
        this.is_queue = 0;
        this.live_consult = "no";


    }

    // US_026-US_027-US-028:
    public static HashMap <String,String> patientsKnown_allergies;
    public static HashMap <String, String> expectedData= new HashMap<>();

    public static HashMap <String,String> vehicles;
    public static HashMap <String, String> vehiclesExpectedData= new HashMap<>();

    public static HashMap <String,String> account_title;






}