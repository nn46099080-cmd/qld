package com.qldalert.app

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.os.Build
import android.widget.RemoteViews
import org.json.JSONObject
import java.net.HttpURLConnection
import java.net.URL
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import kotlin.math.abs

class QldPriceWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        updateWidgets(context, appWidgetManager, appWidgetIds)
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)

        if (intent.action == ACTION_REFRESH) {
            val manager = AppWidgetManager.getInstance(context)
            val ids = manager.getAppWidgetIds(
                ComponentName(context, QldPriceWidgetProvider::class.java),
            )
            updateWidgets(context, manager, ids)
        }
    }

    private fun updateWidgets(
        context: Context,
        manager: AppWidgetManager,
        ids: IntArray,
    ) {
        if (ids.isEmpty()) return

        for (id in ids) {
            manager.updateAppWidget(id, loadingViews(context))
        }

        Thread {
            val snapshot = runCatching { fetchSnapshot() }.getOrNull()
            for (id in ids) {
                val views = if (snapshot == null) {
                    errorViews(context)
                } else {
                    snapshotViews(context, snapshot)
                }
                manager.updateAppWidget(id, views)
            }
        }.start()
    }

    private fun loadingViews(context: Context): RemoteViews =
        baseViews(context).apply {
            setTextViewText(R.id.widget_high_value, "--")
            setTextViewText(R.id.widget_price_value, "--")
            setTextViewText(R.id.widget_change_value, "Updating...")
            setTextColor(R.id.widget_change_value, Color.parseColor("#94A3B8"))
        }

    private fun errorViews(context: Context): RemoteViews =
        baseViews(context).apply {
            setTextViewText(R.id.widget_high_value, "--")
            setTextViewText(R.id.widget_price_value, "--")
            setTextViewText(R.id.widget_change_value, "Refresh failed")
            setTextColor(R.id.widget_change_value, Color.parseColor("#F87171"))
        }

    private fun snapshotViews(context: Context, snapshot: QldWidgetSnapshot): RemoteViews =
        baseViews(context).apply {
            setTextViewText(R.id.widget_high_value, formatMoney(snapshot.tenYearHigh))
            setTextViewText(R.id.widget_price_value, formatMoney(snapshot.currentPrice))
            setTextViewText(R.id.widget_change_value, snapshot.changeText)
            setTextColor(R.id.widget_change_value, snapshot.changeColor)
            setTextViewText(R.id.widget_updated_value, snapshot.updatedText)
        }

    private fun baseViews(context: Context): RemoteViews {
        val views = RemoteViews(context.packageName, R.layout.qld_price_widget)

        val openIntent = context.packageManager.getLaunchIntentForPackage(context.packageName)
            ?: Intent(context, MainActivity::class.java)
        val openPendingIntent = PendingIntent.getActivity(
            context,
            0,
            openIntent,
            pendingIntentFlags(),
        )
        views.setOnClickPendingIntent(R.id.widget_root, openPendingIntent)

        val refreshIntent = Intent(context, QldPriceWidgetProvider::class.java).apply {
            action = ACTION_REFRESH
        }
        val refreshPendingIntent = PendingIntent.getBroadcast(
            context,
            1,
            refreshIntent,
            pendingIntentFlags(),
        )
        views.setOnClickPendingIntent(R.id.widget_refresh, refreshPendingIntent)
        return views
    }

    private fun fetchSnapshot(): QldWidgetSnapshot {
        val data = JSONObject(fetchText(WIDGET_URL))
        val currentPrice = data.optDouble("currentPrice", 0.0)
        val previousClose = data.optDouble("previousClose", 0.0)
        val tenYearHigh = data.optDouble("tenYearHigh", 0.0)
        val percent = data.optDouble("previousCloseChangePercent", 0.0)
        val sign = when {
            percent > 0 -> "+"
            percent < 0 -> "-"
            else -> ""
        }
        val changeText = if (currentPrice > 0 && previousClose > 0) {
            "전일 대비 $sign${String.format(Locale.US, "%.2f", abs(percent))}%"
        } else {
            "전일 대비 --"
        }
        val changeColor = when {
            percent > 0 -> Color.parseColor("#22C55E")
            percent < 0 -> Color.parseColor("#F87171")
            else -> Color.parseColor("#94A3B8")
        }

        return QldWidgetSnapshot(
            currentPrice = currentPrice,
            tenYearHigh = tenYearHigh,
            changeText = changeText,
            changeColor = changeColor,
            updatedText = SimpleDateFormat("HH:mm", Locale.KOREA).format(Date()),
        )
    }

    private fun fetchText(url: String): String {
        val connection = (URL(url).openConnection() as HttpURLConnection).apply {
            requestMethod = "GET"
            connectTimeout = 8000
            readTimeout = 8000
            setRequestProperty("Accept", "application/json")
            setRequestProperty("User-Agent", "qld-android-widget")
        }

        return try {
            val code = connection.responseCode
            val stream = if (code in 200..299) {
                connection.inputStream
            } else {
                connection.errorStream
            }
            val body = stream.bufferedReader().use { it.readText() }
            if (code !in 200..299) {
                throw IllegalStateException("HTTP $code: $body")
            }
            body
        } finally {
            connection.disconnect()
        }
    }

    private fun formatMoney(value: Double): String =
        if (value > 0) "$${String.format(Locale.US, "%.2f", value)}" else "--"

    private fun pendingIntentFlags(): Int =
        PendingIntent.FLAG_UPDATE_CURRENT or
            (if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                PendingIntent.FLAG_IMMUTABLE
            } else {
                0
            })

    private data class QldWidgetSnapshot(
        val currentPrice: Double,
        val tenYearHigh: Double,
        val changeText: String,
        val changeColor: Int,
        val updatedText: String,
    )

    companion object {
        private const val ACTION_REFRESH = "com.qldalert.app.widget.REFRESH"
        private const val WIDGET_URL =
            "https://billowing-band-06cd.nn46099080.workers.dev/widget"
    }
}
