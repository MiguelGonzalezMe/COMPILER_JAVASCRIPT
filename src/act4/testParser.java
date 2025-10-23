package act4;

import java.io.FileReader;

public class testParser {
    public static void main(String[] args) throws Exception {
        FileReader fr = new FileReader("src/act4/test.js"); // your test file
        LexicoJS lexer = new  LexicoJS(fr);               // JFlex-generated scanner
        ParserJava parser = new ParserJava(lexer);         // CUP-generated parser
        parser.parse();
        System.out.println("Parse finished without errors!");
    }
}
