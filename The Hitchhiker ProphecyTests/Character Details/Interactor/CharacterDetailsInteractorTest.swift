//
//  CharacterDetailsInteractorTest.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class CharacterDetailsInteractorTest: XCTestCase {

    // MARK: - Properties
    
    var sut: CharacterDetailsSceneInteractor!
    var presenter: CharacterDetailsPresenterMock!
    var character: Characters.Search.Character!
    
    // MARK: - View life cycle
    
    override func setUpWithError() throws {
        presenter = CharacterDetailsPresenterMock()
        character = Characters.Search.Character(id: 1, name: "Character One", resultDescription: "Character Description", modified: "Yes modified", thumbnail: Characters.Search.Character.Thumbnail(path: "Path", thumbnailExtension: ".jpg"), resourceURI: "URI", comics: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), series: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), stories: Characters.Search.Character.Stories(available: 10, collectionURI: "URI", items: [], returned: 10), events: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), urls: [])
        sut = CharacterDetailsSceneInteractor(character: character, presenter: presenter)
    }

    override func tearDownWithError() throws {
        sut = nil
        presenter = nil
        character = nil
    }
    
    // MARK: - Methods

    func test_fetchCharacter_whenSpecificCharacterIsSelected_shouldPresentTheSeelectedCharacter() {
        
        // Given
        // When
        sut.fetchCharacter()
        
        // Then
        
        XCTAssertTrue(presenter.didSelectCharacter)
    }
    
    func test_fetchCharacter_whenSpecificCharacterIsSelected_selectedCharacterShouldNotBeNil() {
        
        // Given
        // When
        sut.fetchCharacter()
        
        // Then
        
        XCTAssertNotNil(presenter.selectedCharacter)
    }
}
