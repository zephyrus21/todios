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
		ScrollView {
			VStack(spacing: 20) {
				Text("There are no items!!")
					.bold()
					.font(.title)
				
				NavigationLink(destination: AddView(), label: {
					Text("Add Something")
						.bold()
						.foregroundColor(.white)
						.frame(height: 50)
						.frame(maxWidth: .infinity)
				})
				.background(animate ? Color.orange : Color.accentColor)
				.cornerRadius(10)
				.padding(.horizontal, animate ? 30 : 50)
				.shadow(color: animate ? Color.orange.opacity(0.5) : Color.accentColor.opacity(0.5), radius: 15, x: 0, y: animate ? 20 : 40)
			}
			.multilineTextAlignment(.center)
			.padding()
			.onAppear(perform: addAnimation)
		}.frame(maxWidth: .infinity, maxHeight: .infinity)
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
