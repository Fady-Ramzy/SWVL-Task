//
//  CharacterDetailsSceneInteractor.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright (c) 2020 SWVL. All rights reserved.
//
//  Looks like you're cooking something intersting 🚀
//

public final class CharacterDetailsSceneInteractor: CharacterDetailsSceneDataStore {
    
    // MARK: - Stored properties
    
    let character: Characters.Search.Character
    let presenter: CharacterDetailsScenePresentationLogic
    
    // MARK: Initializers
    
    public init(character: Characters.Search.Character, presenter: CharacterDetailsScenePresentationLogic) {
        self.character = character
        self.presenter = presenter
    }
}

// MARK: - CharacterDetailsBusinessLogic methods

extension CharacterDetailsSceneInteractor: CharacterDetailsSceneBusinessLogic {
    public func fetchCharacter() {
        presenter.presentCharacter(character)
    }
}
