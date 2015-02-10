#include <stdio.h>
#include <stdlib.h>

//Only called upon if the user wins
void score(int difficulty,int numGuess){
  //numGuesses is the amount of tries the user took to win

  if(difficulty == 1){
    if(numGuess == 1){
      printf("Perfect!/n");
    }else if(numGuess > 1 && numGuess <=3){
      printf("Well Done\n");
    }else{
      printf("Poorly Done\n");
    }//end if
  }else if(difficulty == 2){
    if(numGuess == 1){
      printf("Perfect!\n");
    }else if(numGuess > 1 && numGuess <=3){
      printf("Well Done\n");
    }else{
      printf("Poorly Donen");
    }//end if
  }else{
    if(numGuess == 1){
      printf("Perfect!\n");
    }else if(numGuess > 1 && numGuess <=3){
      printf("Well Done\n");
    }else{
      printf("Poorly Done\n");
    }//end if
  }//end if

}//end score
