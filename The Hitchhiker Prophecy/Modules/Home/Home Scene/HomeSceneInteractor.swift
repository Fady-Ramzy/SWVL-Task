//
//  HomeSceneInteractor.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeSceneInteractor: HomeSceneDataStore {
    
    // MARK: - Dependencies
    
    let worker: HomeWorkerType
    let presenter: HomeScenePresentationLogic
    
    // MARK: - Properties
    
    var result: Characters.Search.Results?
    
    // MARK: - Initializers
    
    init(worker: HomeWorkerType, presenter: HomeScenePresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }
}

extension HomeSceneInteractor: HomeSceneBusinessLogic {
    
    // MARK: - Methods
    
    /* This is method is used to change the layout of the collection view from (horizontal to vertical) & from (vertical to horizontal) */
    func changePresentationLayout() {
        presenter.changePresentationLayout()
    }
    
    func fetchCharacters() {
        
        let ts = "\(Date().timeIntervalSince1970)"
        let hash = (ts + NetworkConstants.privateKey + NetworkConstants.publicKey).stringToMD5()
        let limit = HomeScene.Search.Constants.searchPageLimit
        let offset = result?.offset ?? 0
        let input = Characters.Search.Input(timeStamp: ts, apiKey: NetworkConstants.publicKey, hash: hash, offset: offset, limit: limit, orderBy: .modifiedDateDescending)
        
        worker.getCharacters(input) { [weak self] (result) in
            switch result {
            case .success(let value):
                var newData = value
                var oldCharacters = self?.result?.results ?? []
                oldCharacters.append(contentsOf: newData.data.results)
                newData.data.results = oldCharacters
                self?.result = newData.data
                self?.presenter.presentCharacters(newData.data.results)
            case .failure(let error):
                self?.presenter.handleError(with: error)
            }
        }
    }
}
