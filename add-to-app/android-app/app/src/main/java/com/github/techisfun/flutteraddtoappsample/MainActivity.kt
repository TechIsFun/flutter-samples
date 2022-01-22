package com.github.techisfun.flutteraddtoappsample

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import com.github.techisfun.flutter_shared.Protos

import io.flutter.embedding.android.FlutterActivity;

class MainActivity : AppCompatActivity() {

    private lateinit var loading: ViewGroup

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loading = findViewById(R.id.loading)

        val person = Protos.Person.newBuilder()
            .setName("Android Person")
            .build()

        val button: View = findViewById(R.id.button)
        button.setOnClickListener {
            loading.visibility = View.VISIBLE
            //startActivity(FlutterActivity.withCachedEngine(FLUTTER_ENGINE_ID).build(this))
            startActivity(FlutterCustomActivity.withPerson(this, person))
        }

    }

    override fun onResume() {
        super.onResume()

        loading.visibility = View.GONE
    }
}