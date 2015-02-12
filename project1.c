#include <stdio.h>
#include <stdlib.h>

char lettersAlreadyGuessed[27] = {'\0'};

int lives = 6;

void welcomeMessage() {
        printf("*****************************\n");
        printf("*          Hangman          *\n");
        printf("*     A group 7 project     *\n");
        printf("*                           *\n");
        printf("*****************************\n");
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

int checkValidWord (char guess[], char* correctWord) {
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
}

int checkValidChar (char guess[], char* correctWord) {
	int i;
	i = 0;
	int result;
	while (i < 27) {
		if (lettersAlreadyGuessed[i] == guess[0]) {
			return 0;
		}
		else {
			if (lettersAlreadyGuessed[i] == '\0') {
				lettersAlreadyGuessed[i] = guess[0];
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
		if (guess[0] == correctWord[j]) {
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

void displayWordSoFar(char* correctWord) {
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

int main() {

	welcomeMessage();

	printf("Select a difficulty\n");

	printf("Enter (1) for Easy, (2) for Normal, (3) for Hard\n");
	int difficulty;

	int errCheck = 0;
	while(errCheck == 0) {
		scanf("%i", &difficulty);
		if      (difficulty>0 && difficulty <4){
				 errCheck = 1;
		}
		else {
				printf("Invalid Difficulty. Please select the proper difficulty\n");
		}//end if block

	}//end while
	 //Retrieve word from wordbank
	char* word = wordBank(difficulty);
	int win;
	hngDrawMan(lives);
	displayWordSoFar(word);
	while (lives != 0) {
		printf("Please guess a word or a letter, but beware: If you guess a word and get it wrong, you automatically lose!\n");
		char userGuess[13];
		scanf("%s", &userGuess);
		if (userGuess[1] == '\0') {
			int inWord = checkValidChar(userGuess, word);
			if (inWord == 1) {
				hngDrawMan(lives);
				displayWordSoFar(word);
				if (wordComplete(word) == 1) {
						win = 1;
						 break;
				}
			}
			else {
				lives--;
				if (lives == 0) {
						win = 0;
						break;
				}
				else {
						hngDrawMan(lives);
						displayWordSoFar(word);
				}
			}
		}
		else {
			int answer = checkValidWord(userGuess, word);
			if (answer == 1) {
					win = 1;
					break;
			}
			else {
					win = 0;
					break;
			}
		}
	}
	int myScore = score(lives, difficulty);
	if (win == 1) {
			printf("You Win!\n");
			printf("Your score was: %i\n", myScore);
	}
	else {
			printf("You Lose!\n");
			printf("Your score was: 0\n");
	}
	return 0;
}











