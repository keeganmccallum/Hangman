# Hangman
CISC 221 Project


## GLOBAL DATA STRUCTURES

- (array) letters_already_guessed, both correct and incorrect
- create a 27-character-long "array" of characters (char[])
- set all positions to null (\0)
- now we can traverse!
- when adding a value, replace the first null reached with the character
- (array) word bank, one of which is chosen at the beginning of the program
- (int) number of lives remaining


## FUNCTIONS

void displayStickFigure(int lives)
- draw the stick figure based on how many lives are left

int checkValidWord(char guess[], char correctWord[])
- return true if the word is correct, or false otherwise
- either way, the game should end after this is called

int checkValidCharacter(char guess, char correctWord[])
- return true if the character is in the word but NOT in the letters already guessed array, or false otherwise
- add the guess to the list of letters already guessed

void displayWordSoFar(char correctWord[])
- look at each letter in correctWord see if it's already in letters_already_guessed
- if it is, display it; otherwise, display a blank

void welcomeMessage()
- prints a welcome message at the start of the game

char* chooseDifficulty()
- prompts the user to choose from Easy, Medium, Hard
- returns the given word, respectively