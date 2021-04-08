//
//  HomeScenePresenterMockl.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
import The_Hitchhiker_Prophecy

class HomeScenePresenterMock: HomeScenePresentationLogic {
    
    // MARK: - Properties
    
    var displayView: HomeSceneDisplayView?
    var didChangeTheViewLayout: Bool = false
    var didPresentCharactersScreen: Bool = false
    
    // MARK: - Functions
    
    func presentCharacters(_ response: HomeScene.Search.Response) {
        didPresentCharactersScreen = true
    }
    
    func changePresentationLayout() {
        didChangeTheViewLayout = true
    }
}
