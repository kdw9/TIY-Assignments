//
//  ViewController.swift
//  TackyTacTac
//
//  Created by Keron Williams on 10/26/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
// 4.) *** You need a 2-Demntional Array. Basicall an Array of Arrays
    var grid = [[0,0,0], [0,0,0], [0,0,0]]
    
    
// 3.) *** Create a Bool making player one go first
    var isPlayer1Turn = true
    
    
    
// 2.) *** create a place to store score - Create at scores in variables then assign them to zero
    var player1Score = 0
    var player2Score = 0
    var stalemateScore = 0
    
    
    
// 1.) *** first thing  we are doing is making a frame "LABEL"
// CGRect Describes the position and Size of something - it can also be in Double and Int
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 80, width: 200, height: 50))
    let playeroneScoreLabel = UILabel(frame: CGRect(x: 0, y: 425, width: 200, height: 50))
    let playertwoScoreLabel = UILabel(frame: CGRect(x: 0, y: 450, width: 200, height: 50))
    let staleMateLabel = UILabel(frame: CGRect(x: 0, y: 475, width: 200, height: 50))
    
    override func viewDidLoad()
        
    {
//.5) *** Now add color to the view background
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
//.6) *** This Text and its allignment indicates that the first player should go
        gameStatusLabel.text = "Player 1 Turn"
        gameStatusLabel.textAlignment = .Center
        playeroneScoreLabel.text = "Player 1 Score"
        playeroneScoreLabel.textAlignment = .Center
        playertwoScoreLabel.text = "Player 2 Score"
        playertwoScoreLabel.textAlignment = .Center
        staleMateLabel.text = "Stale Mate"
        staleMateLabel.textAlignment = .Center
        
//.7) *** This line indicates that the label is aligned to the center of the screen
        gameStatusLabel.center.x = view.center.x
        playeroneScoreLabel.center.x = view.center.x
        playertwoScoreLabel.center.x = view.center.x
        staleMateLabel.center.x = view.center.x
//.8) *** This line adds the view to the screen
        view.addSubview(gameStatusLabel)
        view.addSubview(playeroneScoreLabel)
        view.addSubview(playertwoScoreLabel)
        view.addSubview(staleMateLabel)
        
        
        
//.9) *** This is how to figure out how tall & wide the screen is - all iphone screens have Int's
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)

        
//.10) *** Now we are Creating buttons - HxW these buttons will be squares, with 4 points space between them
        let buttonHW = 100
        let buttonSpacing = 4
        
        
        
