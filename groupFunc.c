#include "groupFunc.h"
#include <stdio.h>
#include <stdlib.h>

int validChar (char guess, char *correctWord, char *lettersAlreadyGuessed) {
	int i;
	i = 0;
	int result;
	while (i < 27) {
		//if player's guess has been guessed before, return "false"
		if (lettersAlreadyGuessed[i] == guess) {
			return 0;
		}
		else {
			//if player's guess hasn't been guessed before, add it to lettersAlreadyGuessed
			if (lettersAlreadyGuessed[i] == '\0') {
				lettersAlreadyGuessed[i] = guess;
				break;
			}
			else {
				i++;
			}
		}
	}
	int j;
	j = 0;
	// if player's guess is in the correctWord, return "true", else return "false"
	while (correctWord[j] != '\0') {
		if (guess == correctWord[j]) {
			result = 1;
			break;
		}
		else {
			result = 0;
			j++;
		}
	}
	return result;
}

char *wordSelect(int difficulty){
  
  static char easy[] = "easy";
  static char norm[] = "normal";
  static char hard[] = "hard";
  
    if (difficulty == 1) {
	return easy;
    } 
    else if (difficulty == 2) {
	return norm;
    } 
    else {
	return hard;
    }
  
}

void displayWordSoFar(char *correctWord, char *lettersAlreadyGuessed) {
	int i = 0;
	while (correctWord[i] != '\0') {
		int j = 0;
		int match = 0;
		char printChar;
		while (lettersAlreadyGuessed[j] != '\0') {
			if (correctWord[i] == lettersAlreadyGuessed[j]) {
				match = 1;
			}
			j++;
		}
		if (match) {
			printChar = correctWord[i];
		} else {
			printChar = '-';
		}
		printf("%c ", printChar);
		i++;
	}
	printf("\n");
}

int wordComplete(char *word, char *lettersAlreadyGuessed) {
	int complete = 1;
	int i = 0;
	while (word[i] != '\0') {
		int inGuess = 0;
		int j = 0;
		while (lettersAlreadyGuessed[j] != '\0') {
			if (word[i] == lettersAlreadyGuessed[j]) {
				inGuess = 1;
			}
		j++;
		}
		if (!inGuess) {
			return 0;
		}
	i++;
	}
	return 1;
}
