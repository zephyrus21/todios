//
//  ItemModel.swift
//  todios
//
//  Created by Piyush Pandey on 17/11/22.
//

import Foundation

struct ItemModel: Identifiable, Codable {
	let title: String
	let isCompleted: Bool
	let id: String
	
	init(title: String, isCompleted: Bool, id: String = UUID().uuidString) {
		self.title = title
		self.isCompleted = isCompleted
		self.id = id
	}
	
	func updateCompleted() -> ItemModel {
		return ItemModel(title: title, isCompleted: !isCompleted, id: id)
	}
}
