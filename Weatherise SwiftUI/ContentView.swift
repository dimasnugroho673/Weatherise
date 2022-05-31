//
//  ContentView.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import SwiftUI
import CoreLocation

struct ContentView: View {

  @ObservedObject var viewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
              viewModel.fetchWeather(location: CLLocation(latitude: 0.916696, longitude: 104.4548317))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
