int checkValidChar (char guess, char correctWord[]) {
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