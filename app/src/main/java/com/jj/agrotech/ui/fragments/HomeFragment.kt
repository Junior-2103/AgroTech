package com.jj.agrotech.ui.fragments

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.core.content.ContextCompat
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.jj.agrotech.data.repository.PlantaRepository
import com.jj.agrotech.data.repository.WeatherRepository
import com.jj.agrotech.databinding.FragmentHomeBinding
import com.jj.agrotech.domain.AlertSystem
import com.jj.agrotech.domain.usecase.GetAlertsUseCase
import com.jj.agrotech.ui.adapters.PlantaAlertsAdapter
import com.jj.agrotech.ui.util.WeatherCodeMapper
import kotlinx.coroutines.launch

class HomeFragment : Fragment() {

    private lateinit var binding: FragmentHomeBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentHomeBinding.inflate(
            inflater,
            container,
            false
        )
        return binding.root
    }

    @SuppressLint("SetTextI18n")
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val plantaRepository = PlantaRepository(requireContext())
        val weatherRepository = WeatherRepository()
        val weatherCodeMapper = WeatherCodeMapper()
        val alertSystem = AlertSystem()
        val useCase = GetAlertsUseCase(plantaRepository,weatherRepository,alertSystem)

        viewLifecycleOwner.lifecycleScope.launch {
            val useCaseResult = useCase.execute()

            if (useCaseResult.isSuccess) {
                val (weather, plantasAlerts) = useCaseResult.getOrNull()!!
                val (idImage, message) = weatherCodeMapper.weatherCodeToText(weather.currentWeather.weatherCode.toInt())

                binding.tvTemperature.text = "${weather.currentWeather.temperature.toInt()}ºC"
                binding.tvHumidity.text = "${weather.currentWeather.humidity}%"
                binding.tvWind.text = "${weather.currentWeather.windSpeed} km/h"
                binding.tvPrecipitation.text = "${weather.currentWeather.precipitation} mm"
                binding.tvCondition.text = message

                val drawable = ContextCompat.getDrawable(requireContext(),idImage)

                binding.ivWeather.setImageDrawable(drawable)

                val plantasWithAlerts = plantasAlerts.filterValues { it.isNotEmpty() }
                val listAdapter = plantasWithAlerts.toList()
                val recyclerViewAlert : RecyclerView = binding.rvAlerts
                recyclerViewAlert.layoutManager = LinearLayoutManager(requireContext())
                recyclerViewAlert.adapter = PlantaAlertsAdapter(listAdapter)
            } else {
                Toast.makeText(
                    requireContext(),
                    "Não foi possivel carregar o clima, Verifique a conexão",
                    Toast.LENGTH_LONG
                ).show()
            }

        }

    }
}