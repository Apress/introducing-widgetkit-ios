//
//  RememberItItemsDataSource.swift
//  RememberIt
//
//  Created by Stewart Lynch on 2020-09-13.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import UIKit

class RememberItItemsDataSource: NSObject {
    let store = Store()
    var rememberItItems:[RememberItItem]
    
    override init() {
        // Load Items from Storage
        self.rememberItItems = store.loadItems()
    }
    
    func newItem(item: RememberItItem) {
        rememberItItems.append(item)
        // Store Items
        store.saveItems(items: rememberItItems)
    }
    
    func updateItem(item: RememberItItem, completion: (IndexPath) -> Void) {
        let foundIndex = rememberItItems.firstIndex {$0.id == item.id}
        if let foundIndex = foundIndex {
            rememberItItems[foundIndex] = item
            // Store Items
            store.saveItems(items: rememberItItems)
            let indexPath = IndexPath.init(item: foundIndex, section: 0)
            completion(indexPath)
        }
    }

    func switchPrimary(item: RememberItItem, completion: ([IndexPath]) -> Void) {
        var indexPaths:[IndexPath] = []
        let oldIndex = rememberItItems.firstIndex { $0.isPrimary}
        if let oldIndex = oldIndex {
            rememberItItems[oldIndex].isPrimary = false
            let oldIndexPath = IndexPath.init(item: oldIndex, section: 0)
            indexPaths.append(oldIndexPath)
            let newIndex = rememberItItems.firstIndex { $0.id == item.id }
            if let newIndex = newIndex {
                let newIndexPath = IndexPath.init(item: newIndex, section: 0)
                indexPaths.append(newIndexPath)
            }
            // Store Items
            store.saveItems(items: rememberItItems)
            completion(indexPaths)
        }
    }
    
    func deleteItem(item: RememberItItem, completion: (IndexPath) -> Void) {
        let foundIndex = rememberItItems.firstIndex {$0.id == item.id}
        if let foundIndex = foundIndex {
            rememberItItems.remove(at: foundIndex)
            // Store Items
            store.saveItems(items: rememberItItems)
            let indexPath = IndexPath.init(item: foundIndex, section: 0)
            completion(indexPath)
        }
    }
}

extension RememberItItemsDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rememberItItems.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RememberItCell
        cell.item = rememberItItems[indexPath.item]
        return cell
    }
}
