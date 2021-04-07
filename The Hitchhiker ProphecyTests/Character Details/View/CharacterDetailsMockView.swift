//
//  CharacterDetailsMockView.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/7/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
import The_Hitchhiker_Prophecy

class CharacterDetailsMockView: CharacterDetailsSceneDisplayLogic {
    
    // MARK: - Properties
    
    var didFetchCharacter: Bool = false
    var viewModel: CharacterDetailsScene.FetchCharacter.ViewModel!
    
    // MARK: - Dependencies
    
    var interactor: CharacterDetailsSceneBusinessLogic?
    
    // MARK: - Methods
    
    func didFetchCharacter(viewModel: CharacterDetailsScene.FetchCharacter.ViewModel) {
        didFetchCharacter = true
        self.viewModel = viewModel
    }
}
