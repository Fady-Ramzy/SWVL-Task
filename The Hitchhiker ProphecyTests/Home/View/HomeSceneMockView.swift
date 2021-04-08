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
    
    // MARK: - Properties
    
    var charactersViewModel: [HomeScene.Search.ViewModel]?
    var numberOfReturnedCharacters: Int = 0
    var returnedError: Error!
    var didFetchCharacters: Bool = false
    var isCollectionViewPresentedVertically: Bool = false
    var isCollectionViewPresentedHorizontally: Bool = false
    
    // MARK: - Methods
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        numberOfReturnedCharacters = viewModel.count
        didFetchCharacters = true
    }
    
    func failedToFetchCharacters(error: Error) {
        self.returnedError = error
    }
    
    func presentCollectionViewHorizontally() {
        isCollectionViewPresentedHorizontally = true
    }
    
    func presentCollectionViewVertically() {
        isCollectionViewPresentedVertically = true
    }
}
