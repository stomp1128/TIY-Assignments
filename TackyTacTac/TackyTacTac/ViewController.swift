//
//  ViewController.swift
//  TackyTacTac
//
//  Created by Chris Stomp on 10/26/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//
//
//import UIKit
//
//class ViewController: UIViewController {
//    
//   var grid = [[0,0,0], [0,0,0], [0,0,0]] //2
//    
//    var isPlayer1Turn = true // step 2 set the rest of the properties
//   
//    var player1Score = 0 //2
//    var player2Score = 0 //2
//    var stalemateScore = 0 //2
//    
//    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 80, width: 200, height: 50)) //step 1
//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor.whiteColor() //step 3 background color
//        
//        gameStatusLabel.text = "Player 1 Turn"  //step 4
//        gameStatusLabel.textAlignment = .Center
//        
//        gameStatusLabel.center.x = view.center.x
//        
//        view.addSubview(gameStatusLabel) //step 5 add it as subview to make it visible on screen
//        
//        let screenHeight = Int(UIScreen.mainScreen().bounds.height)  //step 6
//        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
//        
//        let buttonHW = 100
//        let buttonSpacing = 4
//        
//        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
//        
//        let leftSpacing = (screenWidth - gridHW) / 2
//        let topSpacing = (screenHeight - gridHW) / 2
//        
//        for (r, row) in grid.enumerate() // step 7 set up grid
//        {
//            for (c, _) in row.enumerate()
//            {
//                let x = c * (buttonHW + buttonSpacing) + leftSpacing
//                let y = r * (buttonHW + buttonSpacing) + topSpacing
//                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW)) //step 9
//                button.backgroundColor = UIColor.cyanColor()
//                
//                button.row = r
//                button.col = c
//                
//                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside) // name of func in quotes, colon becuase it takes an argument
//                view.addSubview(button)
//            }
//        }
//    }
//
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//        
//        // MARK = Action Handlers
//        
//        func spacePressed(button: TTTButton) //step 10
//        {
//           if button.player == 0
//           {
////                if isPlayer1Turn
////                {
////                    button.player = 1
////                }
////                else
////                {
////                    button.player = 2
////                }
//            button.player = isPlayer1Turn ? 1 : 2
//            
//            grid[button.row] [button.col] = isPlayer1Turn ? 1 : 2 //record which button has been pressed by which player
//            
//            isPlayer1Turn = !isPlayer1Turn // decide whose turn it is
//            
//        checkForWinner() //func to decide if there is a winner
//            
//           }
//        }
//    }
//    
//    // MARK - Misc.
//    
//    func checkForWinner()
//    {
//        let possibilities = [
//            ((0,0),(0,1),(0,2)),
//            ((1,0),(1,1),(1,2)),
//            ((2,0),(2,1),(2,2)),
//            ((0,0),(1,0),(2,0)),
//            ((0,1),(1,1),(2,1)),
//            ((0,2),(1,2),(2,2)),
//            ((0,0),(1,1),(2,2)),
//            ((2,0),(1,1),(0,2))
//        ]
//        
//        for possibility in possibilities
//        {
//            let (p1,p2,p3) = possibility
//            let value1 = grid[p1.0][p1.1]
//            let value2 = grid[p2.0][p2.1]
//            let value3 = grid[p3.0][p3.1]
//            
//            if value1 == value2 && value2 == value3
//            {
//                if value1 != 0
//                {
//                    print("Player \(value1) wins!")
//                }
//                else
//                {
//                    print("No winner: all zeros")
//                }
//            }
//            else
//            {
//                print("Does not match")
//            }
//        }
//    }
//
//
//}
//
//class TTTButton: UIButton // step 8 set up new class and name it
//{
//    var row = 0
//    var col = 0
//    
//    var player = 0 {
//        didSet {
//            switch player {
//            case 1: backgroundColor = UIColor.magentaColor()
//            case 2: backgroundColor = UIColor.yellowColor()
//            default: backgroundColor = UIColor.cyanColor()
//            }
//        }
//    }
//    
//}

import UIKit

class ViewController: UIViewController
{
    
    var grid = [[0,0,0], [0,0,0], [0,0,0]]
    
    var isPlayer1Turn = true
    
    var player1Score = 0
    var player2Score = 0
    var stalemateScore = 0
    
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 80, width: 200, height: 50))
    let player1ScoreLabel = UILabel(frame: CGRect(x: 0, y: 560, width: 200, height: 50))
    let player2ScoreLabel = UILabel(frame: CGRect(x: 0, y: 580, width: 200, height: 50))
    let stalemateScoreLabel = UILabel(frame: CGRect(x: 0, y: 620, width: 200, height: 50))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        gameStatusLabel.text = "Player 1 Turn"
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center.x = view.center.x
        
        player1ScoreLabel.text = "Player 1 Score = 0"
        player1ScoreLabel.textAlignment = .Center
        player1ScoreLabel.center.x = view.center.x
        
        player2ScoreLabel.text = "Player 2 Score = 0"
        player2ScoreLabel.textAlignment = .Center
        player2ScoreLabel.center.x = view.center.x
        
        stalemateScoreLabel.text = "Stalemate Score = 0"
        stalemateScoreLabel.textAlignment = .Center
        stalemateScoreLabel.center.x = view.center.x
        
        
        view.addSubview(gameStatusLabel)
        view.addSubview(player1ScoreLabel)
        view.addSubview(player2ScoreLabel)
        view.addSubview(stalemateScoreLabel)
        
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        let buttonHW = 100
        let buttonSpacing = 4
        
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        for (r, row) in grid.enumerate()
        {
            for (c, _) in row.enumerate()
            {
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                view.addSubview(button)
            }
        }
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
            //            }
            button.player = isPlayer1Turn ? 1 : 2
            
            grid[button.row][button.col] = isPlayer1Turn ? 1 : 2
            
            isPlayer1Turn = !isPlayer1Turn
            
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
            
            
            if value1 == value2 && value2 == value3
            {
                if value1 != 0
                {
                    if isPlayer1Turn == true
                    {
                        player1Score++
                    }
                    else
                    {
                        player2Score++
                    }
                }
                else
                {
                    print("No winner: all zeros")
                }
            }
            else
            {
                stalemateScore++
                
            }
        }
    }
    func scoreboard()
    {
        
    }
    
    
}


    
    
    


class TTTButton: UIButton
{
    var row = 0
    var col = 0
    
    var player = 0 {
        didSet {
            switch player {
            case 1: backgroundColor = getRandomColor()//UIColor.magentaColor()
            case 2: backgroundColor = getRandomColor() //UIColor.yellowColor()
            default: backgroundColor = getRandomColor()//UIColor.cyanColor()
            }
        }
    }
    
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}


