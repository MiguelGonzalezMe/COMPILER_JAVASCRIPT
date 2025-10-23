/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package act2;

/**
 *
 * @author Alumnos
 */
public class Token {

    public enum Type {
        // TIPOS DE DATOS
        NUMBER,
        STRING,
        BOOLEAN,
        NULL,
        UNDEFINED,
        BIGINT,
        SYMBOL,

        // LITERALES
        BOOLEAN_LITERAL,
        NULL_LITERAL,

        // IDENTIFICADORES Y PALABRAS CLAVE
        IDENTIFIER,
        IF,
        ELSE,
        WHILE,
        FOR,
        FUNCTION,
        RETURN,
        LET,
        CONST,
        VAR,
        NEW,
        THIS,
        CLASS,
        EXTENDS,
        SUPER,
        IMPORT,
        EXPORT,
        DEFAULT,
        TRY,
        CATCH,
        FINALLY,
        THROW,
        TYPEOF,
        INSTANCEOF,
        DELETE,
        IN,
        VOID,

        // OPERADORES
        ASSIGN,
        EQ,
        NE,
        STRICT_EQ,
        STRICT_NE,
        LT,
        GT,
        LE,
        GE,
        AND,
        OR,
        NOT,
        PLUS,
        MINUS,
        MULT,
        DIV,

        //  PUNTUACION / SIMBOLOS
        LPAREN,     // (
        RPAREN,     // )
        LBRACE,     // {
        RBRACE,     // }
        LBRACKET,   // [
        RBRACKET,   // ]
        SEMICOLON,  // ;
        COMMA,      // ,
        DOT,        // .
        QUESTION,   // ?
        COLON,      // :

        // OTROS
        COMMENT,
        COMMENT_LINE,
        COMMENT_BLOCK,
        STRING_LITERAL,
        NUMBER_LITERAL,
        EOF
    }

    private final Type type;
    private final String value;
    private final int line;
    private final int column;

    public Token(Type type, String value, int line, int column){
    
       this.type = type;
       this.value = value;
       this.line = line;
       this.column = column;
    }

    @Override
    public String toString(){
     
     return "Token{" + "type= " + type + "\n, value= " + value + 
     "\n, line= " + line + "\n,column= " + column + "}";
    }

}
