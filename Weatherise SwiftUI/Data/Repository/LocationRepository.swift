//
//  LocationRepository.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 08/06/22.
//

import RxSwift

class LocationRepository: LocationRepositoryProtocol {

  private var remoteDataSource: LocationRemoteDataSource
  private var localDataSource: LocationLocalDataSource

  init(remoteDataSource: LocationRemoteDataSource, localDataSource: LocationLocalDataSource) {
    self.remoteDataSource = remoteDataSource
    self.localDataSource = localDataSource
  }

  func searchLocation(keyword: String) -> Observable<[LocationResult]> {
    return remoteDataSource.searchLocation(keyword: keyword)
  }
}
