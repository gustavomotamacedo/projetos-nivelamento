import org.apache.pdfbox.pdmodel.PDDocument;
import org.junit.Test;
import technology.tabula.extractors.SpreadsheetExtractionAlgorithm;

import java.io.File;
import java.io.IOException;

public class ProgramTest {
    @Test
    public void fileFoundTest() {
        assert new File(System.getProperty("user.dir") + "\\src\\input\\anexoI.pdf").exists();
    }

    @Test
    public void fileLoadTest() throws IOException {
        File file = new File(System.getProperty("user.dir") + "\\src\\input\\anexoI.pdf");
        PDDocument doc = PDDocument.load(file);
        assert doc.getNumberOfPages() > 0;
        doc.close();
    }
}
