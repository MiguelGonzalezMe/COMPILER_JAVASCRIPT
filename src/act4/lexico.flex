/*
    FREGOZO ARÉCHIGA JAASIEL
    HERRERA CASTILLO KENIA GUADALUPE
    GONZALEZ MENDOZA MIGUEL ÁNGEL
    JAVASCRIPT LEXER (CUP COMPATIBLE)
*/

package act4;
import java_cup.runtime.Symbol;
import static act4.sym.*;


%%

%public
%class LexicoJS
%unicode
%line
%column
%cup

%{
    private Symbol symbol(int type) {
    return new Symbol(type, yyline+1, yycolumn+1, null);
}

private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline+1, yycolumn+1, value);
}


%}

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

/* ===========================
   LITERALES
   =========================== */

{NUMBER}        { return symbol(NUMBER, yytext()); }
{STRING}        { return symbol(STRING_LITERAL, yytext()); }
{BOOLEAN}       { return symbol(BOOLEAN_LITERAL, yytext()); }
{NULL}          { return symbol(NULL_LITERAL, yytext()); }
{BIGINT}        { return symbol(BIGINT, yytext()); }

/* ===========================
   PALABRAS RESERVADAS
   =========================== */

"Symbol"        { return symbol(SYMBOL, yytext()); }
"if"            { return symbol(IF); }
"else"          { return symbol(ELSE); }
"while"         { return symbol(WHILE); }
"for"           { return symbol(FOR); }
"function"      { return symbol(FUNCTION); }
"return"        { return symbol(RETURN); }
"true"|"false"  { return symbol(BOOLEAN_LITERAL, yytext()); }
"null"          { return symbol(NULL_LITERAL, yytext()); }
"let"           { return symbol(LET); }
"const"         { return symbol(CONST); }
"new"           { return symbol(NEW); }
"this"          { return symbol(THIS); }
"class"         { return symbol(CLASS); }
"extends"       { return symbol(EXTENDS); }
"super"         { return symbol(SUPER); }
"import"        { return symbol(IMPORT); }
"export"        { return symbol(EXPORT); }
"default"       { return symbol(DEFAULT); }
"try"           { return symbol(TRY); }
"catch"         { return symbol(CATCH); }
"finally"       { return symbol(FINALLY); }
"throw"         { return symbol(THROW); }
"typeof"        { return symbol(TYPEOF); }
"instanceof"    { return symbol(INSTANCEOF); }
"delete"        { return symbol(DELETE); }
"in"            { return symbol(IN); }
"void"          { return symbol(VOID); }
"var"           { return symbol(VAR); }

/* ===========================
   OPERADORES RELACIONALES Y LÓGICOS
   =========================== */

"==="       { return symbol(STRICT_EQ); }
"!=="       { return symbol(STRICT_NE); }
"=="        { return symbol(EQ); }
"!="        { return symbol(NE); }
"<="        { return symbol(LE); }
">="        { return symbol(GE); }
"<"         { return symbol(LT); }
">"         { return symbol(GT); }
"&&"        { return symbol(AND); }
"||"        { return symbol(OR); }
"!"         { return symbol(NOT); }

/* ===========================
   OPERADORES ARITMÉTICOS Y ASIGNACIÓN
   =========================== */

"+"         { return symbol(PLUS); }
"-"         { return symbol(MINUS); }
"*"         { return symbol(MULT); }
"/"         { return symbol(DIV); }
"="         { return symbol(ASSIGN); }

/* ===========================
   DELIMITADORES Y PUNTUACIÓN
   =========================== */

"("         { return symbol(LPAREN); }
")"         { return symbol(RPAREN); }
"{"         { return symbol(LBRACE); }
"}"         { return symbol(RBRACE); }
"["         { return symbol(LBRACKET); }
"]"         { return symbol(RBRACKET); }
";"         { return symbol(SEMICOLON); }
","         { return symbol(COMMA); }
"."         { return symbol(DOT); }
"?"         { return symbol(QUESTION); }
":"         { return symbol(COLON); }

/* ===========================
   COMENTARIOS
   =========================== */

{COMMENT_LINE}  { return symbol(COMMENT_LINE, yytext()); }
{COMMENT_BLOCK} { return symbol(COMMENT_BLOCK, yytext()); }

/* ===========================
   IDENTIFICADORES Y ERRORES
   =========================== */

{IDENTIFIER} {
    System.out.println("Linea:"+(yyline+1)+", Columna:"+(yycolumn+1)+" -> IDENTIFIER: " + yytext());
    return symbol(IDENTIFIER, yytext());
}

[ \t\n\r]+      { /* Ignorar espacios en blanco */ }

. {
    System.out.println("Linea:"+(yyline+1)+", Columna:"+(yycolumn+1)+" -> ERROR Token no reconocido: " + yytext());
    return symbol(ERROR, yytext());
}


