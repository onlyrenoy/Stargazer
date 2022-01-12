//
//  StarGazerTableViewCell.swift
//  Stargazer
//
//  Created by Renoy Chowdhury on 12/01/22.
//

import UIKit

class StarGazerTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(avatarURL: String?, username: String?) {
        if let avatarURL = avatarURL, let username = username {
            avatarImageView.contentMode = .scaleAspectFit
           getAvatar(avatarUrl: avatarURL)
            
            usernameLabel.text = username
        }
    }
    
    func getAvatar(avatarUrl: String?) {
        if let avatarUrl = avatarUrl, let url = URL(string: avatarUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    self.avatarImageView.image =  UIImage(data: data!)!
                }
            }.resume()
        }
    }
}
