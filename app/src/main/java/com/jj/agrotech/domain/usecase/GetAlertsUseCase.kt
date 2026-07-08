package com.jj.agrotech.domain.usecase

import com.jj.agrotech.data.local.entity.Planta
import com.jj.agrotech.data.repository.PlantaRepository
import com.jj.agrotech.data.repository.WeatherRepository
import com.jj.agrotech.domain.Alert
import com.jj.agrotech.domain.AlertSystem

class GetAlertsUseCase(
    private val plantaRepository: PlantaRepository,
    private val weatherRepository: WeatherRepository,
    private val alertSystem: AlertSystem
) {
    suspend fun execute() : Map<Planta, List<Alert>> {
        val plantasAlerts = mutableMapOf<Planta, List<Alert>>()
        val weather = weatherRepository.getWeather()

        plantaRepository.getAll().forEach { planta ->
            val alerts = alertSystem.checkAll(planta, weather)
            plantasAlerts[planta] = alerts
        }

        return plantasAlerts
    }
}