//
//  WeatherRemoteDataSource.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 01/06/22.
//

import Foundation
import CoreLocation

final class WeatherRemoteDataSource {
  func fetchWeather(location: CLLocation, completion: @escaping (CurrentWeather) -> ()) {
    completion(CurrentWeather(status: "Tess aja bro berhasil kan"))
  }
}
