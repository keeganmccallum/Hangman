#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include "stdafx.h"
#include "hngDisplay.h"
#include "wordbank.h"

#include <stdlib.h>
#include <string.h>


int wordComplete(char *word) {
	if (strchr(word, '-')) {
		return 0;
	}
	else {
		return 1;
	}
}

int _tmain(int argc, _TCHAR* argv[])
{
	hngWelcomeMessage();
	int gameStatus = newGameOrExit();
	
	if (gameStatus == 0) {
		exit(1);
	}

	int numLives = MAX_LIVES;
	
	const char *word = selectWord();
	int wordSize = strlen(word);
	char *guessString = (char*) malloc(sizeof(char) * wordSize);
	guessString[wordSize] = 0;
	memset(guessString, '-', wordSize);

	char guess;

	while (numLives > 0 && !wordComplete(guessString)) { 
		
		hngDrawMan(numLives);
		printf("           ");
		printf(guessString);
		printf("\n");
		printf("Please make a guess: ");
		
		//Flush the input buffer
		fseek(stdin, 0, SEEK_END);
		guess = getchar();

		const char *letterIndex = strchr(word, guess);
		if (letterIndex == NULL) {
			printf("Oops! That letter was not in the word\n");
			numLives--;
		}
		else {
			int index = letterIndex - word; //Tricky, letterIndex points to first occurence of guess in word, pointer arithmetic to get index.
			guessString[index] = guess;
		}
	}

	if (wordComplete(guessString)) {
		printf("You won!\n");
	}
	else {
		printf("You Lost, try again.\n");
	}
	getchar();

	return 0;
}

