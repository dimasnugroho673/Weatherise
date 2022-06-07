//
//  ContentView.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import SwiftUI
import CoreLocation

struct HomeView: View {

  @ObservedObject var weatherViewModel: HomeViewModel = HomeViewModel(useCase: Injection().provideHome())

  var body: some View {
    ZStack {
      generateBackground

      countryAndTime
    }
    .frame(width: UIScreen.main.bounds.width, height: .infinity)
    .onAppear {
      weatherViewModel.fetchWeather(location: CLLocation(latitude: 0.916696, longitude: 104.4548317))
    }
  }

  private var generateBackground: some View {
    Image("img-weather-bg-sunset-clear")
      .resizable()
      .edgesIgnoringSafeArea(.all)
      .aspectRatio(contentMode: .fill)
      .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
      .overlay(
        Rectangle()
          .background(Color.black)
          .opacity(0.2)
          .edgesIgnoringSafeArea(.all)
      )
  }

  private var countryAndTime: some View {
    VStack(alignment: .leading) {
      Text("\(weatherViewModel.location?.name ?? "")")
        .font(Font.system(size: 30, weight: .semibold))
        .foregroundColor(Color.white)
        .padding(.top, 30)

      Text(weatherViewModel.currentWeather?.lastUpdated ?? "")
        .font(Font.system(size: 16, weight: .bold))
        .foregroundColor(Color.white)

      Text("\(weatherViewModel.currentTempC)°")
        .font(Font.system(size: 90, weight: .bold))
        .foregroundColor(Color.white)
        .padding(.bottom, -10)

      HStack(alignment: .center, spacing: 12) {
        Image(systemName: generateWeatherIcon(condition: weatherViewModel.currentWeather?.condition.text ?? ""))
          .resizable()
          .renderingMode(.original)
          .aspectRatio(contentMode: .fill)
          .foregroundColor(Color.white)
          .font(Font.system(size: 30, weight: .bold))
          .frame(width: 30, height: 30)

        Text(weatherViewModel.currentWeather?.condition.text ?? "")
          .font(Font.system(size: 16, weight: .bold))
          .foregroundColor(Color.white)
      }

      Spacer()
    }
    .padding(.horizontal, 20)
    .frame(width: UIScreen.main.bounds.width, height: .infinity, alignment: .leading)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
