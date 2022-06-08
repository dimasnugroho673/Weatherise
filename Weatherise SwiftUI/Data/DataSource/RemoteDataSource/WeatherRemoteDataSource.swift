//
//  WeatherRemoteDataSource.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 01/06/22.
//

import Foundation
import CoreLocation
import Alamofire
import RxSwift

final class WeatherRemoteDataSource {
  
  func fetchCurrentWeather(location: CLLocationCoordinate2D) -> Observable<Weather> {

    let url = "https://api.weatherapi.com/v1/current.json?key=\(API_KEY)&q=\(location.latitude),\(location.longitude)&aqi=yes"
    let newUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

    return Observable<Weather>.create { observer in
      AF.request(newUrl!)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: Weather.self) { response in
          switch response.result {
          case let .success(weather):
            observer.onNext(weather)
            observer.onCompleted()
          case let .failure(error):
            observer.onError(error)
          }
        }
      return Disposables.create()
    }
  }
}
