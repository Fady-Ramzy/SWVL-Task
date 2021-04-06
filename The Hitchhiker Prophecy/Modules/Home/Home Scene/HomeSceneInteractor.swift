//
//  HomeSceneInteractor.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation
import CryptoKit

class HomeSceneInteractor: HomeSceneDataStore {
    
    let worker: HomeWorkerType
    let presenter: HomeScenePresentationLogic
    
    var result: Characters.Search.Results?
    
    init(worker: HomeWorkerType, presenter: HomeScenePresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }
}

extension HomeSceneInteractor: HomeSceneBusinessLogic {
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
            case .failure(let error):
                print(error)
            }
            self?.presenter.presentCharacters(result)
        }
    }
    
}

extension String {
    func stringToMD5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
}

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}
