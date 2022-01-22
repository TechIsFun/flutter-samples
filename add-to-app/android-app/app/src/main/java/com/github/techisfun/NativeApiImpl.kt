package com.github.techisfun

class NativeApiImpl: PigeonApi.NativeApi {

    override fun getPerson(): PigeonApi.PersonMessageModel {
        val personMessageModel = PigeonApi.PersonMessageModel().apply {
            name = "Pigeon Android"
        }

        return personMessageModel
    }
}