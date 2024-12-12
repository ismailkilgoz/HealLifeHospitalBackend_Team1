package HelperDB;

import com.github.javafaker.Faker;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;

@Getter
public class CommonDataSeren   {


    Faker faker=new Faker();
// US15 Consultant Register Table
    //ipd_id, date, ins_date, instruction, cons_doctor, created_at
    //32, now() , '2024-11-17' , 'DataBAseTest ', 780, now()
    public static HashMap<String, Object> consultantRegisterNewData;

    private int ipd_id;
    private LocalDateTime date;
    private LocalDateTime ins_date;
    private String instruction;
    private int cons_doctor;
    private LocalDateTime created_at;

    public CommonDataSeren() {

        this.ipd_id = 1258;
        this.date =  LocalDateTime.now();
        this.ins_date = LocalDateTime.now();
        this.instruction = faker.expression("deneme");
        this.cons_doctor = faker.number().numberBetween(1,1000);
        this.created_at = LocalDateTime.of(2020,12,14,12,07);
    }
}
