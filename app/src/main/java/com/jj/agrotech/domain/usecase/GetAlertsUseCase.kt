package com.jj.agrotech.domain.usecase

import com.jj.agrotech.data.local.entity.Planta
import com.jj.agrotech.data.remote.model.WeatherResponse
import com.jj.agrotech.data.repository.PlantaRepository
import com.jj.agrotech.data.repository.WeatherRepository
import com.jj.agrotech.domain.Alert
import com.jj.agrotech.domain.AlertSystem

class GetAlertsUseCase(
    private val plantaRepository: PlantaRepository,
    private val weatherRepository: WeatherRepository,
    private val alertSystem: AlertSystem
) {
    suspend fun execute() : Result<Pair<WeatherResponse,Map<Planta, List<Alert>>>> {
        val weatherResult = weatherRepository.getWeather()

        if (weatherResult.isFailure) {
            return Result.failure(weatherResult.exceptionOrNull()!!)
        }

        val plantasAlerts = mutableMapOf<Planta, List<Alert>>()
        val weather = weatherResult.getOrNull()!!

        plantaRepository.getAll().forEach { planta ->
            val alerts = alertSystem.checkAll(planta, weather)
            plantasAlerts[planta] = alerts
        }

        return Result.success(weather to plantasAlerts )
    }
}