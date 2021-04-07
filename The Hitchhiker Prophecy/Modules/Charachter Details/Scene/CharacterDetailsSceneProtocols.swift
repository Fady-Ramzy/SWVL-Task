//
//  CharacterDetailsSceneProtocols.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright (c) 2020 SWVL. All rights reserved.
//
//  Looks like you're cooking something intersting 🚀
//

import Foundation

public protocol CharacterDetailsSceneDisplayLogic: class {
    var interactor: CharacterDetailsSceneBusinessLogic? { get }
    
    func didFetchCharacter(viewModel: CharacterDetailsScene.FetchCharacter.ViewModel)
}

public protocol CharacterDetailsSceneBusinessLogic: class {
    func fetchCharacter()
}

protocol CharacterDetailsSceneDataStore: class {
    var presenter: CharacterDetailsScenePresentationLogic { get }
    var character: Characters.Search.Character { get }
}

public protocol CharacterDetailsScenePresentationLogic: class {
    var displayView: CharacterDetailsSceneDisplayLogic? { get }
    
    func presentCharacter(_ response: CharacterDetailsScene.FetchCharacter.Response)
}
