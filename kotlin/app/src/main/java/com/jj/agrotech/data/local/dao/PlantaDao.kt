package com.jj.agrotech.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import com.jj.agrotech.data.local.entity.Planta

@Dao
interface PlantaDao {
    @Query("SELECT * FROM plantas")
    suspend fun getAll() : List<Planta>

    @Insert
    suspend fun insertAll(plantas: List<Planta>)

    @Query("SELECT COUNT(*) FROM plantas")
    suspend fun getCount() : Int
}