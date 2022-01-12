//
//  ViewController.swift
//  Stargazer
//
//  Created by Renoy Chowdhury on 10/01/22.
//

import UIKit

class ViewController: UIViewController {
    //TODO: Keyboard under textfield
    @IBOutlet weak var ownerTextField: UITextField!
    @IBOutlet weak var repositoryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tmp
        ownerTextField.text = "octocat"
        repositoryTextField.text = "spoon-knife"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toList" {
            if let list = segue.destination as? ListViewController, let sender = sender as? [StarGazer]? {
                list.aTitle = "\(ownerTextField.text ?? "") star gazers"
                list.stargazers = sender
            }
        }
    }
    
    @IBAction func searchRepositoryTapped(_ sender: Any) {
        // TODO: add error handling
        if ownerTextField.text?.isEmpty != true, repositoryTextField.text?.isEmpty != true {
            Networking.shared.getStargazers(owner: ownerTextField.text ?? "", repositoryName: repositoryTextField.text ?? "") { stargazers in
                self.performSegue(withIdentifier: "toList", sender: stargazers)//stargazers
            }
        } else {
            Networking.shared.setAlert(title: "Attenzione", message: "Compilare tutti i campi")
        }
    }
}
