package com.jj.agrotech.ui.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.jj.agrotech.data.local.entity.Planta
import com.jj.agrotech.databinding.ItemPlantAlertBinding
import com.jj.agrotech.databinding.ItemPlantAlertLineBinding
import com.jj.agrotech.domain.Alert
import com.jj.agrotech.domain.AlertSeverity

class PlantaAlertsAdapter (
    val items: List<Pair<Planta, List<Alert>>>
) : RecyclerView.Adapter<PlantaAlertsAdapter.ViewHolder>() {
    class ViewHolder(val binding: ItemPlantAlertBinding) : RecyclerView.ViewHolder(binding.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): ViewHolder {
        val binding = ItemPlantAlertBinding.inflate(
            LayoutInflater.from(parent.context),
            parent,
            false
        )
        return ViewHolder(binding)
    }

    override fun onBindViewHolder(
        holder: ViewHolder,
        position: Int
    ) {
        val ( planta, alerts ) = items[position]

        holder.binding.tvAlertPlant.text = planta.produto
        holder.binding.llAlertContainer.removeAllViews()

        alerts.forEach { alert ->
            val lineBinding = ItemPlantAlertLineBinding.inflate(
                LayoutInflater.from(holder.binding.root.context),
                holder.binding.llAlertContainer,
                false
            )

            lineBinding.tvAlertType.text = alert.severity.name

            lineBinding.tvAlertMessage.text = alert.message

            val color = when (alert.severity) {
                AlertSeverity.ALERT -> android.graphics.Color.RED
                AlertSeverity.WARNING -> android.graphics.Color.YELLOW
                AlertSeverity.RECOMENDED -> android.graphics.Color.GREEN
            }

            lineBinding.viewSeverityIndicator.setBackgroundColor(color)

            holder.binding.llAlertContainer.addView(lineBinding.root)
        }

    }

    override fun getItemCount(): Int = items.size

}