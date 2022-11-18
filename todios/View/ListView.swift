//
//  ListView.swift
//  todios
//
//  Created by Piyush Pandey on 18/11/22.
//

import SwiftUI

struct ListView: View {
	@EnvironmentObject var listViewModel: ListViewModel
	
	var body: some View {
		ZStack {
			if listViewModel.items.isEmpty {
				NoListView()
					.transition(AnyTransition.opacity.animation(.easeIn))
			} else {
				List{
					ForEach(listViewModel.items) { item in
						ListRowView(item: item)
							.onTapGesture {
								withAnimation(.easeOut(duration: 1.1)){
									listViewModel.updateItem(item: item)
								}
							}
					}.onDelete(perform: listViewModel.deleteItem)
						.onMove(perform: listViewModel.moveItem)
				}
			}
		}
		.navigationTitle("Todo List 🖌")
					 .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
	}
}

struct ListView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView{
			ListView()
		}.environmentObject(ListViewModel())
	}
}
