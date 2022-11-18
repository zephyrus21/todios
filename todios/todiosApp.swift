//
//  todiosApp.swift
//  todios
//
//  Created by Piyush Pandey on 17/11/22.
//

import SwiftUI

@main
struct todiosApp: App {
	@StateObject var listViewModel: ListViewModel = ListViewModel()
	
    var body: some Scene {
        WindowGroup {
					NavigationView {
						ListView()
					}
					.environmentObject(listViewModel)
        }
    }
}
