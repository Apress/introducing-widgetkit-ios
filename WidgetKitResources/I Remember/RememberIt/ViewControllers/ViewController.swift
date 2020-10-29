//
//  ViewController.swift
//  RememeberIt
//
//  Created by Stewart Lynch on 2020-09-13.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedItem:RememberItItem?
    private var dataSource = RememberItItemsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showItem" {
            if let vc = segue.destination as? DetailViewController {
                vc.updateItem = updateItem
                vc.deleteItem = deleteItem
                vc.switchPrimary = switchPrimary
                vc.item = selectedItem
            }
        } else if segue.identifier == "newItem" {
            if let navVC = segue.destination as? UINavigationController, let vc = navVC.children.first as? DetailViewController {
                vc.newItem = newItem
            }
        }
    }
    
    // MARK: - CRUD Operations
    func newItem(item: RememberItItem) {
        dataSource.newItem(item: item)
        collectionView.reloadData()
    }
    
    func updateItem(item: RememberItItem) {
        dataSource.updateItem(item: item) { indexPath in
            collectionView.reloadItems(at: [indexPath])
        }
    }
    
    func deleteItem(item: RememberItItem) {
        dataSource.deleteItem(item: item) { indexPath in
            collectionView.deleteItems(at: [indexPath])
        }
    }

    func switchPrimary(item: RememberItItem) {
        dataSource.switchPrimary(item: item) { indexPaths in
            collectionView.reloadItems(at: indexPaths)
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = dataSource.rememberItItems[indexPath.item]
        performSegue(withIdentifier: "showItem", sender: nil)
    }
}


