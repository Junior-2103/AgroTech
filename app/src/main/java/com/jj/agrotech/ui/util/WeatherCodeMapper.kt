package com.jj.agrotech.ui.util

import com.jj.agrotech.R

class WeatherCodeMapper {
    fun weatherCodeToText(weatherCode: Int) : Pair<Int,String> {
        return when (weatherCode) {
            0 -> R.drawable.ic_home_clear to "Céu limpo"
            in 1..3 -> R.drawable.ic_home_cloudy to "Parcialmente nublado"
            in 45..48 -> R.drawable.ic_home_cloudy to "Neblina"
            in 51..67 -> R.drawable.ic_home_rain to "Chuvisco/Chuva"
            in 71..77 -> R.drawable.ic_home_snow to "Neve"
            in 80..99 -> R.drawable.ic_home_storm to "Tempestade"
            else -> R.drawable.ic_launcher_foreground to "Indefinido"
        }
    }
}