//
//  HomeSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class HomeSceneViewController: UIViewController {
    
    // MARK: - Dependencies
    
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var charactersViewModel: [HomeScene.Search.ViewModel]?
    var collectionViewFlowLayout =  UICollectionViewFlowLayout()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.fetchCharacters()
        setupCharactersCollectionView()
        setupRightBarButtonItem()
    }
    
    // MARK: - Methods
    
    /* Setup characters collection view programatically and setup also the view layout */
    
    private func setupCharactersCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HomeCharacterCollectionViewCell", bundle: Bundle(for: HomeCharacterCollectionViewCell.self)), forCellWithReuseIdentifier: "HomeCharacterCollectionViewCell")
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        presentCollectionViewHorizontally()
    }
    
    /* Add right navigation bar button item */
    
    private func setupRightBarButtonItem() {
        let barButtonItem = UIBarButtonItem(
            title: "Change layout",
            style: .done,
            target: self,
            action: #selector(changeCollectionViewLayout))
        barButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    /* Calls the interactor to delegate the changing of the presentation style to the presenter to be displayed on the view */
    
    @objc
    private func changeCollectionViewLayout() {
        interactor?.changePresentationLayout()
    }
}

// MARK: - extensions

extension HomeSceneViewController: HomeSceneDisplayView {
    
    /* This method changes the scroll direction to horizonal */
    
    func presentCollectionViewHorizontally() {
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = collectionViewFlowLayout
    }
    
    /* This method changes the scroll direction to vertical */
    
    func presentCollectionViewVertically() {
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionView.collectionViewLayout = collectionViewFlowLayout
    }
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        self.charactersViewModel = viewModel
        collectionView.reloadData()
    }
    
    /* This method presented an error popup in case get characters api returns an error */
    
    func failedToFetchCharacters(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension HomeSceneViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToCharacterDetailsWithCharacter(at: indexPath.row)
    }
}

extension HomeSceneViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCharacterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCharacterCollectionViewCell", for: indexPath) as! HomeCharacterCollectionViewCell
        cell.configure(with: charactersViewModel![indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return charactersViewModel?.count ?? 0
    }
}

extension HomeSceneViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionViewFlowLayout.scrollDirection == .horizontal {
            return CGSize(width: collectionView.frame.size.width - 80, height: collectionView.frame.size.height)
        }
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height * 0.3)
    }
}
