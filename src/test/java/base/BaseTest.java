package base;

import com.github.javafaker.Faker;
import config_Requirements.ConfigLoader;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;
import utilities.API_Utilities.TestData;

import java.util.HashMap;

public abstract class BaseTest {

    public static ConfigLoader configLoader;
    public static JsonPath repJP;
    public static Response response;
    public static HashMap map;
    public static Faker faker;

    public static JSONObject requestBody;


    public BaseTest() {
        map = new HashMap<>();
        configLoader = new ConfigLoader();
        faker = new Faker(); // Faker nesnesi initialize edildi.
        requestBody = new JSONObject();



    }
}
