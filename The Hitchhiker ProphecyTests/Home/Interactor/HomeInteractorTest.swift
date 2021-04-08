//
//  HomeInteractorTest.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeInteractorTest: XCTestCase {

    // MARK: - Dependencies
    
    var sut: HomeSceneInteractor!
    var worker: HomeSceneWorkerMock!
    var presenter: HomeScenePresenterMock!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        presenter = HomeScenePresenterMock()
        worker = HomeSceneWorkerMock()
        sut = HomeSceneInteractor(worker: worker, presenter: presenter)
    }

    override func tearDownWithError() throws {
        presenter = nil
        worker = nil
        sut = nil
    }
    
    // MARK: - Methods
    
    func test_changePresentationLayout_shouldChangeThePresentationLayout() {
        // Given
        // When
        
        sut.changePresentationLayout()
        
        // Then
        
        XCTAssertTrue(presenter.didChangeTheViewLayout)
    }

    func test_fetchCharacters_ifAPIReturnsSuccess_shouldReturnNumberOfReturnedCharacters() {
        // Given
        
        var characterOne: Characters.Search.Character! = Characters.Search.Character(id: 1, name: "Character One", resultDescription: "Character Description", modified: "Yes modified", thumbnail: Characters.Search.Character.Thumbnail(path: "Path", thumbnailExtension: ".jpg"), resourceURI: "URI", comics: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), series: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), stories: Characters.Search.Character.Stories(available: 10, collectionURI: "URI", items: [], returned: 10), events: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), urls: [])
        
        var characterTwo: Characters.Search.Character! = Characters.Search.Character(id: 1, name: "Character One", resultDescription: "Character Description", modified: "Yes modified", thumbnail: Characters.Search.Character.Thumbnail(path: "Path", thumbnailExtension: ".jpg"), resourceURI: "URI", comics: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), series: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), stories: Characters.Search.Character.Stories(available: 10, collectionURI: "URI", items: [], returned: 10), events: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), urls: [])
        var results: Characters.Search.Results! = Characters.Search.Results(offset: 10, limit: 10, total: 10, count: 10, results: [characterOne, characterTwo])
        var output: Characters.Search.Output! = Characters.Search.Output(code: 10, status: "OK", copyright: "Copy Right", attributionText: "Attributted Text", attributionHTML: "HTML", etag: "etag", data: results)
        
        worker.getCharactersResponse = .success(output)
        
        // When
        
        sut.fetchCharacters()
        
        // Then
        
        XCTAssertEqual(presenter.numberOFReturnedCharacters, 2)
        
        addTeardownBlock {
            characterOne = nil
            characterTwo = nil
            results = nil
            output = nil
        }
    }
    
    func test_fetchCharacters_ifAPIReturnsSuccess_shouldReturnSuccess() {
        // Given
        
        var results: Characters.Search.Results! = Characters.Search.Results(offset: 10, limit: 10, total: 10, count: 10, results: [])
        var output: Characters.Search.Output! = Characters.Search.Output(code: 10, status: "OK", copyright: "Copy Right", attributionText: "Attributted Text", attributionHTML: "HTML", etag: "etag", data: results)
        worker.getCharactersResponse = .success(output)
        
        // When
        
        sut.fetchCharacters()
        
        // Then
        
        XCTAssertTrue(presenter.didPresentCharactersScreen)
        
        addTeardownBlock {
            output = nil
            results = nil
        }
    }
    
    func test_fetchCharacters_responseCannotBeParsed_shouldReturnCannotParseResponseError() {
        // Given
        
        worker.getCharactersResponse = .failure(.cannotParseResponse)
        
        // When
        
        sut.fetchCharacters()
        
        // Then
        
        XCTAssertEqual(presenter.returnedError, .cannotParseResponse)
    }
    
    func test_fetchCharacters_serverIsNotWorkingCorrectly_shouldReturnServerError() {
        // Given
        
        worker.getCharactersResponse = .failure(.server)
        
        // When
        
        sut.fetchCharacters()
        
        // Then
        
        XCTAssertEqual(presenter.returnedError, .server)
    }
    
    func test_fetchCharacters_unknownErrorReturnedFromTheServer_shouldReturnUnknownError() {
        // Given
        
        worker.getCharactersResponse = .failure(.unknown)
        
        // When
        
        sut.fetchCharacters()
        
        // Then
        
        XCTAssertEqual(presenter.returnedError, .unknown)
    }
}
