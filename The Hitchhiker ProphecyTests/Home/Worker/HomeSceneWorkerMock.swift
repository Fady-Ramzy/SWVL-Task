//
//  HomeSceneWorkerMock.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Fady Ramzy on 4/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
import The_Hitchhiker_Prophecy

class HomeSceneWorkerMock: HomeWorkerType {
    
    // MARK: - Functions
    
    func getCharacters(_ input: Characters.Search.Input, completion: @escaping (HomeScene.Search.Response) -> Void) {
        completion(.success)
        switch <#value#> {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
    }
}
