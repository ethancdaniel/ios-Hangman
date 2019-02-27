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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        // Will only run if exactly one character is in the text field
        if let letter = guessField.text {
            let incorrectGuessesBefore = guess?.incorrectGuesses.count
            
            if letter.count == 1 {
                let notGuessed = guess?.registerGuess(guess: Character(letter))
                incorrectGuessesLabel.text = guess?.getIncorrectGuesses()
                
                if notGuessed! {
                    let incorrectGuessesAfter = guess?.incorrectGuesses.count
                    
                    if incorrectGuessesBefore == incorrectGuessesAfter {
                        progressLabel.text = guess?.getProgressString()
                        
                        if guess?.getProgressString() == guess?.phrase {
                            let alert = UIAlertController(title: "You Won!", message: "Would you like to play again?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                                self.startNewGame()
                            }))
                            self.present(alert, animated: true)
                        }
                    } else {
                        hangmanImage.image = UIImage(named: "hangman" + String(incorrectGuessesAfter!))
                        if incorrectGuessesAfter == 6 {
                            let alert = UIAlertController(title: "You Lost!", message: "Would you like to play again?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                                self.startNewGame()
                            }))
                            self.present(alert, animated: true)
                        }
                    }
                } else {
                    // tell user that they already guessed this letter
                    let alert = UIAlertController(title: "You have already guess that letter.", message: "Please guess another letter.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
        // Reset text field after guess is registered
        guessField.text = ""
    }
    func startNewGame() {
        guess = Guess()
        progressLabel.text = guess?.getProgressString()
        hangmanImage.image = #imageLiteral(resourceName: "hangman0")
        incorrectGuessesLabel.text = guess?.getIncorrectGuesses()
    }
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        startNewGame()
    }
}

