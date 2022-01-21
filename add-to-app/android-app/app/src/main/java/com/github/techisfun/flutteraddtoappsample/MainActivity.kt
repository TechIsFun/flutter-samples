package com.github.techisfun.flutteraddtoappsample

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.ViewGroup

import io.flutter.embedding.android.FlutterActivity;

class MainActivity : AppCompatActivity() {

    private lateinit var loading: ViewGroup

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loading = findViewById(R.id.loading)

        val button: View = findViewById(R.id.button)
        button.setOnClickListener {
            loading.visibility = View.VISIBLE
            startActivity(FlutterActivity
                .withCachedEngine(FLUTTER_ENGINE_ID)
                .build(this))
        }

    }

    override fun onResume() {
        super.onResume()

        loading.visibility = View.GONE
    }
}