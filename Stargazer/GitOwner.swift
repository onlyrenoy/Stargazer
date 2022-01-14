//
//  GitOwner.swift
//  Stargazer
//
//  Created by Renoy Chowdhury on 12/01/22.
//

import Foundation

class GitOwner: Decodable {
    var name: String?
    var full_name: String?
}

struct Errors { // Castare per avere errore
    let message: String?
}

class StarGazer: Decodable {
    var login: String?
    var avatar_url: String?
}

class GitErrors: Decodable {
    var message: String?
    var documentation_url: String?
}
