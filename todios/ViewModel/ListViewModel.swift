//
//  ListViewModel.swift
//  todios
//
//  Created by Piyush Pandey on 17/11/22.
//

import Foundation

class ListViewModel: ObservableObject {
	@Published var items: [ItemModel] = [] {
		didSet {
			saveItems()
		}
	}
	
	let itemsKey: String = "items_List"
	
	init() {
		getItems()
	}
	
	func getItems() {
		guard let data = UserDefaults.standard.data(forKey: itemsKey) else {
			return
		}
		
		guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {
			return
		}
		
		self.items = savedItems
	}
	
	func saveItems() {
		if let encodeData = try? JSONEncoder().encode(items) {
			UserDefaults.standard.set(encodeData, forKey: itemsKey)
		}
	}
}
