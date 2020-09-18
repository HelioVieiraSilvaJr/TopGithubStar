//
//  ListReposServiceTest.swift
//  TopGithubTests
//
//  Created by Helio Junior on 18/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import XCTest
@testable import TopGithub

class ListReposServiceTest: XCTestCase {

    private var sut = ListReposService()
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFetchReposResponseSuccess() {
        let expectation = XCTestExpectation(description: "Espero ter uma resposta de Sucesso da API")
        
        sut.fetchRepos(pagination: 1) { (result) in
            defer{
                expectation.fulfill()
            }
            switch result {
            case .success:
                XCTAssertTrue(true)
            case .failure(let error):
                XCTFail(error.errorMessage)
            }
        }
        
        wait(for: [expectation], timeout: 3)
    }
}
