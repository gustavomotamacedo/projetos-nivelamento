package application;

import org.apache.pdfbox.pdmodel.PDDocument;
import technology.tabula.*;
import technology.tabula.extractors.SpreadsheetExtractionAlgorithm;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class Program {

    public static void compressZIP(Path outputFile, Path... filesToZip) {
        try (ZipOutputStream zipOutputStream = new ZipOutputStream(Files.newOutputStream(outputFile))) {
            for(Path file : filesToZip) {
                ZipEntry zipEntry = new ZipEntry(file.getFileName().toString());
                zipOutputStream.putNextEntry(zipEntry);
                Files.copy(file, zipOutputStream);
            }
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) throws FileNotFoundException {
        try {
            InputStream in = new FileInputStream(System.getProperty("user.dir") + "\\src\\input\\anexoI.pdf");
            new File(System.getProperty("user.dir") + "\\src\\output\\anexoI.csv");
            FileWriter outCsv = new FileWriter(System.getProperty("user.dir") + "\\src\\output\\anexoI.csv");
            PrintWriter outCsvPrintWriter = new PrintWriter(outCsv);
            try (PDDocument document = PDDocument.load(in)) {
                SpreadsheetExtractionAlgorithm sea = new SpreadsheetExtractionAlgorithm();
                PageIterator pi = new ObjectExtractor(document).extract();

                pi.next();
                pi.next();

                while (pi.hasNext()) {
                    Page page = pi.next();
                    List<Table> table = sea.extract(page);

                    // iterate over the tables of the page
                    for(Table tables: table) {
                        List<List<RectangularTextContainer>> rows = tables.getRows();
                        // iterate over the rows of the table
                        for (List<RectangularTextContainer> cells : rows) {
                            // print all column-cells of the row plus linefeed
                            for (RectangularTextContainer content : cells) {
                                // Note: Cell.getText() uses \r to concat text chunks
                                String text = content.getText().replace("\r", " ");
                                text = text.replaceAll("(?i)\\bOD\\b", "Seg. Odontológica");
                                text = text.replaceAll("(?i)\\bAMB\\b", "Seg. Ambulatorial");
                                outCsvPrintWriter.print(text + ",");
                                System.out.print(text + ",");
                            }
                            outCsvPrintWriter.println();
                            System.out.println();
                        }
                    }
                }
                outCsvPrintWriter.close();
                System.out.println("PDF loaded");
            }
            compressZIP(new File(System.getProperty("user.dir") + "\\src\\Teste_GustavoMotaMacedo.zip").toPath(),
                    new Path[] {new File(System.getProperty("user.dir") + "\\src\\output\\anexoI.csv").toPath()});
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
