//
//  ViewController.swift
//  DrinkIf
//
//  Created by Dmitry on 24.05.2020.
//  Copyright © 2020 Dmitry Navitski. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
        
    @IBOutlet weak var starter: UIButton!
    @IBOutlet weak var party: UIButton!
    @IBOutlet weak var hot: UIButton!
    @IBOutlet weak var ultimate: UIButton!
    
    private var questions: [String]?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if let plist = sender.titleLabel?.text?.components(separatedBy: .whitespaces).joined() {
            questions = DataManager.shared.getQuestions(withName: plist)?.shuffled()
        }
        performSegue(withIdentifier: "StartGame", sender: sender)
    }
    
    override func viewWillLayoutSubviews() {
        prepareBackButton()
        prepareMainButtons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is GameViewController {
            let vc = segue.destination as? GameViewController
            if let questions = questions {
                vc?.questions = questions
            } else {
                showAlert(title: "Oops!", message: "It seems something goes wrong, please reinstall the app.")
            }
        }
    }

    private func prepareMainButtons() {
        [starter, party, hot, ultimate].forEach{ $0.layer.cornerRadius = $0.bounds.height / 2 }
    }
    
    private func prepareBackButton() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icons-close1")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icons-close1")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension MainMenuViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

