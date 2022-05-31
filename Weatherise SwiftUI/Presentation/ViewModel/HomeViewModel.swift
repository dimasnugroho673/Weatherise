//
//  HomeViewModel.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation

class HomeViewModel: ObservableObject {

  private var useCase: WeatherUseCase = WeatherInteractor(repository: WeatherRepository(remoteDataSource: WeatherRemoteDataSource()))

  func fetchWeather(location: CLLocation) {
    useCase.fetchWeather(location: location) { weather in
      print("DEBUG: viewModel: result: \(weather)")
    }
  }
}

//class Injection: NSObject {
//  func provideHome() {
//
//  }
//}
