#include "hngDisplay.h"
#include "groupFunc.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main() {
	hngWelcomeMessage();
	int gameStatus = newGameOrExit();

	if (gameStatus == 0) {
		exit(1);
	}

	int difficulty = getDifficulty();

	int numLives = MAX_LIVES;
	
	const int LETTERS_IN_ALPHABET = 26;
	char lettersAlreadyGuessed[LETTERS_IN_ALPHABET];
	int i;
	for (i = 0; i < LETTERS_IN_ALPHABET; i++) {
		lettersAlreadyGuessed[i] = 0;
	}

	char *word = wordSelect(difficulty);
	char guess;

	while (numLives > 0 && !wordComplete(word, lettersAlreadyGuessed)) { 
		
		hngDrawMan(numLives);
		printf("Please make a guess: ");
		displayWordSoFar(word, lettersAlreadyGuessed);	
		
		//Flush the input buffer
		char c;
		while ((c = getchar()) != '\n' && c != EOF);
		guess = getchar();

		if (!validChar(guess, word, lettersAlreadyGuessed)) {
			numLives--;
		}
	}

	hngDrawMan(numLives);
	displayWordSoFar(word, lettersAlreadyGuessed);
	if (wordComplete(word, lettersAlreadyGuessed)) {
		printf("You won!\n");
	}
	else {
		printf("You Lost, try again.\n");
	}

	return 0;
}

