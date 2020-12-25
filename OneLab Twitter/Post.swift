//
//  Twit.swift
//  OneLab Twitter
//
//  Created by Alikhan Khassen on 24.12.2020
//

import Foundation

struct Post: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
