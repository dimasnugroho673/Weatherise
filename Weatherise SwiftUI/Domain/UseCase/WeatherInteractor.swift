//
//  WeatherInteractor.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation

class WeatherInteractor: WeatherUseCase {

  private let repository: WeatherRepository

  init(repository: WeatherRepository) {
    self.repository = repository
  }

  func fetchWeather(location: CLLocation, completion: @escaping (CurrentWeather) -> ()) {
    repository.fetchWeather(location: location) { weather in
      completion(weather)
    }
  }
}
