#include <stdio.h>
#include <stdlib.h>

char lettersAlreadyGuessed[26] = {'\0'};

void welcomeMessage() {
        printf("*****************************\n");
        printf("*          Hangman          *\n");
        printf("*     A group 7 project     *\n");
        printf("*                           *\n");
        printf("*****************************\n");
}


/*
*newGameOrExit - Returns 1 for a new game, 0 for exit
*/
int newGameOrExit() {
	printf("Would you like to start a new game? (y/n): \n");
	
	char response = getchar();

	if (response == EOF) {
		printf("Error processing input, exiting...\n");
		exit(1);
	}
	
	if ((response != 'y') && (response != 'n')) {
		printf("Sorry, I didn't understand you.\n");
		
		char c;
		while ((c = getchar()) != '\n' && c != EOF);
		
		return newGameOrExit();
	}

	if (response == 'y') {
		return 1;
	}
	else {
		return 0;
	}
}

int getDifficulty() {
	printf("Please enter a difficulty, 1: easy, 2: medium, 3: hard\n");
		
	char c;
	while ((c = getchar()) != '\n' && c != EOF);
	
	char difficulty;
	difficulty = getchar();
	
	if (difficulty != '1' && difficulty != '2' && difficulty != '3') {
		printf("Error reading difficulty.\n");
		exit(1);
	}

	return (difficulty - '0'); //Hacky ascii to int thing.
}

int score(int lives, int difficulty) {
        int myScore = lives*difficulty;
        return myScore;
}

char *wordBank(int difficulty) {

	static char easy[8] = "giraffe";
	static char norm[10] = "embezzled";
	static char hard[13] = "quizzicality";

	if(difficulty == 1){
	  return easy;
	}
	else if(difficulty == 2) {
	  return norm;
	}
	else {
	  return hard;
	}//end if

}//end wordBank

int validWord (char *guess, char* correctWord) {
	int i;
	i = 0;
	//if player guesses correct word, return "true", else return "false"
	while (correctWord[i] != '\0') {
		if (guess[i] != correctWord[i]) {
			return 0; //false
		}
		else {
			if (correctWord[i+1] == '\0' && guess[i+1] == '\0') {
				return 1; //true
			}
			else {
				i++;
			}
		}
	}
	return 0; //false
}

int validChar (char guess, char* correctWord) {
	int i;
	i = 0;
	int result;
	while (i < 27) {
		if (lettersAlreadyGuessed[i] == guess) {
			return 0;
		}
		else {
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

int wordComplete(char* word) {
	int i = 0;
	while (word[i] != '\0') {
		int goodGuess = 0;
		int j = 0;
		while (lettersAlreadyGuessed[j] != '\0') {
			if (word[i] == lettersAlreadyGuessed[j]) {
				goodGuess = 1;
			}
			j++;
		}
		if (!goodGuess) {
			return 0;
		}
		i++;
	}
	return 1;
}

void displayWordSoFar(char* correctWord) {
	printf("           ");
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
		} 
		else {
				printChar = '-';
		}
		printf("%c", printChar);
		i++;
	}
	printf("\n");
}

void guessAllLetters() {
	int i;
	for (i = 97; i <= 122; i++) {
		lettersAlreadyGuessed[i - 97] = i;
	}
}

void hngDrawMan(int lives) {
	if (lives > 6 || lives < 0) {
			return;
	}

	char head = ' ';
	char lArm = ' ';
	char rArm = ' ';
	char lLeg = ' ';
	char rLeg = ' ';
	char torso = ' ';

	if (lives <= 5) {
			head = '0';
	}

	if (lives <= 4) {
			torso = '|';
	}

	if (lives <= 3) {
			lArm = '/';
	}

	if (lives <= 2) {
			rArm = '\\';
	}

	if (lives <= 1) {
			lLeg = '/';
	}

	if (lives == 0) {
			rLeg = '\\';
	}
	
	printf("You have %d %s left!\n", lives, (lives == 1) ? "life" : "lives");
	printf("          ---|          \n");
	printf("          |  %c         \n", head);
	printf("          | %c%c%c\n", lArm, torso, rArm);
	printf("          | %c %c\n", lLeg, rLeg);
	printf("          |-------\n");
}

int isValidGuess(char *guess, char *word) {
	int badGuess = 0;
	int charGuess = 1;
	int wordGuess = 2;
	
	if (guess[1] != '\0') { //longer then just a char
		if(validWord(guess, word)) {
			return wordGuess;
		}
	}
	else { 
		char chrGuess = guess[0];
		if(validChar(chrGuess, word)) {
			return charGuess;
		}
	}	
	return badGuess;
}


int main() {
	welcomeMessage();
	int gameStatus = newGameOrExit();

	if (gameStatus == 0) {
		exit(1);
	}

	int difficulty = getDifficulty();
	int numLives = 6;
	char *word = wordBank(difficulty);

	while (numLives > 0 && !wordComplete(word)) { 
		
		hngDrawMan(numLives);
		displayWordSoFar(word);	
		printf("\nPlease make a guess: ");
		
		//Flush the input buffer
		char c;
		while ((c = getchar()) != '\n' && c != EOF);
		
		char guess[256];
		scanf("%s", guess);
		
		int guessStatus = isValidGuess(guess, word);
	
		printf("\n\n");
		if (guessStatus == 0) {
			numLives--;
			printf("Oops, take another guess!\n");
		}
		else if (guessStatus == 1) {
			printf("Good guess!\n");
		}
		else {
			printf("Good guess! You knew the word!\n");
			guessAllLetters();
			break;
		}
	}		

	hngDrawMan(numLives);
	displayWordSoFar(word);
	if (wordComplete(word)) {
		printf("You won!\n");
	}
	else {
		printf("You Lost, try again.\n");
	}
	return 0;
}
