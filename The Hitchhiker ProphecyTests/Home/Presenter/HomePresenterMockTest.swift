//
//  HomePresenterMockTest.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/6/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
import The_Hitchhiker_Prophecy

class HomePresenterMockTest: XCTestCase {
    
    // MARK: - Properties
    
    var presenter: HomeScenePresneter!
    var view: HomeSceneSpyView!
    var results: Characters.Search.Results!
    var output: Characters.Search.Output!
    var characterOne: Characters.Search.Character!
    var characterTwo: Characters.Search.Character!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        view = HomeSceneSpyView()
        presenter = HomeScenePresneter(displayView: view)
        characterOne = Characters.Search.Character(id: 1, name: "Character One", resultDescription: "Character Description", modified: "Yes modified", thumbnail: Characters.Search.Character.Thumbnail(path: "Path", thumbnailExtension: ".jpg"), resourceURI: "URI", comics: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), series: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), stories: Characters.Search.Character.Stories(available: 10, collectionURI: "URI", items: [], returned: 10), events: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), urls: [])
        
        characterTwo = Characters.Search.Character(id: 1, name: "Character One", resultDescription: "Character Description", modified: "Yes modified", thumbnail: Characters.Search.Character.Thumbnail(path: "Path", thumbnailExtension: ".jpg"), resourceURI: "URI", comics: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), series: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), stories: Characters.Search.Character.Stories(available: 10, collectionURI: "URI", items: [], returned: 10), events: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), urls: [])
        
        
        results = Characters.Search.Results(offset: 10, limit: 10, total: 10, count: 10, results: [characterOne, characterTwo])
        output = Characters.Search.Output(code: 10, status: "hhjbv", copyright: "", attributionText: "", attributionHTML: "", etag: "", data: results)
    }
    
    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        results = nil
        output = nil
        characterOne = nil
        characterTwo = nil
    }
    
    // MARK: - Methods
    
    func test_presentCharacters_whenReturnedResponseIsSuccess_shouldCallDidFetchCharacters() {
        // Given
        // When
        
        presenter.presentCharacters(.success(output))
        
        // Then
        
        XCTAssertTrue(view.didFetchCharacters)
    }
    
    func test_presentCharacters_whenReturnedResponseIsFailure_shouldCallFailedToFetchCharacters() {
        // Given
        // When
        
        presenter.presentCharacters(.failure(.server))
        
        // Then
        
        XCTAssertTrue(view.didReturnError)
    }
    
    func test_changePresentationLayout_whenPresentationStyleIsHorizontal_shouldChangePresentationStyleToVertical() {
        // Given
        
        presenter.charactersCollectionPrestationStyle = .horizontal
        
        // When
        
        presenter.changePresentationLayout()
        
        // Then
        
        XCTAssertEqual(presenter.charactersCollectionPrestationStyle, .vertical)
    }
    
    func test_changePresentationLayout_whenPresentationStyleIsVertical_shouldChangePresentationStyleToHorizontal() {
        
        // Given
        
        presenter.charactersCollectionPrestationStyle = .vertical
        
        // When
        
        presenter.changePresentationLayout()
        
        // Then
        
        XCTAssertEqual(presenter.charactersCollectionPrestationStyle, .horizontal)
    }
    
    func test_changePresentationLayout_whenPresentationStyleIsVertical_shouldChangeViewLayoutToHorizontal() {
        
        // Given
        
        presenter.charactersCollectionPrestationStyle = .vertical
        
        // When
        
        presenter.changePresentationLayout()
        
        // Then
        
        XCTAssertTrue(view.isCollectionViewPresentedHorizontally)
    }
    
    func test_changePresentationLayout_whenPresentationStyleIsHorizontal_shouldChangeViewLayoutToVertical() {
        
        // Given
        
        presenter.charactersCollectionPrestationStyle = .horizontal
        
        // When
        
        presenter.changePresentationLayout()
        
        // Then
        
        XCTAssertTrue(view.isCollectionViewPresentedVertically)
    }
    
    func test_mapCharatersOutputToViewModel_whenDataReturnedWithSuccess_shouldReturn() {
        // Given
        // When
        let charactersViewModels = presenter.mapCharatersOutputToViewModel(with: output)
        
        // Then
        
        XCTAssertEqual(charactersViewModels.count, 2)
    }
    
    func test_mapCharatersOutputToViewModel_whenDataReturnedWithSuccess_shouldDisplayReturnedCharacters() {
        // Given
        
        presenter.presentCharacters(.success(output))
            
        // When
        
        _ = presenter.mapCharatersOutputToViewModel(with: output)
        
        // Then
        
        XCTAssertEqual(view.numberOfReturnedCharacters, 2)
    }
}
