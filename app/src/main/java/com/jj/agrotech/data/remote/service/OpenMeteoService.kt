package com.jj.agrotech.data.remote.service

import com.jj.agrotech.data.remote.model.WeatherResponse
import retrofit2.http.GET
import retrofit2.http.Query

interface OpenMeteoService {
    @GET("v1/forecast")
    suspend fun getWeather (
        @Query("latitude") latitude: Double,
        @Query("longitude") longitude: Double,
        @Query("current") current: String
    ) : WeatherResponse
}