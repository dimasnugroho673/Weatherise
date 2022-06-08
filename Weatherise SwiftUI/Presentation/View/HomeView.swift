//
//  ContentView.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import SwiftUI
import CoreLocation

struct HomeView: View {

  @ObservedObject var weatherViewModel: HomeViewModel = HomeViewModel(useCase: Injection().provideHome(), locationService: LocationService())
  @ObservedObject var locationService: LocationService = LocationService()

  var body: some View {
    NavigationView {
        ZStack {
          generateBackground

          header

          VStack {
            countryAndTime

            Spacer()

            Divider()
              .frame(width: UIScreen.main.bounds.width - 20, height: 1)
              .background(Color.white)
              .opacity(0.7)
              .cornerRadius(8)

            footer
              .padding(.top, 5)
              .padding(.bottom, 85)
          }
          .padding(.top, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: .infinity)
        .onAppear {
          weatherViewModel.fetchWeather(location: locationService.coodinate)
          print("WAKTU: \(generateWeatherConditionInString(condition: weatherViewModel.currentWeather?.condition.text ?? ""))")
        }
        .onReceive(locationService.$coodinate) { location in
          weatherViewModel.fetchWeather(location: locationService.coodinate)
          print("DEBUG: location update: \(locationService.coodinate))")
        }
    }
  }

  private var generateBackground: some View {
    Image(generateWeatherBackgroundName(timeInString: generateTimeInString(epoch: String(weatherViewModel.currentWeather?.lastUpdatedEpoch ?? Int(0.0))), weatherInString: String(generateWeatherConditionInString(condition: weatherViewModel.currentWeather?.condition.text ?? ""))))
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

  private var header: some View {
    VStack {
      HStack {
        Image(systemName: "magnifyingglass")
          .resizable()
          .renderingMode(.original)
          .frame(width: 20, height: 20)
          .foregroundColor(Color.white)
          .padding(.top, 30)

        Spacer()

        Image(systemName: "list.bullet.circle")
          .resizable()
          .renderingMode(.original)
          .frame(width: 20, height: 20)
          .foregroundColor(Color.white)
          .padding(.top, 30)

      }
      .padding(.horizontal, 20)
      .frame(width: UIScreen.main.bounds.width, height: 95)
      .edgesIgnoringSafeArea(.top)

      Spacer()
    }
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
    }
    .padding(.horizontal, 20)
    .frame(width: UIScreen.main.bounds.width, height: .infinity, alignment: .leading)
  }

  private var footer: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 10) {
        AdditionalWeatherInfoCard(iconHeader: "eye.fill", title: "visibility", value: String(weatherViewModel.currentWeather?.visKM ?? 0), unit: "KM")
          .padding(.leading, 10)

        AdditionalWeatherInfoCard(iconHeader: "thermometer", title: "feels like", value: String(weatherViewModel.currentWeather?.feelslikeC ?? 0.0), unit: "℃")

        AdditionalWeatherInfoCard(iconHeader: "humidity", title: "humidity", value: String(weatherViewModel.currentWeather?.humidity ?? 0), unit: "%")

        AdditionalWeatherInfoCard(iconHeader: "eye.fill", title: "visibility", value: String(weatherViewModel.currentWeather?.visKM ?? 0), unit: "KM")
          .padding(.trailing, 10)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
