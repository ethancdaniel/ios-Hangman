//
//  HangmanViewController
//  Hangman
//
//  Created by David [Entei] Xiong on 2/19/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var incorrectGuessesLabel: UILabel!
    @IBOutlet weak var guessField: UITextField!
    
    var guess: Guess?
    var incorrectIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guess = Guess(phrase: "sicko mode")
        progressLabel.text = guess?.getProgressString()
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        // Will only run if exactly one character is in the text field
        if let letter = guessField.text {
            if letter.count == 1 {
                let notGuessed = guess?.registerGuess(guess: Character(letter))
                incorrectGuessesLabel.text = guess?.getIncorrectGuesses()
                if notGuessed! {
                    progressLabel.text = guess?.getProgressString()
                } else {
                    incorrectIndex += 1
                    // TODO
                    // update hangman image
                }
            }
        }
        // Reset text field after guess is registered
        guessField.text = ""
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        guess = Guess(phrase: "live sheck wes")
        progressLabel.text = guess?.getProgressString()
        incorrectGuessesLabel.text = guess?.getIncorrectGuesses()
    }
}

