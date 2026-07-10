package com.jj.agrotech.data.repository

import com.jj.agrotech.data.remote.RetrofitProvider
import com.jj.agrotech.data.remote.model.WeatherResponse

class WeatherRepository {
    companion object {
        private const val LATITUDE = -23.4194
        private const val LONGITUDE = -51.4244
        private const val PARAMETERS = "temperature_2m,relative_humidity_2m,wind_speed_10m,precipitation,cloud_cover,weather_code"
    }

    suspend fun getWeather() : Result<WeatherResponse> {
        return runCatching {
            RetrofitProvider.openMeteoService.getWeather(
                LATITUDE,
                LONGITUDE,
                PARAMETERS
            )
        }
    }
}