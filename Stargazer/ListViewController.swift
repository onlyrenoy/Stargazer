//
//  ListViewController.swift
//  Stargazer
//
//  Created by Renoy Chowdhury on 12/01/22.
//

import UIKit

class ListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var stargazers: [StarGazer]?
    var aTitle: String?
    var repositoryName: String?
    var gitOwner: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib.init(nibName: "StarGazerTableViewCell", bundle: nil), forCellReuseIdentifier: "stargazerCell")
        
        titleLabel.text = aTitle
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stargazers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "stargazerCell", for: indexPath) as? StarGazerTableViewCell {
            cell.configureCell(avatarURL: stargazers?[indexPath.item].avatar_url ?? "", username: self.stargazers?[indexPath.item].login ?? "")
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y

        if position > self.tableView.contentSize.height - 100 - scrollView.frame.height {
            Networking.shared.getStargazers(pagination: true, owner: gitOwner ?? "", repositoryName: repositoryName ?? "") { sg in
                self.stargazers?.append(contentsOf: sg ?? [])
                    self.tableView.reloadData()
            }
            
        }
    }
}

