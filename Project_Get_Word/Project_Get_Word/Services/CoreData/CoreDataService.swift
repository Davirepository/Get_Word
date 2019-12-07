//
//  CoreDataService.swift
//  Project_Get_Word
//
//  Created by Давид on 06/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import CoreData
import UIKit

final class CoreDataService {
    let stack = CoreDataStack.shared

    func saveInStorage(data model: Int16) {
        stack.persistentContainer.performBackgroundTask { (context) in
            let score = MOScore(context: context)
            score.score = model
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func loadFromStorage(completion: @escaping ([MOScore]) -> Void) {
        stack.persistentContainer.performBackgroundTask { (context) in
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Score")
            // return data in right order
            let sorter: NSSortDescriptor = NSSortDescriptor(key: "score" , ascending: false)
            fetch.sortDescriptors = [sorter]
            do {
                let result = try context.fetch(fetch) as? [MOScore]
                guard let results = result else { return }
                completion(results)
            } catch {
                print(error.localizedDescription)
                completion([MOScore]())
            }
        }
    }

    func deleteData() {
        stack.persistentContainer.performBackgroundTask { (context) in
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Score")
            do {
                try context.execute(NSBatchDeleteRequest(fetchRequest: fetch))
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}

