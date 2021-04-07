//
//  CharacterDetailsPresenterTest.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/7/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
import The_Hitchhiker_Prophecy

class CharacterDetailsPresenterTest: XCTestCase {

    // MARK: - Properties
    
    var sut: CharacterDetailsScenePresenter!
    var view: CharacterDetailsMockView!
    var response: CharacterDetailsScene.FetchCharacter.Response!
    
    // MARK: - View life cycle
    
    override func setUpWithError() throws {
       response = CharacterDetailsScene.FetchCharacter.Response(id: 1, name: "Character One", resultDescription: "Character Description", modified: "Yes modified", thumbnail: Characters.Search.Character.Thumbnail(path: "Path", thumbnailExtension: ".jpg"), resourceURI: "URI", comics: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), series: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), stories: Characters.Search.Character.Stories(available: 10, collectionURI: "URI", items: [], returned: 10), events: Characters.Search.Character.Comics(available: 1, collectionURI: "URI", items: [], returned: 10), urls: [])
        view = CharacterDetailsMockView()
        sut = CharacterDetailsScenePresenter(displayView: view)
    }

    override func tearDownWithError() throws {
        view = nil
        sut = nil
        response = nil
    }
    
    // MARK: - Methods

    func test_presentCharacter_whenSpecificCharacterIsSelected_shouldCallViewDidFetchCharacter() {
        
        // Given
        // When
        
        sut.presentCharacter(response)
        
        // Then
        
        XCTAssertTrue(view.didFetchCharacter)
    }
    
    
    func test_presentCharacter_whenSpecificCharacterIsSelectedWithData_viewModelShouldNotBeNil() {
        
        // Given
        // When
        
        sut.presentCharacter(response)
        
        // Then
        
        XCTAssertNotNil(view.viewModel)
    }
}
