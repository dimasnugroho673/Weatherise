//
//  WeatherRemoteDataSource.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 01/06/22.
//

import Foundation
import CoreLocation
import Alamofire

final class WeatherRemoteDataSource {
  func fetchCurrentWeather(location: CLLocationCoordinate2D, completion: @escaping (Weather) -> ()) {

    // Using URLSession
//    let task = URLSession.shared.dataTask(with: URL(string: "https://api.weatherapi.com/v1/current.json?key=\(API_KEY)&q=Tanjungpinang&aqi=yes")!) { data, _, error in
//      if let error = error {
//        print("Failed fetch data with error: \(error.localizedDescription)")
//      }
//
//      if let data = data {
//        do {
//          let weather = try JSONDecoder().decode(Weather.self, from: data)
//
//          debugPrint(weather)
//        } catch {
//          print("Failed fetch data with error: \(error.localizedDescription)")
//        }
//      }
//    }
//
//    task.resume()

    AF.request("https://api.weatherapi.com/v1/current.json?key=\(API_KEY)&q=\(location.latitude),\(location.longitude)&aqi=yes")
      .validate(statusCode: 200..<300)
      .responseDecodable(of: Weather.self) { response in
        switch response.result {
        case let .success(weather):
          completion(weather)
        case let .failure(error):
          print("Failed fetch data with error: \(error.localizedDescription)")
        }
      }
  }
}
