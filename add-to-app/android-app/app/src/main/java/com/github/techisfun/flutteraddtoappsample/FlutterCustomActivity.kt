package com.github.techisfun.flutteraddtoappsample

import android.content.Context
import android.content.Intent
import android.os.Bundle
import com.github.techisfun.flutter_shared.Protos
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister.registerGeneratedPlugins
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

const val CHANNEL = "com.github.techisfun/defaultChannel"

class FlutterCustomActivity: FlutterActivity() {

    companion object {
        const val EXTRA_PERSON = "person"

        /**
         * Static intent factory to start {@link FlutterBookActivity} with the singleton
         * {@link FlutterEngine} the application started.
         *
         * The activity launched from this intent shows the details of the {@link Api.Book}
         * supplied.
         */
        fun withPerson(context: Context, person: Protos.Person): Intent {
            return CachedEngineBookIntentBuilder(FLUTTER_ENGINE_ID)
                .build(context)
                .putExtra(
                    EXTRA_PERSON,
                    person.toByteArray()
                )
            /*return Intent(context, FlutterCustomActivity::class.java).apply {
                putExtra(EXTRA_PERSON, person.toByteArray())
            }*/
        }
    }

    private var person: Protos.Person? = null

    class CachedEngineBookIntentBuilder(engineId: String): CachedEngineIntentBuilder(FlutterCustomActivity::class.java, engineId) { }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getPerson") {
                person.let {
                    if (it != null) {
                        result.success(it.toByteArray())
                    } else {
                        result.error("UNAVAILABLE", "person not available.", null)
                    }
                }
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        person = intent?.getByteArrayExtra(EXTRA_PERSON)?.let { Protos.Person.parseFrom(it) }


    }
}