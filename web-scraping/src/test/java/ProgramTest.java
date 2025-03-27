import application.Program;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.io.File;
import java.util.concurrent.TimeUnit;

public class ProgramTest {
    @Before
    public void webdriverSetup() {
        Program.setupDriver();
    }

    @After
    public void webdriverQuit() {
        Program.driver.quit();
    }

    @Test
    public void openWebdriverTest() {
        Program.driver.get("https://www.google.com");
    }

    @Test
    public void downloadFileTest() throws InterruptedException {
        Program.driver.get("https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos");
        Program.driver.findElement(By.xpath("/html/body/div[5]/div/div/div/div/div[2]/button[2]")).click(); // close cookies

        WebElement anexoI = Program.driver.findElement(By.xpath("//*[@id=\"cfec435d-6921-461f-b85a-b425bc3cb4a5\"]/div/ol/li[1]/a[1]"));
        anexoI.click();

        TimeUnit.SECONDS.sleep(20); // wait 20 seconds to complete download

        File outDir = new File(System.getProperty("user.dir") + "\\src\\output");
        assert outDir.exists();
        assert outDir.isDirectory();
        assert outDir.listFiles().length > 0;
    }

    @Test
    public void compressFilesTest() {
        Program.compressFiles(new File(System.getProperty("user.dir") + "\\src\\output.zip").toPath());
        File outDir = new File(System.getProperty("user.dir") + "\\src\\output.zip");
        assert outDir.exists();
    }

    @Test
    public void compressOutputFilesTest() {
        Program.compressFiles(new File(System.getProperty("user.dir") + "\\src\\output.zip").toPath(), Program.mapFilesToPath());
        File outDir = new File(System.getProperty("user.dir") + "\\src\\output.zip");
        assert outDir.exists();
    }

    @Test
    public void clearOutputDirTest() {
        Program.clearOutputDir();
        File outDir = new File(System.getProperty("user.dir") + "\\src\\output");
        assert outDir.exists();
        assert outDir.listFiles().length == 0;
    }
}
