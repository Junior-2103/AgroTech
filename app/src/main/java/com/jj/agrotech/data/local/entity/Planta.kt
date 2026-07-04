package com.jj.agrotech.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "plantas")
data class Planta(
    @PrimaryKey(autoGenerate = true)
    val id: Int = 0,
    val produto: String,
    val categoria: String,
    val tempMinSuportada: Int,
    val tempMaxSuportada: Int,
    val tempIdealMin: Float,
    val tempIdealMax: Float,
    val aguaNecessariaMin: Float?,
    val aguaNecessariaMax: Float?,
    val frequenciaIrrigacao: String,
    val climaIdeal: String,
    val luzSolarHDia: Int,
    val chuvaIdealMin: Float,
    val chuvaIdealMax: Float,
    val velVentoMax: Int,
    val umidadeIdealMin: Float,
    val umidadeIdealMax: Float,
    val nebulosidadeIdeal: String,
    val uvIdealMin: Float,
    val uvIdealMax: Float,
    val tempoCultivoMin: Float,
    val tempoCultivoMax: Float,
    val tempoCultivoUnidade: String,
    val soloIdeal: String,
    val irrigacaoTipoEspecial: String?

)