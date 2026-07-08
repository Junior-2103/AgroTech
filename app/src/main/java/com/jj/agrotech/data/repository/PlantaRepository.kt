package com.jj.agrotech.data.repository

import android.content.Context
import com.jj.agrotech.data.local.DatabaseProvider
import com.jj.agrotech.data.local.csv.PlantasCsvParser
import com.jj.agrotech.data.local.entity.Planta

class PlantaRepository(val context: Context) {
    private val plantaDao = DatabaseProvider.getDatabase(context).plantaDao()
    private val csvParser = PlantasCsvParser()

    suspend fun placePlantas() {
        if (plantaDao.getCount() == 0){
            val listPlantas = csvParser.parseCsv(context)

            plantaDao.insertAll(listPlantas)
        }
    }

    suspend fun getAll() : List<Planta> {
        return plantaDao.getAll()
    }
}