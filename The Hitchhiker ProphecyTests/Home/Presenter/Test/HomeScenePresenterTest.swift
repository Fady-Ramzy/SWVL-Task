//
//  HomeScenePresenterTest.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeScenePresenterTest: XCTestCase {
    
    // MARK: - Properties
    
    var sut: HomeScenePresneter!
    var view: HomeSceneMockView!
    var characterOne: Characters.Search.Character!
    var characterTwo: Characters.Search.Character!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        view = HomeSceneMockView()
        sut = HomeScenePresneter(displayView: view)
        characterOne = Characters.Search.Character(id: 1, name: "Character One", resultDescription: "Character Description", modified: "Yes modified", thumbnail: Characters.Search.Character.Thumbnail(path: "Path", thumbnailExtension: ".jpg"), resourceURI: "URI", comics: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), series: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), stories: Characters.Search.Character.Stories(available: 10, collectionURI: "URI", items: [], returned: 10), events: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), urls: [])
        
        characterTwo = Characters.Search.Character(id: 1, name: "Character One", resultDescription: "Character Description", modified: "Yes modified", thumbnail: Characters.Search.Character.Thumbnail(path: "Path", thumbnailExtension: ".jpg"), resourceURI: "URI", comics: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), series: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), stories: Characters.Search.Character.Stories(available: 10, collectionURI: "URI", items: [], returned: 10), events: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), urls: [])
    }
    
    override func tearDownWithError() throws {
        view = nil
        sut = nil
        characterOne = nil
        characterTwo = nil
    }
    
    // MARK: - Methods
    
    func test_changePresentationLayout_whenPresentationStyleIsHorizontal_shouldChangePresentationStyleToVertical() {
        // Given
        
        sut.charactersCollectionPrestationStyle = .horizontal
        
        // When
        
        sut.changePresentationLayout()
        
        // Then
        
        XCTAssertEqual(sut.charactersCollectionPrestationStyle, .vertical)
    }
    
    func test_changePresentationLayout_whenPresentationStyleIsVertical_shouldChangePresentationStyleToHorizontal() {
        
        // Given
        
        sut.charactersCollectionPrestationStyle = .vertical
        
        // When
        
        sut.changePresentationLayout()
        
        // Then
        
        XCTAssertEqual(sut.charactersCollectionPrestationStyle, .horizontal)
    }
    
    func test_changePresentationLayout_whenPresentationStyleIsVertical_shouldChangeViewLayoutToHorizontal() {
        
        // Given
        
        sut.charactersCollectionPrestationStyle = .vertical
        
        // When
        
        sut.changePresentationLayout()
        
        // Then
        
        XCTAssertTrue(view.isCollectionViewPresentedHorizontally)
    }
    
    func test_changePresentationLayout_whenPresentationStyleIsHorizontal_shouldChangeViewLayoutToVertical() {
        
        // Given
        
        sut.charactersCollectionPrestationStyle = .horizontal
        
        // When
        
        sut.changePresentationLayout()
        
        // Then
        
        XCTAssertTrue(view.isCollectionViewPresentedVertically)
    }
    
    func test_mapCharatersOutputToViewModel_whenDataReturnedWithSuccess_shouldNumberReturnMappedCharacters() {
        // Given
        // When
        
        let charactersViewModels = sut.mapCharatersOutputToViewModel(with: [characterOne, characterTwo])
        
        // Then
        
        XCTAssertEqual(charactersViewModels.count, 2)
    }
    
    func test_presentCharacters_whenDataIsReturnedWithSuccess_shouldCallDidFetchCharacters() {
        // Given
        // When
        
        sut.presentCharacters([characterOne, characterOne])
        
        // Then
        
        XCTAssertTrue(view.didFetchCharacters)
    }
 
    func test_handleError_whenAPIReturnsAnError_shouldCallFailedToFetchCharactersWithCannotParseErrorDescription() {
        // Given
        // When
        
        sut.handleError(with: .cannotParseResponse)
        
        // Then
        
        XCTAssertFalse(view.returnedError.localizedDescription.isEmpty)
    }
    
    func test_handleError_whenAPIReturnsAnError_shouldCallFailedToFetchCharactersWithServerErrorDescription() {
        // Given
        // When
        
        sut.handleError(with: .server)
        
        // Then
        
        XCTAssertFalse(view.returnedError.localizedDescription.isEmpty)
    }
    
    func test_handleError_whenAPIReturnsAnError_shouldCallFailedToFetchCharactersWithUnknownErrorDescription() {
        // Given
        // When
        
        sut.handleError(with: .unknown)
        
        // Then
        
        XCTAssertFalse(view.returnedError.localizedDescription.isEmpty)
    }
    
    func test_handleError_whenAPIReturnsAnError_returnedErrorShouldNotBeNil() {
        // Given
        // When
        
        sut.handleError(with: .unknown)
        
        // Then
        
        XCTAssertNotNil(view.returnedError)
    }
}
