//
//  main.swift
//  Game Tic-Tac-Toe
//
//  Created by Рауль on 10/2/23.
//

import Foundation

protocol Menu {
    func startGame()
    func endGame()
}

class Game {
    var board = [["", "", ""], ["", "", ""], ["", "", ""]]
    
    func displayBoard() {
        for row in board {
            print(row)
        }
    }
    
    func updateBoard(row: Int, col: Int, symbol: String) {
        board[row][col] = symbol
    }
}

class HumanVsHuman: Game, Menu {
    func startGame() {
        displayBoard()
        
        var turn = 0
        while turn < 9 {
            let symbol = turn % 2 == 0 ? "X" : "O"
            print("Player \(symbol) turn:")
            print("Enter row:")
            let row = Int(readLine()!)!
            print("Enter column:")
            let col = Int(readLine()!)!
            updateBoard(row: row, col: col, symbol: symbol)
            displayBoard()
            turn += 1
        }
        endGame()
    }
    
    func endGame() {
        print("Game Over")
    }
}

class HumanVsBot: Game, Menu {
    func startGame() {
        displayBoard()
        
        var turn = 0
        while turn < 9 {
            let symbol = turn % 2 == 0 ? "X" : "O"
            if symbol == "X" {
                print("Your turn:")
                print("Enter row:")
                let row = Int(readLine()!)!
                print("Enter column:")
                let col = Int(readLine()!)!
                updateBoard(row: row, col: col, symbol: symbol)
                displayBoard()
            } else {
                print("Bot turn:")
                let row = Int.random(in: 0...2)
                let col = Int.random(in: 0...2)
                updateBoard(row: row, col: col, symbol: symbol)
                displayBoard()
            }
            turn += 1
        }
        endGame()
    }
    
    func endGame() {
        print("Game Over")
    }
}
