//
//  LocationRemoteDataSource.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 08/06/22.
//

import RxSwift
import Alamofire

final class LocationRemoteDataSource {

  func searchLocation(keyword: String) -> Observable<[LocationResult]> {

    let url = "https://api.weatherapi.com/v1/search.json?key=\(API_KEY)&q=\(keyword)"
    let newUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

    return Observable<[LocationResult]>.create { observer in
      AF.request(newUrl!)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: [LocationResult].self) { response in
          switch response.result {
          case let .success(locations):
            observer.onNext(locations)
            observer.onCompleted()
          case let .failure(error):
            observer.onError(error)
          }
        }
      return Disposables.create()
    }
  }
}
