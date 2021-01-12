/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    BEG = 258,
    PRINT = 259,
    SCAN = 260,
    COMMA = 261,
    OPEN = 262,
    CLOSE = 263,
    IF = 264,
    ELSE = 265,
    WHILE = 266,
    RETURN = 267,
    MAIN = 268,
    SEMI = 269,
    COPEN = 270,
    CCLOSE = 271,
    ADDR = 272,
    DO = 273,
    FOR = 274,
    QUOTE = 275,
    VAR = 276,
    NUM = 277,
    DATATYPE = 278,
    TYPE = 279,
    RELOP = 280,
    LOGOP = 281,
    BOOL = 282,
    MD = 283,
    AS = 284,
    Q = 285
  };
#endif
/* Tokens.  */
#define BEG 258
#define PRINT 259
#define SCAN 260
#define COMMA 261
#define OPEN 262
#define CLOSE 263
#define IF 264
#define ELSE 265
#define WHILE 266
#define RETURN 267
#define MAIN 268
#define SEMI 269
#define COPEN 270
#define CCLOSE 271
#define ADDR 272
#define DO 273
#define FOR 274
#define QUOTE 275
#define VAR 276
#define NUM 277
#define DATATYPE 278
#define TYPE 279
#define RELOP 280
#define LOGOP 281
#define BOOL 282
#define MD 283
#define AS 284
#define Q 285

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 54 "yaccfile.y"

char code[100];

#line 121 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
