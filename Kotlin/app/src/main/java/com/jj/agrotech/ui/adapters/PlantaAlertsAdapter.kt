package com.jj.agrotech.ui.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import com.jj.agrotech.R
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
            val context = holder.binding.root.context

            val lineBinding = ItemPlantAlertLineBinding.inflate(
                LayoutInflater.from(context),
                holder.binding.llAlertContainer,
                false
            )

            val (severityColor, textTypeColor) = when (alert.severity) {
                AlertSeverity.ALERT -> ContextCompat.getColor(context,R.color.alert) to ContextCompat.getColor(context, R.color.alert_text)
                AlertSeverity.WARNING -> ContextCompat.getColor(context,R.color.warning) to ContextCompat.getColor(context, R.color.warning_text)
                AlertSeverity.RECOMENDED -> ContextCompat.getColor(context,R.color.recomended) to ContextCompat.getColor(context, R.color.recomended_text)
            }

            lineBinding.tvAlertType.text = when (alert.severity) {
                AlertSeverity.ALERT -> "Perigo"
                AlertSeverity.WARNING -> "Alerta"
                AlertSeverity.RECOMENDED -> "Recomendado"
            }
            lineBinding.tvAlertType.setTextColor(textTypeColor)


            lineBinding.tvAlertMessage.text = alert.message

            lineBinding.viewSeverityIndicator.setBackgroundColor(severityColor)

            holder.binding.llAlertContainer.addView(lineBinding.root)
        }

    }

    override fun getItemCount(): Int = items.size

}