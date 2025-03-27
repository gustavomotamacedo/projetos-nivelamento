package application;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

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

    public static void compressFiles(Path outputFile, Path... files) {
        try (ZipOutputStream zipOutputStream = new ZipOutputStream(Files.newOutputStream(outputFile))) {
            for (Path file : files) {
                zipOutputStream.putNextEntry(new ZipEntry(file.getFileName().toString()));
                Files.copy(file, zipOutputStream);
                zipOutputStream.closeEntry();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static Path[] mapFilesToPath() {
        File downloadsDir = new File(System.getProperty("user.dir") + "\\src\\output");
        List<File> downloadFiles = Arrays.asList(downloadsDir.listFiles());
        Path[] pathsArray = downloadFiles.stream().map(file -> file.toPath()).toArray(Path[]::new);
        return pathsArray;
    }

    public static void main(String[] args) {
        setupDriver();

        try {
            driver.get("https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos");
            driver.findElement(By.xpath("/html/body/div[5]/div/div/div/div/div[2]/button[2]")).click(); // close cookies

            WebElement anexoI = driver.findElement(By.xpath("//*[@id=\"cfec435d-6921-461f-b85a-b425bc3cb4a5\"]/div/ol/li[1]/a[1]"));
            WebElement anexoII = driver.findElement(By.xpath("//*[@id=\"cfec435d-6921-461f-b85a-b425bc3cb4a5\"]/div/ol/li[2]/a"));

            anexoI.click();
            TimeUnit.SECONDS.sleep(2); // wait seconds to click in the second file
            anexoII.click();
            TimeUnit.SECONDS.sleep(30); // wait seconds to complete download

            File outputZipFile = new File(System.getProperty("user.dir") + "\\src\\output.zip");
            Path[] pathsArray = mapFilesToPath();

            compressFiles(outputZipFile.toPath(), pathsArray);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        driver.quit();
    }
}
