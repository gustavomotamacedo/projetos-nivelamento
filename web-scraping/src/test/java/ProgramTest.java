import application.Program;
import org.junit.Before;
import org.junit.Test;

public class ProgramTest {
    @Before
    public void setUp() {
        Program.setupDriver();
    }

    @Test
    public void test() {
        Program.driver.get("https://www.google.com");
        Program.driver.quit();
    }
}
