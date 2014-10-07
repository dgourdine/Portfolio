/*  Creator: David Gourdine
 *  Date: 10 / 1/ 13
 * Purpose: Create an interactive tic tac toe game 
 * 
 
*/

import java.util.Scanner;
import java.util.Random; 

class Lab7 {  
static final Scanner input = new Scanner(System.in);
 static Random rnd = new Random();
  static final  int comp = rnd.nextInt(9)+1;
   final static char board [] [] = { 
      {'1', '2', '3'} ,
      {'4', '5', '6'} ,
      {'7', '8', '9'} 
      }; 
  
  
 public static void main (String[] args) { 
  

   
System.out.println(" If you would like to play Tic Tac Toe, enter a number between 1 and 9.");    

int player = 0; 


  ticTacBoard(board); 
  
  playerPrompt(); 
     compMove(board,comp,player);     
     


       
  } 
  
/////////////Call Methods(Start)///////////////////////  
  
  
  /* Prints tic-tac toe board */ 

  static void ticTacBoard(char b [][] ) { 
    System.out.println(); 
    System.out.printf("     %c|%c|%c\n", b[0][0],b[0][1],b[0][2]);
    System.out.println("     -+-+-");
    System.out.printf("     %c|%c|%c\n", b[1][0],b[1][1],b[1][2]);
    System.out.println("     -+-+-");
    System.out.printf("     %c|%c|%c", b[2][0],b[2][1],b[2][2]);
    System.out.println("\n"); 
  }
  
  
  /* Updates the board in response to the players choice */ 
  
 static void playerMove (char b [][], int square) {
    int row = (square-1) / b.length; 
    int col = (square-1) % b.length; 
    char currentVal = b[row][col]; 
    boolean playerMove = false; 
  
    while (!playerMove) { 
      
     if (currentVal != 'X' && currentVal != '0' && currentVal != comp ) {
            b[row][col] = 'X'; 
             playerMove = true; 
          }  
        if (currentVal == 'X' || currentVal == '0' || currentVal == comp) { 
           System.out.println("\nSquare " + square + " is already taken, choose another!" ); 
            ticTacBoard(board);
            playerPrompt(); 
            playerMove = true;   
            
            
         }
    }         
  } 
    
  
  /* Updates the board based on the computers choice*/ 
  
 static void compMove (char b [][], int comp,int square) {
     int row = (comp-1) / b.length; 
     int col = (comp-1) % b.length; 
     char currentVal = b[row][col]; 
     boolean compPick = false;
     

     
     
  while (!compPick) { 
     
       if (currentVal != '0' && currentVal != 'X' && currentVal != square) {
            b[row][col] = '0';
            System.out.println("\nI'll choose square " + comp + " !");
            
               ticTacBoard(board);
               playerPrompt();
               compMove(board,comp,0);
               
              }
       else if (currentVal == board[0][square] || board[0][col] == square || square == 1 || square ==2 || square == 3) {
      
         System.out.println(" Foolish Human, I am always ten steps ahead! ");

      
        for ( int i = 0; i <=  10; i++) {
         System.out.println("\n Hmmmmmmm..........\n");
          int a = rnd.nextInt(3)+1; 
                                                         
        
          if ( a != 'X' || a != '0' || a != square) {
           compMove(board,a,0); 
              

             
          }    
        }}    
        else if (currentVal == 'X' || currentVal == '0' || currentVal == square) {
        
          for ( int i = 0; i <9; i++) {
           System.out.println("\nHmmmmmmm..........");
          int a = rnd.nextInt(9)+1; 
          
          
   
           if ( a != 'X' || a != '0' || a != square) {
             compMove(board,a,0); 
           }}}
      
      else compPick = false;}
        
 }
 

          
  /* Prompts player to select a space */   
    
  static void playerPrompt() {
    
      System.out.println("Pick a square!\n ");
         int player = input.nextInt();
         int square = player; 
         playerMove(board, square);
           ticTacBoard(board);
   }
  

  
  
/////////////Call Methods(End) /////////////////////    
 }// End of class
