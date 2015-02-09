#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include "hngDisplay.h"
#include <stdio.h>
#include <stdlib.h>

void hngWelcomeMessage() {
	printf("********************************\n");
	printf("*          Hangman             *\n");
	printf("*     A group 7 project        *\n");
	printf("*                              *\n");
	printf("********************************\n");
}

void hngDrawMan(int lives) {
	if (lives > MAX_LIVES || lives < 0) {
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
		return newGameOrExit();
	}

	if (response == 'y') {
		return 1;
	}
	else {
		return 0;
	}
}