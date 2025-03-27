package application;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.util.HashMap;
import java.util.Map;

public class Program {

    public static WebDriver driver;

    private static Map<String, Object> setupChromeOptions() {
        Map<String, Object> prefs = new HashMap<>();
        prefs.put("download.prompt_for_download", false);
        prefs.put("download.default_directory", System.getProperty("user.dir") + "\\src\\output");
        prefs.put("plugins.always_open_pdf_externally", true);
        return prefs;
    }

    public static void setupDriver() {
        System.setProperty("webdriver.chrome.driver", "C:\\libs\\chromedriver-win64\\chromedriver.exe");

        ChromeOptions options = new ChromeOptions();
        options.setExperimentalOption("prefs", setupChromeOptions());;

        driver = new ChromeDriver(options);
    }

    public static void main(String[] args) {
    }
}
