//
//  ContentView.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import SwiftUI
import CoreLocation

struct HomeView: View {

  @ObservedObject var weatherViewModel: HomeViewModel = HomeViewModel(useCase: Injection().provideHome())

  var body: some View {
    VStack {
      if weatherViewModel.isLoading != true {
        Text("\(weatherViewModel.location?.name ?? "")")
        Text("\(weatherViewModel.currentTempC)℃")
          .font(Font.system(size: 56, weight: .regular))
      Text("\(weatherViewModel.currentWeather?.condition.text ?? "")")
      } else {
        Text("Loading")
          .padding()
      }
    }
    .onAppear {
      weatherViewModel.fetchWeather(location: CLLocation(latitude: 0.916696, longitude: 104.4548317))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
