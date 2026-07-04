package com.jj.agrotech.data.local

import androidx.room.Database
import androidx.room.RoomDatabase
import com.jj.agrotech.data.local.dao.PlantaDao
import com.jj.agrotech.data.local.entity.Planta

@Database(entities = [Planta::class], version = 1)
abstract class AppDatabase : RoomDatabase() {
    abstract fun plantaDao() : PlantaDao
}