//
//  ListReposViewModelTest.swift
//  TopGithubTests
//
//  Created by Helio Junior on 17/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import XCTest
@testable import TopGithub

class ListReposViewModelTest: XCTestCase {

    var sut: ListReposViewModel!
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFetchRepos() {
        let listReposServiceStub = ListReposServiceStub()
        sut = ListReposViewModel(listReposServiceStub)
        
        sut.fetchRepos()
        
        XCTAssertEqual(sut.repos.count, 20, "Numero de repos errado!")
    }
    
    func testReloadRepos() {
        let listReposServiceStub = ListReposServiceStub()
        sut = ListReposViewModel(listReposServiceStub)
        
        sut.reloadRepos()
        
        XCTAssertEqual(sut.repos.count, 20, "Numero de repos errado!")
    }
}
