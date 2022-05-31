//
//  WeatherRepositoryProtocol.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation

protocol WeatherRepositoryProtocol {
  func fetchWeather(location: CLLocation, completion: @escaping(CurrentWeather) -> ())
}
