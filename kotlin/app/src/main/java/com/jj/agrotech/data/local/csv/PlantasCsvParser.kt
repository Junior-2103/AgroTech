package com.jj.agrotech.data.local.csv

import android.content.Context
import com.github.doyaaaaaken.kotlincsv.client.CsvReader
import com.jj.agrotech.data.local.entity.Planta

class PlantasCsvParser {

    suspend fun parseCsv(context: Context) : List<Planta> {
        val csv = context.assets.open("Principais_Culturas_Agricolas_Brasil.csv")
        val listPlantas = mutableListOf<Planta>()

        CsvReader().open(csv) {
            readAllWithHeaderAsSequence().forEach { row: Map<String, String> ->
                val planta = Planta(
                    produto = row["produto"]!!,
                    categoria = row["categoria"]!!,
                    tempMinSuportada = row["temp_min_suportada"]!!.toInt(),
                    tempMaxSuportada = row["temp_max_suportada"]!!.toInt(),
                    tempIdealMin = row["temp_ideal_min"]!!.toFloat(),
                    tempIdealMax = row["temp_ideal_max"]!!.toFloat(),
                    aguaNecessariaMin = row["agua_necessaria_min"]?.toFloatOrNull(),
                    aguaNecessariaMax = row["agua_necessaria_max"]?.toFloatOrNull(),
                    frequenciaIrrigacao = row["frequencia_irrigacao"]!!,
                    climaIdeal = row["clima_ideal"]!!,
                    luzSolarHDia = row["luz_solar_h_dia"]!!.toInt(),
                    chuvaIdealMin = row["chuva_ideal_min"]!!.toFloat(),
                    chuvaIdealMax = row["chuva_ideal_max"]!!.toFloat(),
                    velVentoMax = row["vel_vento_max"]!!.toInt(),
                    umidadeIdealMin = row["umidade_ideal_min"]!!.toFloat(),
                    umidadeIdealMax = row["umidade_ideal_max"]!!.toFloat(),
                    nebulosidadeIdeal = row["nebulosidade_ideal"]!!,
                    uvIdealMin = row["uv_ideal_min"]!!.toFloat(),
                    uvIdealMax = row["uv_ideal_max"]!!.toFloat(),
                    tempoCultivoMin = row["tempo_cultivo_min"]!!.toFloat(),
                    tempoCultivoMax = row["tempo_cultivo_max"]!!.toFloat(),
                    tempoCultivoUnidade = row["tempo_cultivo_unidade"]!!,
                    soloIdeal = row["solo_ideal"]!!,
                    irrigacaoTipoEspecial = row["irrigacao_tipo_especial"],
                )
                listPlantas.add(planta)
            }
        }

        return listPlantas
    }

}