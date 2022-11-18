//
//  AddView.swift
//  todios
//
//  Created by Piyush Pandey on 18/11/22.
//

import SwiftUI

struct AddView: View {
	// dismiss a view
	@Environment(\.presentationMode) var presentationMode
	
	@EnvironmentObject var listViewModel: ListViewModel
	
	@State var textField: String = ""
	@State var alertTitle: String = ""
	@State var showAlert: Bool = false
	
    var body: some View {
			ScrollView {
				VStack {
					TextField("Type something...", text: $textField)
						.padding(.horizontal)
						.frame(height: 55)
						.background(.gray.opacity(0.3))
						.cornerRadius(10)
					
					Button(action: saveButton) {
						Text("Save")
							.foregroundColor(.white)
							.frame(height: 55)
							.frame(maxWidth: .infinity)
							.background(Color.orange)
							.cornerRadius(10)
					}
				}
				.padding()
			}
			.navigationTitle("Add a todo")
			.alert(isPresented: $showAlert, content: getAlert)
    }
	
	func saveButton() {
		if textIsValid() {
			listViewModel.addItem(title: textField)
			presentationMode.wrappedValue.dismiss()
		}
	}
	
	func textIsValid() -> Bool {
		if textField.count < 3 {
			alertTitle = "Your ToDo item should have at least 3 characters!"
			showAlert.toggle()
			return false
		}
		return true
	}
	
	func getAlert() -> Alert {
		return Alert(title: Text(alertTitle))
	}
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
