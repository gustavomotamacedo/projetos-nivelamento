import org.junit.Test;

import java.io.File;

public class ProgramTest {
    @Test
    public void fileFoundTest() {
        assert new File(System.getProperty("user.dir") + "\\src\\input\\anexoI.pdf").exists();
    }
}
