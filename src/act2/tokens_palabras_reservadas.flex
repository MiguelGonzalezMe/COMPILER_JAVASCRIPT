/*
    FREGOZO ARÉCHIGA JAASIEL
    HERRERA CASTILLO KENIA GUADALUPE
    GONZALEZ MENDOZA MIGUEL ÁNGEL
    JAVASCRIPT
*/

package act2;

import static act2.Token.Type.*;

%%


%public
%class LexerPalabrasReservadasJS
%unicode
%line
%column
%type Token

/* ========== Macros ========== */

/* IDENTIFICADOR */
IDENTIFIER = [_a-zA-Z][_a-zA-Z0-9]*

/* NUMEROS */
INT             = [0-9]+
FLOAT           = [0-9]+"."[0-9]+
NUMBER          = ({FLOAT})|({INT})

/* STRINGS */
STRING          = \"([^\"\\]|\\.)*\" | \'([^\'\\]|\\.)*\'

/* BOOLEAN */
BOOLEAN         = "true" | "false"

/* NULL */
NULL            = "null"

/* BIGINT */
BIGINT          = {INT}"n"

/* COMENTARIOS */
COMMENT_LINE    = "//".*

/* COMENTARIO MULTILINEA */
COMMENT_BLOCK   = "/*"([^*]|\*+[^*/])*\*+"/"

%%


/* PALABRAS RESERVADAS */

/* TIPOS DE DATOS */
{NUMBER} {
    return new Token(NUMBER, yytext(), (yyline+1), (yycolumn+1));
}

{STRING} {
    return new Token(STRING_LITERAL, yytext(), (yyline+1), (yycolumn+1));
}

{BOOLEAN} {
    return new Token(BOOLEAN_LITERAL, yytext(), (yyline+1), (yycolumn+1));
}

{NULL} {
    return new Token(NULL_LITERAL, yytext(), (yyline+1), (yycolumn+1));
}

{BIGINT} {
    return new Token(BIGINT, yytext(), (yyline+1), (yycolumn+1));
}
"Symbol"        { return new Token(SYMBOL, yytext(), (yyline+1), (yycolumn+1)); }
"if"            { return new Token(IF, yytext(), (yyline+1), (yycolumn+1)); }
"else"          { return new Token(ELSE, yytext(), (yyline+1), (yycolumn+1)); }
"while"         { return new Token(WHILE, yytext(), (yyline+1), (yycolumn+1)); }
"for"           { return new Token(FOR, yytext(), (yyline+1), (yycolumn+1)); }
"function"      { return new Token(FUNCTION, yytext(), (yyline+1), (yycolumn+1)); }
"return"        { return new Token(RETURN, yytext(), (yyline+1), (yycolumn+1)); }
"true"|"false"  { return new Token(BOOLEAN_LITERAL, yytext(), (yyline+1), (yycolumn+1)); }
"null"          { return new Token(NULL_LITERAL, yytext(), (yyline+1), (yycolumn+1)); }
"let"           { return new Token(LET, yytext(), (yyline+1), (yycolumn+1)); }
"const"         { return new Token(CONST, yytext(), (yyline+1), (yycolumn+1)); }
"new"           { return new Token(NEW, yytext(), (yyline+1), (yycolumn+1)); }
"this"          { return new Token(THIS, yytext(), (yyline+1), (yycolumn+1)); }
"class"         { return new Token(CLASS, yytext(), (yyline+1), (yycolumn+1)); }
"extends"       { return new Token(EXTENDS, yytext(), (yyline+1), (yycolumn+1)); }
"super"         { return new Token(SUPER, yytext(), (yyline+1), (yycolumn+1)); }
"import"        { return new Token(IMPORT, yytext(), (yyline+1), (yycolumn+1)); }
"export"        { return new Token(EXPORT, yytext(), (yyline+1), (yycolumn+1)); }
"default"       { return new Token(DEFAULT, yytext(), (yyline+1), (yycolumn+1)); }
"try"           { return new Token(TRY, yytext(), (yyline+1), (yycolumn+1)); }
"let"           { return new Token(LET, yytext(), (yyline+1), (yycolumn+1)); }
"catch"         { return new Token(CATCH, yytext(), (yyline+1), (yycolumn+1)); }
"finally"       { return new Token(FINALLY, yytext(), (yyline+1), (yycolumn+1)); }
"throw"         { return new Token(THROW, yytext(), (yyline+1), (yycolumn+1)); }
"typeof"        { return new Token(TYPEOF, yytext(), (yyline+1), (yycolumn+1)); }
"instanceof"    { return new Token(INSTANCEOF, yytext(), (yyline+1), (yycolumn+1)); }
"delete"        { return new Token(DELETE, yytext(), (yyline+1), (yycolumn+1)); }
"in"            { return new Token(IN, yytext(), (yyline+1), (yycolumn+1)); }
"void"          { return new Token(VOID, yytext(), (yyline+1), (yycolumn+1)); }
"var"           { return new Token(VAR, yytext(), (yyline+1), (yycolumn+1)); }

