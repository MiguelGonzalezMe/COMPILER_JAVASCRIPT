package act4;

import java.io.File;
import java.io.IOException;

public class GeneradorSintactico {
    public static void main(String[] args) throws IOException, Exception {
        
        
        String[] parametros = {"-destdir", "src\\act4","-parser", "ParserJava", 
            "-progress", "src\\act4\\sintacticoJS.cup"};
        java_cup.Main.main(parametros);
        
    }
    
   
}
