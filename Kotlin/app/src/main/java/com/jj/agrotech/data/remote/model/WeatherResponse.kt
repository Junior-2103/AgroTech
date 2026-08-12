package com.jj.agrotech.data.remote.model

import com.google.gson.annotations.SerializedName
data class CurrentWeather(
    @SerializedName("temperature_2m")
    val temperature: Double,
    @SerializedName("relative_humidity_2m")
    val humidity: Int,
    @SerializedName("wind_speed_10m")
    val windSpeed: Double,

    val precipitation: Double,

    @SerializedName("cloud_cover")
    val cloudCover: Int,

    @SerializedName("weather_code")
    val weatherCode: String
)

data class WeatherResponse(
    val latitude: Double,
    val longitude: Double,

    @SerializedName("current")
    val currentWeather: CurrentWeather
)
