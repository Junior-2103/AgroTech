package com.jj.agrotech.data.remote

import com.jj.agrotech.data.remote.service.OpenMeteoService
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitProvider {
    private val retrofit = Retrofit.Builder()
        .baseUrl("https://api.open-meteo.com/")
        .addConverterFactory(GsonConverterFactory.create())
        .build()

    val openMeteoService: OpenMeteoService = retrofit.create(OpenMeteoService::class.java)
}