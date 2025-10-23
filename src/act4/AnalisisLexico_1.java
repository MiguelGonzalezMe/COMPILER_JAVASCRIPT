/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package act4;

import act2.LexerPalabrasReservadasJS;
import static act2.Token.Type.*;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 *
 * @author DocentesUTJCCD
 */
public class AnalisisLexico_1 {
     public static void main(String[] args) {

        System.out.println("NOMBRES COMPLETOS ORDENADOS POR PRIMER APELLIDO \n");
        System.out.println("FREGOZO ARÉCHIGA JAASIEL");
        System.out.println("HERRERA CASTILLO KENIA GUADALUPE");
        System.out.println("GONZALEZ MENDOZA MIGUEL ÁNGEL");
        System.out.println();

        String test = "src/act2/pruebas_palabras_reservadas.txt";

        try (Reader reader = new FileReader(test)) {
            // Crear la instancia del lexer directamente
            LexerPalabrasReservadasJS lexer = new LexerPalabrasReservadasJS(reader);

            // Leer tokens y procesarlos
            act2.Token token;
            while ((token = lexer.yylex()) != null) {
                System.out.println("Token: " + token);
                System.out.println("");
            }
        } catch (IOException e) {
            System.err.println("Error al leer el archivo de prueba.");
            e.printStackTrace();
        }
        
        System.out.println("\n NOMBRES COMPLETOS ORDENADOS POR PRIMER APELLIDO");
        System.out.println("FREGOZO ARÉCHIGA JAASIEL");
        System.out.println("HERRERA CASTILLO KENIA GUADALUPE");
        System.out.println("GONZALEZ MENDOZA MIGUEL ÁNGEL");
        System.out.println();
    }

    
}