//
//  WeatherRepository.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation

class WeatherRepository: WeatherRepositoryProtocol {

  private let remoteDataSource: WeatherRemoteDataSource

  init(remoteDataSource: WeatherRemoteDataSource) {
    self.remoteDataSource = remoteDataSource
  }

  func fetchWeather(location: CLLocation, completion: @escaping (CurrentWeather) -> ()) {
    remoteDataSource.fetchWeather(location: location) { weather in
      completion(weather)
    }
  }
}
