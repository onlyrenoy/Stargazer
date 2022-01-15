//
//  RepositorySearchViewController.swift
//  Stargazer
//
//  Created by Renoy Chowdhury on 10/01/22.
//

import UIKit

class RepositorySearchViewController: UIViewController {
    @IBOutlet weak var ownerTextField: UITextField!
    @IBOutlet weak var repositoryTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchButton.layer.cornerRadius = 8
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toList" {
            if let list = segue.destination as? ListViewController, let sender = sender as? [Stargazer]? {
                list.aTitle = "\(repositoryTextField.text?.capitalized ?? "") stargazers"
                list.repositoryName = repositoryTextField.text
                list.gitOwner = ownerTextField.text
                list.stargazers = sender
            }
        }
    }
    
    @IBAction func searchRepositoryTapped(_ sender: Any) {
        // TODO: add error handling
        if ownerTextField.text?.isEmpty != true, repositoryTextField.text?.isEmpty != true {
            Networking.shared.getStargazers(pagination: false, owner: ownerTextField.text ?? "", repositoryName: repositoryTextField.text ?? "") { stargazers in
                if stargazers?.isEmpty == true {
                    Networking.shared.setAlert(title: "Attention", message: "this repository doesn't have stargazers")
                } else {
                    self.performSegue(withIdentifier: "toList", sender: stargazers)
                }
                
            }
        } else {
            Networking.shared.setAlert(title: "Attention", message: "Compilare tutti i campi")
        }
    }
}
