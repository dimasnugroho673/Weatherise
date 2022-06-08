//
//  Injection.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 01/06/22.
//

class Injection {
  // untuk menangani dependecy pada View layer

  func provideHome() -> WeatherInteractor {
    let dataSource = WeatherRemoteDataSource()
    let repository = WeatherRepository(remoteDataSource: dataSource)

    return WeatherInteractor(repository: repository)
  }

  func provideLocation() -> LocationInteractor {
    let remoteDataSource = LocationRemoteDataSource()
    let localDataSource = LocationLocalDataSource()
    let repository = LocationRepository(remoteDataSource: remoteDataSource, localDataSource: localDataSource)

    return LocationInteractor(repository: repository)
  }
}