//.11) *** We are now creating a square shaped grid of squares
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        
//.12) *** Now that we have our grid we need to know how much space to put on the top + sides this centers the grid
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        
        
 //.13) This section is a tuple(a collection of objects) the (r)-"index" represents the Row in the grid and the (row)-"object" represents the Array. the (c) means colum and the (_) is saying "I dont Care whats left"
        for (r, row) in grid.enumerate()
        {
            for (c,_) in row.enumerate()
            {
                
//.13a) This basically gives an "x" & "y" position (x,y) for the little square we are putting on the screen
                let x = c * (buttonHW + buttonSpacing) +
                leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
               
                
//.14d) We are now adding the TTButton Class into the code and relating it to the original grid above including the colors and possible color change
                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                
                
//.15) *** This set the coordinates for the 9 square
                button.row = r
                button.col = c
                
                
//.16) *** "self" we "this class" are the ones thats going to run functions for the button, the func "SpacePressed" has a colon ":" at the end of it which means it takes an argument. Severytime the a button is pressed the function "spacedTapped" will be ran
                button.addTarget(self, action: "spacePressed:",
                    forControlEvents: .TouchUpInside)
                view.addSubview(button)
// The code above adds the button to the subview and is following the direction of where the subview wants it to go. basically telling the button thats created  where to apply its attributes
            }
        }
    }
    
    func resetButton()
    {
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        let buttonHW = 100
        let buttonSpacing = 4
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        
        for (r, row) in grid.enumerate()
        {
            for (c,_) in row.enumerate()
            {
              
                let x = c * (buttonHW + buttonSpacing) +
                leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c
                
                    button.addTarget(self, action: "spacePressed:",
                    forControlEvents: .TouchUpInside)
                view.addSubview(button)
            }
        }

    }
    
    
    func reset()
    {
    grid = [[0,0,0], [0,0,0], [0,0,0]]
    resetButton()
    isPlayer1Turn = true
    
    }
    func scoreboard()
    {
        if isPlayer1Turn == true
        {
          gameStatusLabel.text = "Player 1 Turn"
        }
        else
        {
        gameStatusLabel.text = "Player 2 Turn"
        }
        //gameStatusLabel.text = "Player 1 Turn"
        gameStatusLabel.textAlignment = .Center
        playeroneScoreLabel.text = "Player 1 Score: \(player1Score)"
        playeroneScoreLabel.textAlignment = .Center
        playertwoScoreLabel.text = "Player 2 Score: \(player2Score)"
        playertwoScoreLabel.textAlignment = .Center
        staleMateLabel.text = "Stale Mate"
        staleMateLabel.textAlignment = .Center
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  // MARK: - Action Handlers
    
    func spacePressed(button: TTTButton)
    {
        if button.player == 0
        {
//            if isPlayer1Turn
//            {
//                button.player = 1
//            }
//            else
//            {
//                button.player = 2
//       }
           
      
//.17) *** This code below called a Turnary Operator. Its states the on its play ones turn run the function if not run player two function
            button.player = isPlayer1Turn ? 1 : 2
           
            
//.18) *** This records who just went
            grid[button.row][button.col] = isPlayer1Turn ? 1 : 2
            
            isPlayer1Turn = !isPlayer1Turn
            scoreboard()
            
             checkForWinner()
        }
    }
 // MARK: - Misc.
    
    func checkForWinner()
    {
        let possibilities = [
            ((0,0),(0,1),(0,2)),
            ((1,0),(1,1),(1,2)),
            ((2,0),(2,1),(2,2)),
            ((0,0),(1,0),(2,0)),
            ((0,1),(1,1),(2,1)),
            ((0,2),(1,2),(2,2)),
            ((0,0),(1,1),(2,2)),
            ((2,0),(1,1),(0,2))
        ]
        for possibility in possibilities
      {
        let (p1,p2,p3) = possibility
        
        let value1 = grid[p1.0][p1.1]
        let value2 = grid[p2.0][p2.1]
        let value3 = grid[p3.0][p3.1]
        
        
// this is how to store point for the respected player
        if value1 == value2 && value2 == value3
        {
            if value1 != 0
            {
             if value1 == 1
             {
                player1Score++ //print("Player \(value1) win!")
             }
                else
             {
                player2Score++
             }
                reset()
                scoreboard()
            }
            else
            {
                print("No winner: all zeros")
            }
        }
        else
        {
            print("Does not match")
        }
        
        }
    }
}

//.14) *** You can have more than one class per file after the close the the curley braces. This is a new button. Each button needs a row and colum
class TTTButton: UIButton

{
    var row = 0
    var col = 0
//.14a) *** The zero initializer to var player is saying we dont know who turn it is yet
    var player = 0 {
    
    
//.14b) This "didset" code will run anytime it says button.player = "" in the above code.
    didSet {
        switch player {
        case 1: backgroundColor = UIColor.magentaColor()
        case 2: backgroundColor = UIColor.yellowColor()
        default: backgroundColor = UIColor.cyanColor()
            
//.14c) *** Above are the states of the buttons. "Case" represents which player is picking a box on the grid. Each player is assigned a color or in tic tac toe terms a "xoxo" if no player selects a box then the grid box button stays in "default" color or "0"
        }
      }
    }
}
