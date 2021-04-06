//
//  HomeScenePresenter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeScenePresneter {
    
    // MARK: - Dependencies
    
    weak var displayView: HomeSceneDisplayView?
    
    // MARK: - Initializers
    
    init(displayView: HomeSceneDisplayView) {
        self.displayView = displayView
    }
}

// MARK: - extensions

extension HomeScenePresneter: HomeScenePresentationLogic {
    
    // MARK: - Methods
    
    private func mapCharatersOutputToViewModel(with output: Characters.Search.Output) -> [HomeScene.Search.ViewModel] {
        
        return output.data.results.map { characterOutput -> HomeScene.Search.ViewModel in
            return HomeScene.Search.ViewModel(name: characterOutput.name, desc: characterOutput.resultDescription, imageUrl: "\(characterOutput.thumbnail.path).\(characterOutput.thumbnail.thumbnailExtension)", comics: characterOutput.comics.collectionURI, series: characterOutput.series.collectionURI, stories: characterOutput.stories.collectionURI, events: characterOutput.events.collectionURI)
        }
    }
    
    func presentCharacters(_ response: HomeScene.Search.Response) {
        switch response {
        case .success(let output):
            self.displayView?.didFetchCharacters(viewModel: self.mapCharatersOutputToViewModel(with: output))
        case .failure(let error):
            self.displayView?.failedToFetchCharacters(error: error)
        }
    }
}
