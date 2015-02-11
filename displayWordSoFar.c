void displayWordSoFar(char correctWord[]) {
	int i = 0;
	while (correctWord[i] != '\0') {
		int j = 0;
		int match = 0;
		char printChar;
		while (lettersAlreadyGuessed[j] != '\0') {
			if (correctWord[i] == lettersAlreadyGuessed[j]) {
				match = 1;
			}
		}
		if (match) {
			printChar = correctWord[i];
		} else {
			printChar = "-";
		}
		printf("%c\n", printChar);
		i++;
	}
}
