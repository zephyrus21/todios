//
//  NoTodoView.swift
//  todios
//
//  Created by Piyush Pandey on 18/11/22.
//

import SwiftUI

struct NoListView: View {
	@State var animate: Bool = false
	
	var body: some View {
		Text("Hello, Bitch")
	}
	
	func addAnimation() {
		guard !animate else {return}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
			withAnimation(Animation
				.easeInOut(duration: 2.0)
				.repeatForever()
			) {
				animate.toggle()
			}
		}
	}
}

struct NoListView_Previews: PreviewProvider {
	static var previews: some View {
		NoListView()
	}
}
