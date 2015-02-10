#include <stdio.h>
#include <stdlib.h>

//word bank
char *wordBank(int difficulty){
  
  static char easy[] = "easy";
  static char norm[] = "normal";
  static char hard[] = "hard";
  
    if(difficulty == 1){
      return easy;
    }else if(difficulty == 2){
      return norm;
    }else{
      return hard;
    }//end if
  
}//end wordBank

/*
int main(){

  //prompt user for difficulty
  printf("Select a difficulty\n");
  printf("Enter (1) for Easy, (2) for Normal, (3) for Hard\n");
  int difficulty;

  int errCheck = 0;
  while(errCheck == 0){
  scanf("%d", &difficulty);
  if(difficulty>0 && difficulty <4){
    errCheck = 1;
  }else{
    printf("Invalid Difficulty. Please select the proper difficulty\n");
  }//end if

  }//end while

  //Retrieve word from wordbank
  char *word = wordBank(difficulty);
  printf("Difficulty: %d\n",difficulty);
  printf("Word: %s \n",word);
  
  score(difficulty,10);

  return 0;
}//end main
*/
