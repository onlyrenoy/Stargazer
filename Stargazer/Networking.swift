//
//  Networking.swift
//  Stargazer
//
//  Created by Renoy Chowdhury on 12/01/22.
//

import Foundation
import UIKit

class Networking {
    static let shared = Networking()
    
    //TODO: add alerts
    func setAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.shared.windows.last?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    //TODO: gestire pagination
    func getStargazers(owner: String, repositoryName: String, closure: @escaping ([StarGazer]?) -> Void) {
        if let url = URL(string: "https://api.github.com/repos/\(owner)/\(repositoryName)/stargazers?per_page=30&page=0") {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if error == nil {
                    if let data = data, let decodedResponse = try? JSONDecoder().decode([StarGazer].self, from: data) {
                        DispatchQueue.main.async {
                            closure(decodedResponse)
                        }
                    }
                } else {
                    self.setAlert(title: "Attenzione", message: "Cant find repo")
                    print("JSONSerialization error:", error!)
                }
            }
            task.resume()
        } else {
            self.setAlert(title: "Attenzione", message: "Cant find repo")
        }
    }
}


extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
