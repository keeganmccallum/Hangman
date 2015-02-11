#ifndef GROUPFUNC_H
#define GROUPFUNC_H

char *wordSelect(int difficulty);

int validChar(char guess, char *correctWord, char *lettersAlreadyGuessed);

void displayWordSoFar(char *correctWord, char *lettersAlreadyGuessed);

int wordComplete(char *word, char *lettersAlreadyGuessed);

#endif