/* ===========================
   OPERATORS AND SYMBOLS
   =========================== */

"==="       { return new Token(STRICT_EQ, yytext(), (yyline+1), (yycolumn+1)); }
"!=="       { return new Token(STRICT_NE, yytext(), (yyline+1), (yycolumn+1)); }
"=="        { return new Token(EQ, yytext(), (yyline+1), (yycolumn+1)); }
"!="        { return new Token(NE, yytext(), (yyline+1), (yycolumn+1)); }
"<="        { return new Token(LE, yytext(), (yyline+1), (yycolumn+1)); }
">="        { return new Token(GE, yytext(), (yyline+1), (yycolumn+1)); }
"<"         { return new Token(LT, yytext(), (yyline+1), (yycolumn+1)); }
">"         { return new Token(GT, yytext(), (yyline+1), (yycolumn+1)); }
"&&"        { return new Token(AND, yytext(), (yyline+1), (yycolumn+1)); }
"||"        { return new Token(OR, yytext(), (yyline+1), (yycolumn+1)); }
"!"         { return new Token(NOT, yytext(), (yyline+1), (yycolumn+1)); }
"+"         { return new Token(PLUS, yytext(), (yyline+1), (yycolumn+1)); }
"-"         { return new Token(MINUS, yytext(), (yyline+1), (yycolumn+1)); }
"*"         { return new Token(MULT, yytext(), (yyline+1), (yycolumn+1)); }
"/"         { return new Token(DIV, yytext(), (yyline+1), (yycolumn+1)); }
"="         { return new Token(ASSIGN, yytext(), (yyline+1), (yycolumn+1)); }
"("         { return new Token(LPAREN, yytext(), (yyline+1), (yycolumn+1)); }
")"         { return new Token(RPAREN, yytext(), (yyline+1), (yycolumn+1)); }
"{"         { return new Token(LBRACE, yytext(), (yyline+1), (yycolumn+1)); }
"}"         { return new Token(RBRACE, yytext(), (yyline+1), (yycolumn+1)); }
"["         { return new Token(LBRACKET, yytext(), (yyline+1), (yycolumn+1)); }
"]"         { return new Token(RBRACKET, yytext(), (yyline+1), (yycolumn+1)); }
";"         { return new Token(SEMICOLON, yytext(), (yyline+1), (yycolumn+1)); }
","         { return new Token(COMMA, yytext(), (yyline+1), (yycolumn+1)); }
"."         { return new Token(DOT, yytext(), (yyline+1), (yycolumn+1)); }
"?"         { return new Token(QUESTION, yytext(), (yyline+1), (yycolumn+1)); }
":"         { return new Token(COLON, yytext(), (yyline+1), (yycolumn+1)); }


{COMMENT_LINE} {
return new Token(COMMENT_LINE, yytext(), (yyline+1), (yycolumn+1));
}
{COMMENT_BLOCK} {
return new Token(COMMENT_BLOCK, yytext(), (yyline+1), (yycolumn+1));
}


{IDENTIFIER} {
    System.out.print("Linea:" + (yyline + 1) + ", Columna:" + (yycolumn + 1) + "\t");
    System.out.println(yytext() + " -> IDENTIFIER");
    return new Token(IDENTIFIER, yytext(), (yyline + 1), (yycolumn + 1));
}

[ \t\n\r]+  { /* Ignorar espacios en blanco */ }

.           { 
                System.out.print("Linea:"+(yyline+1)+", Columna:"+(yycolumn+1)+"\t");
                System.out.println(yytext()+" -> ERROR Token no reconocido");                 
            }

