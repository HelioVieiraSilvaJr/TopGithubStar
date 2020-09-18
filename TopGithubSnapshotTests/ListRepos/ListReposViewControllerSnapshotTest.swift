//
//  ListReposViewControllerSnapshotTest.swift
//  TopGithubSnapshotTests
//
//  Created by Helio Junior on 18/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import TopGithub

class ListReposViewControllerSnapshotTest: FBSnapshotTestCase {

    private var sut: ListReposViewController!
    
    override func setUp() {
        super.setUp()
        sut = ListReposViewController().instantiate() as? ListReposViewController
        
        recordMode = false
        fileNameOptions = [.device, .screenSize, .OS]        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testView() {
        let serviceStub = ListReposServiceStub()
        let viewModel = ListReposViewModel(serviceStub)
        sut.viewModel = viewModel
        sut.loadView()
        
        sut.viewDidLoad()
        
        FBSnapshotVerifyView(sut.view)
    }
}
