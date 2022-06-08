//
//  SearchLocationView.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 08/06/22.
//

import SwiftUI

struct SearchLocationView: View {

  @Environment(\.presentationMode) var presentationMode

  init() {
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
  }

  var body: some View {
    NavigationView {
      ZStack {
        Color.black.edgesIgnoringSafeArea(.all)

        Text("hei")
          .foregroundColor(Color.white)
      }

      .navigationBarTitle(Text("Title"))
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Text("Cancel")
              .foregroundColor(Color.white)
          }
        }

        ToolbarItemGroup(placement: .confirmationAction) {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Text("Done")
              .foregroundColor(Color.white)
          }
        }
      }
    }
  }
}

struct SearchLocationView_Previews: PreviewProvider {
  static var previews: some View {
    SearchLocationView()
  }
}
