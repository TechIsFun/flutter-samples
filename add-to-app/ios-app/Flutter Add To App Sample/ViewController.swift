//
//  ViewController.swift
//  Flutter Add To App Sample
//
//  Created by Andrea on 21/01/22.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a button to call the showFlutter function when pressed.
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
    }

    @objc func showFlutter() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController =
            FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.modalPresentationStyle = .fullScreen
        
        // Pigeon
        NativeApiSetup(flutterViewController.binaryMessenger, NativeApiImpl())
        
        // Protobuf
        let methodChannel = FlutterMethodChannel(name: "com.github.techisfun/defaultChannel",
                                                      binaryMessenger: flutterViewController.binaryMessenger)
        methodChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                if call.method == "getPerson" {
                    let person = Person.with {
                        $0.name = "iOS Person"
                    }
                    do {
                        result(try person.serializedData())
                    } catch {
                        result(FlutterError(code: "Cannot serialize data", message: nil, details: nil))
                    }
                }
            })

        
        present(flutterViewController, animated: true, completion: nil)
    }
}

