//
//  Guess.swift
//  Hangman
//
//  Created by Ethan Daniel on 2/22/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class Guess {
    var phrase: String?
    var incorrectGuesses: [Character]
    var notYetGuessed: [Character]
    
    init() {
        notYetGuessed = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        incorrectGuesses = []
    }
    
    // Call this function after setting the phrase field
    func getProgressString() -> String {
        var result = String(repeating: "_", count: phrase!.count)
        for char in notYetGuessed {
            result = result.replacingOccurrences(of: String(char), with: "_")
        }
        return result
    }
    
    // Formats string for the "incorrect guesses: " label
    func getIncorrectGuesses() -> String {
        var guesses = ""
        for i in incorrectGuesses {
            guesses += String(i) + " "
        }
        return guesses
    }
    
    // Returns true if successful and false if user already guessed the letter
    func registerGuess(guess: Character) -> Bool{
        if let index = notYetGuessed.index(of: guess) {
            if (!phrase!.contains(guess)) {
                incorrectGuesses.append(guess)
            }
            notYetGuessed.remove(at: index)
            return true
        } else {
            return false
        }
    }
}
