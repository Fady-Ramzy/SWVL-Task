//
//  HomeSceneMockView.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/7/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
import The_Hitchhiker_Prophecy

class HomeSceneMockView: HomeSceneDisplayView {
    
    // MARK: - Dependencies
    
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    var charactersViewModel: [HomeScene.Search.ViewModel]?
    var numberOfReturnedCharacters: Int = 0
    
    // MARK: - Properties
    
    var didFetchCharacters: Bool = false
    var didReturnError: Bool = false
    var isCollectionViewPresentedVertically: Bool = false
    var isCollectionViewPresentedHorizontally: Bool = false
    
    // MARK: - Methods
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        numberOfReturnedCharacters = viewModel.count
        didFetchCharacters = true
    }
    
    func failedToFetchCharacters(error: Error) {
        didReturnError = true
    }
    
    func presentCollectionViewHorizontally() {
        isCollectionViewPresentedHorizontally = true
    }
    
    func presentCollectionViewVertically() {
        isCollectionViewPresentedVertically = true
    }
}
