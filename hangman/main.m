//
//  main.m
//  hangman
//
//  Created by Charles Kang  on 9/10/15.
//  Copyright © 2015 Charles Kang . All rights reserved.
//

#import <Foundation/Foundation.h>

int guessesRemaining;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // character array for the word to guess
        char *wordGuess = "kavourasm";
        
        // inits a uncounted long for the length of the word
        int wordLength = strlen(wordGuess);
        
        // bool state for win condition
        int win = 0;
        
        //inits an integer of the guesses left
        guessesRemaining = 5;
        
        //inits an array containing words to guess
        int showKeys[wordLength];
        for (int i = 0; i < wordLength; i++) {
            showKeys[i] = 0;
        }
        
        printf("WELCOME TO HANGPERSON.");
        
        // inits the game loop
        while (win == 0) {
            
            usleep(2e5); //pause before each loop
            
            int tryAgain = 1;
            
            char guessedLetter;
            printf("\n\nGuess a letter: ");
            scanf(" %c",&guessedLetter);
            
            for (int i = 0; i < wordLength; i++) { //for loop iterates through each character in the word to guess
                
                if (wordGuess[i] == guessedLetter) { //checks if guessed letter is in the word to guess
                    
                    showKeys[i] = 1;
                    
                    tryAgain = 0;
                }
                
            }
            
            // decrease guess if guess is incorrect
            if(tryAgain ==1){
                guessesRemaining = guessesRemaining - 1;
            }
            
            
            // shows current guess state
            printf("\n\n");
            for (int i = 0; i < wordLength; i++) {
                if (showKeys[i] == 1) {
                    printf("%c ",wordGuess[i]);
                }
                else {
                    printf("_ ");
                }
                
            }
            
            //
            if (tryAgain == 1){ // code is executed if incorrect
                if (guessesRemaining == 0) {
                    printf("\n\nGame Over!.");
                    break; //ends game
                }
                else {
                    printf("\n\nTry again. Guesses left: %d",guessesRemaining); //tells player to try again
                }
                
                
            }
            else { //code executed if guessed letter is correct
                printf("\n\nCorrect!"); //tells player that they guessed correctly
            }
            
            //checks if player has won
            win = 1;
            for (int i = 0; i <wordLength; i++) {
                if (showKeys[i] == 0) {
                    win = 0; //player has not won
                }
            }
            if (win == 1) {
                printf("\nYou win!!!");
            }
            
        }
        return 0;
    }
}
