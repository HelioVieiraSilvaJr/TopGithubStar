//
//  ListReposViewControllerTest.swift
//  TopGithubTests
//
//  Created by Helio Junior on 18/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import XCTest
@testable import TopGithub

class ListReposViewControllerTest: XCTestCase {
    
    private var sut: ListReposViewController!

    override func setUp() {
        super.setUp()
        sut = ListReposViewController().instantiate() as? ListReposViewController
        
        let serviceStub = ListReposServiceStub()
        let viewModel = ListReposViewModel(serviceStub)
        sut.viewModel = viewModel
        sut.loadView()
        sut.viewDidLoad()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testHasATableview() {
        XCTAssertNotNil(sut.tableView)
    }
        
    func testTableviewHasDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }

    func testTableviewCellHasReuseIdentifier() {
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? RepoCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "RepoCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func testTableCellHasCorrectLabelText() {
        let firstCell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? RepoCell
        XCTAssertEqual(firstCell?.lblNameRepository.text, "awesome-ios")
        
        let secondCell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? RepoCell
        XCTAssertEqual(secondCell?.lblNameRepository.text, "Alamofire")

        let thirdCell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 2, section: 0)) as? RepoCell
        XCTAssertEqual(thirdCell?.lblNameRepository.text, "ShadowsocksX-NG")
    }
}
