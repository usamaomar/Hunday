package com.mycompany.hyundai

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterFragmentActivity() {
//    private val EVENTS = "myapp.test.com/events"
//    private var linksReceiver: BroadcastReceiver? = null
//    private val CHANNEL = "myapp.test.com/channel"
//    private var startString: String? = null
//
//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine)
//        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
//            if (call.method == "initialLink") {
//                if (startString != null) {
//                    result.success(startString)
//                }
//            }
//        }
//        EventChannel(flutterEngine.dartExecutor, EVENTS).setStreamHandler(
//            object : EventChannel.StreamHandler {
//                override fun onListen(args: Any?, events: EventChannel.EventSink) {
//                    linksReceiver = createChangeReceiver(events)
//                }
//
//                override fun onCancel(args: Any?) {
//                    linksReceiver = null
//                }
//            }
//        )
//    }
//    fun createChangeReceiver(events: EventChannel.EventSink): BroadcastReceiver? {
//        return object : BroadcastReceiver() {
//            override fun onReceive(context: Context, intent: Intent) { // NOTE: assuming intent.getAction() is Intent.ACTION_VIEW
//                val dataString = intent.dataString ?:
//                events.error("UNAVAILABLE", "Link unavailable", null)
//                events.success(dataString)
//            }
//        }
//    }
//    override fun onNewIntent(intent: Intent) {
//        super.onNewIntent(intent)
//        if (intent.action === Intent.ACTION_VIEW) {
//
//            println()
////            linksReceiver?.onReceive(this.applicationContext, intent)
//        }
//    }

}
