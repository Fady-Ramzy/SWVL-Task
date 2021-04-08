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
    
    /* This method is used to present the returned array of characters */
    
    public func presentCharacters(_ response: [Characters.Search.Character]) {
        self.displayView?.didFetchCharacters(viewModel: self.mapCharatersOutputToViewModel(with: response))
    }
    
    /* This method is used to present the error on the view for the user */
    
    public func handleError(with error: NetworkError) {
        self.displayView?.failedToFetchCharacters(error: error)
    }
    
    public func changePresentationLayout() {
        if charactersCollectionPrestationStyle == .horizontal {
            charactersCollectionPrestationStyle = .vertical
            displayView?.presentCollectionViewVertically()
        } else {
            charactersCollectionPrestationStyle = .horizontal
            displayView?.presentCollectionViewHorizontally()
        }
    }
    
    public func mapCharatersOutputToViewModel(with output: [Characters.Search.Character]) -> [HomeScene.Search.ViewModel] {
        
        return output.map { characterOutput -> HomeScene.Search.ViewModel in
            return HomeScene.Search.ViewModel(name: characterOutput.name, desc: characterOutput.resultDescription, imageUrl: "\(characterOutput.thumbnail.path).\(characterOutput.thumbnail.thumbnailExtension)", comics: characterOutput.comics.collectionURI, series: characterOutput.series.collectionURI, stories: characterOutput.stories.collectionURI, events: characterOutput.events.collectionURI)
        }
    }
}
