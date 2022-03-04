//
//  NativeApiImpl.swift
//  Flutter Add To App Sample
//
//  Created by Andrea on 22/01/22.
//

import Foundation
import Flutter

class NativeApiImpl: NSObject, NativeApi {
    
    func getPersonWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> PersonMessageModel? {
        let person = PersonMessageModel()
        person.name = "IOS Pigeon"
        
        return person
    }
    
}
