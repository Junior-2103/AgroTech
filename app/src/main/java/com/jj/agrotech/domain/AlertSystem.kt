package com.jj.agrotech.domain

import com.jj.agrotech.data.local.entity.Planta
import com.jj.agrotech.data.remote.model.WeatherResponse

enum class AlertSeverity {
    ALERT,
    WARNING,
    RECOMENDED
}

enum class AlertType {
    TEMPERATURE,
    HUMIDITY,
    WIND
}

data class Alert(
    val severity: AlertSeverity,
    val type: AlertType,
    val message: String
)

class AlertSystem {
    fun checkTemperature(planta: Planta, weather: WeatherResponse) : Alert? {
        val current = weather.currentWeather

        return when {
            current.temperature > planta.tempMaxSuportada -> Alert(
                AlertSeverity.ALERT, AlertType.TEMPERATURE,
                "Temperatura ${current.temperature}ºC muito alta, regue imediatamente")
            current.temperature < planta.tempMinSuportada -> Alert(
                AlertSeverity.ALERT, AlertType.TEMPERATURE,
                "Temperatura ${current.temperature}ºC muito baixa, proteja com cobertura ou estufa")
            current.temperature > planta.tempIdealMax -> Alert(
                AlertSeverity.WARNING, AlertType.TEMPERATURE,
                "Temperatura ${current.temperature}ºC alta, considere coloca-lá na sombra")
            current.temperature < planta.tempIdealMin -> Alert(
                AlertSeverity.WARNING, AlertType.TEMPERATURE,
                "Temperatura ${current.temperature}ºC baixa, evite regar à noite")
            else -> null
        }
    }

    fun checkHumidity(planta: Planta, weather: WeatherResponse) : Alert? {
        val current = weather.currentWeather

        return when {
            current.humidity > planta.umidadeIdealMax -> Alert(
                AlertSeverity.WARNING,AlertType.HUMIDITY,
                "Umidade ${current.humidity}% muito alta, coloque em um local ventilado"
            )
            current.humidity < planta.umidadeIdealMin -> Alert(
                AlertSeverity.WARNING, AlertType.HUMIDITY,
                "Umidade ${current.humidity}% muito baixa, regue frequentemente"
            )
            else -> null
        }
    }

    fun checkWind(planta: Planta, weather: WeatherResponse) : Alert? {
        val current = weather.currentWeather

        return if (current.windSpeed > planta.velVentoMax) Alert(
            AlertSeverity.ALERT, AlertType.WIND,
            "Velocidade ${current.windSpeed}km/h do vento muito alta, considere guarda-lá"
        ) else null
    }

    fun checkAll(planta: Planta, weather: WeatherResponse) : List<Alert> {
        return listOfNotNull(
            checkTemperature(planta,weather),
            checkHumidity(planta,weather),
            checkWind(planta,weather)
        )
    }
}