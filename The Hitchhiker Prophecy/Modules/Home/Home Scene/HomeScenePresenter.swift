//
//  HomeScenePresenter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

public class HomeScenePresneter {
    
    // MARK: - Dependencies
    
    weak public var displayView: HomeSceneDisplayView?
    public var charactersCollectionPrestationStyle: PresentationStyle = .horizontal
    
    // MARK: - Nested Types
    
    /* This enum is used to change the layout of the view's collection view to be displayed vertically/horizontally */
    
    public enum PresentationStyle {
        case horizontal
        case vertical
    }
    
    // MARK: - Initializers
    
    public init(displayView: HomeSceneDisplayView) {
        self.displayView = displayView
    }
}

// MARK: - extensions

extension HomeScenePresneter: HomeScenePresentationLogic {
        
    // MARK: - Methods
    
    /* This method is used to change the value the presentation style then display the selected presentation style on the view */
    
    public func changePresentationLayout() {
        if charactersCollectionPrestationStyle == .horizontal {
            charactersCollectionPrestationStyle = .vertical
            displayView?.presentCollectionViewVertically()
        } else {
            charactersCollectionPrestationStyle = .horizontal
            displayView?.presentCollectionViewHorizontally()
        }
    }
    
    /* This method is used to map the mapping model properties to the view model to be displayed on the view */
    
    public func mapCharatersOutputToViewModel(with output: Characters.Search.Output) -> [HomeScene.Search.ViewModel] {
        
        return output.data.results.map { characterOutput -> HomeScene.Search.ViewModel in
            return HomeScene.Search.ViewModel(name: characterOutput.name, desc: characterOutput.resultDescription, imageUrl: "\(characterOutput.thumbnail.path).\(characterOutput.thumbnail.thumbnailExtension)", comics: characterOutput.comics.collectionURI, series: characterOutput.series.collectionURI, stories: characterOutput.stories.collectionURI, events: characterOutput.events.collectionURI)
        }
    }
    
    public func presentCharacters(_ response: HomeScene.Search.Response) {
        switch response {
        case .success(let output):
            self.displayView?.didFetchCharacters(viewModel: self.mapCharatersOutputToViewModel(with: output))
        case .failure(let error):
            self.displayView?.failedToFetchCharacters(error: error)
        }
    }
}
