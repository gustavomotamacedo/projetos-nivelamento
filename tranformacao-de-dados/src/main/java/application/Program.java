package application;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

public class Program {

    public static void main(String[] args) throws FileNotFoundException {
        try {
            InputStream in = new FileInputStream(System.getProperty("user.dir") + "\\src\\input\\anexoI.pdf");
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
