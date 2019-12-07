//
//  MOScore.swift
//  Project_Get_Word
//
//  Created by Давид on 06/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import CoreData

@objc(MOScore)
internal class MOScore: NSManagedObject {
    @NSManaged var score: Int16
}
