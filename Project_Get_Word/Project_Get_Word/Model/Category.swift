//
//  Category.swift
//  Project_Get_Word
//
//  Created by Давид on 29/11/2019.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

//In API we got a lot of categories with some unique id
struct Category: Codable {
    var id: Int
    var name: String
}
