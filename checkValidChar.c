int checkValidChar (char guess, char correctWord[]) {
	int i = 0;
	int result = -1;
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
	int j = 0;
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