//
//  MockNetwork.swift
//  Project_Get_WordTests
//
//  Created by Давид on 09/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
@testable import Project_Get_Word

class MockURLSessionDataTask: URLSessionDataTask {
    private let block: () -> Void
    
    init(completion: @escaping () -> Void) {
        self.block = completion
    }
    override func resume() {
        block()
    }
}
class MockURLSession: URLSession {
    var data: Data?
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> MockURLSessionDataTask {
        let data = self.data
        return MockURLSessionDataTask {
            completionHandler(data, nil, nil)
        }
    }
}
