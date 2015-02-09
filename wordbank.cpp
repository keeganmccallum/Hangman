#include "wordbank.h"
#include <stdlib.h>

//Important that as words are added and removed
//that the author updates the NUM_WORDS definition.
char *wordBank[NUM_WORDS] = { "giraffe", "lampshade", "bedsheet", "hilarious", "orphan", "failable" };

char *selectWord() {
	char *retString = wordBank[rand() % NUM_WORDS];
	return retString;
}