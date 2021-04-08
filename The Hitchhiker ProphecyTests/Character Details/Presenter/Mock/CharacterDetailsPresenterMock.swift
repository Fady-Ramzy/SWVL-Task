//
//  CharacterDetailsPresentertMock.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
import The_Hitchhiker_Prophecy

class CharacterDetailsPresenterMock: CharacterDetailsScenePresentationLogic {
    
    // MARK: - Properties
    
    var displayView: CharacterDetailsSceneDisplayLogic?
    var selectedCharacter: CharacterDetailsScene.FetchCharacter.Response!
    var didSelectCharacter : Bool = false
    
    // MARK: - Methods
    
    func presentCharacter(_ response: CharacterDetailsScene.FetchCharacter.Response) {
        didSelectCharacter = true
        selectedCharacter = response
    }
}
