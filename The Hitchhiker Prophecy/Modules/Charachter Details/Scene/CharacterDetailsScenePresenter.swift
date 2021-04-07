//
//  CharacterDetailsScenePresenter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright (c) 2020 SWVL. All rights reserved.
//
//  Just remember presenters takes models and produces viewmodels
//

public final class CharacterDetailsScenePresenter {
    
    // MARK: - Stored properties
    
    weak public var displayView: CharacterDetailsSceneDisplayLogic?
    
    // MARK: - Initializers
    
    public init(displayView: CharacterDetailsSceneDisplayLogic) {
        self.displayView = displayView
    }
}

// MARK: - CharacterDetailsPresentationLogic Methods

extension CharacterDetailsScenePresenter: CharacterDetailsScenePresentationLogic {
    
    public func presentCharacter(_ response: CharacterDetailsScene.FetchCharacter.Response) {
        let imageUrl = "\(response.thumbnail.path)/\(CharacterDetailsScene.Constants.ImageSize.Portrait.uncanny.rawValue).\(response.thumbnail.thumbnailExtension)"
        let viewModel = CharacterDetailsScene.FetchCharacter.ViewModel(name: response.name,
                                                                       description: response.resultDescription,
                                                                       imageURL: imageUrl)
        displayView?.didFetchCharacter(viewModel: viewModel)
    }
}
