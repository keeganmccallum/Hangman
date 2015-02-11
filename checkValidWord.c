int checkValidWord (char guess[], char correctWord[]) {
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


