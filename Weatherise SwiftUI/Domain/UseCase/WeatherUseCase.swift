//
//  WeatherUseCase.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation

protocol WeatherUseCase {
  func fetchWeather(location: CLLocation, completion: @escaping(CurrentWeather) -> ())
}
