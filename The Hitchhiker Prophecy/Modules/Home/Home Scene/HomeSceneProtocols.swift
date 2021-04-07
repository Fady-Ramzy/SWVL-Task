//
//  HomeSceneProtocols.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/12/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

public protocol HomeSceneDisplayView: class {
    var interactor: HomeSceneBusinessLogic? { get }
    var router: HomeSceneRoutingLogic? { get }
    var charactersViewModel: [HomeScene.Search.ViewModel]? { set get }
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel])
    func failedToFetchCharacters(error: Error)
    func presentCollectionViewHorizontally()
    func presentCollectionViewVertically()
}

public protocol HomeSceneBusinessLogic: class {
    var worker: HomeWorkerType { get }
    var presenter: HomeScenePresentationLogic { get }
    
    func fetchCharacters()
    func changePresentationLayout()
}

public protocol HomeScenePresentationLogic: class {
    var displayView: HomeSceneDisplayView? { get }
    
    func presentCharacters(_ response: HomeScene.Search.Response)
    func changePresentationLayout()
}

public protocol HomeSceneDataStore: class {
    var result: Characters.Search.Results? { get }
}

public protocol HomeSceneDataPassing: class {
    var dataStore: HomeSceneDataStore? { get }
}

public protocol HomeSceneRoutingLogic: class {
    var viewController: (HomeSceneDisplayView & UIViewController)? { get }
    
    func routeToCharacterDetailsWithCharacter(at index: Int)
}

public protocol HomeWorkerType {
    func getCharacters(_ input: Characters.Search.Input, completion: @escaping (HomeScene.Search.Response) -> Void)
}
