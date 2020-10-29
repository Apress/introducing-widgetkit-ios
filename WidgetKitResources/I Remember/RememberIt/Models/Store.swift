//
//  Store.swift
//  RememberIt
//
//  Created by Stewart Lynch on 2020-09-13.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation

class Store {

    let JSONURL = URL(fileURLWithPath: "RememberItItems",
                           relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")

     func loadItems() -> [RememberItItem] {
      let decoder = JSONDecoder()
      var items:[RememberItItem] = []

      do {
        let itemData = try Data(contentsOf: JSONURL)
        items = try decoder.decode([RememberItItem].self, from: itemData)
      } catch let error {
        print(error)
      }
      return items
    }

       func saveItems(items:[RememberItItem]) {
      let encoder = JSONEncoder()

      do {
        let itemData = try encoder.encode(items)
        try itemData.write(to: JSONURL, options: .atomicWrite)
      } catch let error {
        print(error)
      }
    }
}
