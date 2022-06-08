//
//  SearchLocationView.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 08/06/22.
//

import SwiftUI
import RxSwift

struct LocationView: View {

  @Environment(\.presentationMode) var presentationMode

  @ObservedObject var locationViewModel: LocationViewModel = LocationViewModel(useCase: Injection().provideLocation())

  @State var keyword: String = ""
  @State var searchFieldFocus: Bool = false

  init() {
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]

    UITableView.appearance().backgroundColor = .clear // tableview background
            UITableViewCell.appearance().backgroundColor = .clear // cell background
  }

  var body: some View {
    NavigationView {
      ZStack {
        Color.black.edgesIgnoringSafeArea(.all)

        VStack {
          TextField("Search for a city", text: $locationViewModel.keyword)
            .padding(7)
            .padding(.horizontal, 25)
            .padding(.leading, 4)
            .font(.system(size: 16))
            .frame(width: UIScreen.main.bounds.width - 20) // bound width - icon message
            .background(Color.gray.opacity(0.3))
            .foregroundColor(Color.gray)
            .cornerRadius(8)
            .overlay(
              Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .font(.system(size: 14))
            )
            .onTapGesture {
              self.searchFieldFocus = true
            }
            .onReceive(locationViewModel.$keyword.debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)) { output in
              guard !output.isEmpty else { return }

              if output.count >= 3 {
                self.locationViewModel.getLocation(keyword: output)
              }
            }

          Spacer()

          List(locationViewModel.locationResults, id: \.name) { location in
            Text("\(location.name), \(location.region), \(location.region)")
          }
          .listStyle(.plain)
        }
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
    LocationView()
  }
}
