//
//  CameraViewController.swift
//  fakestagram
//
//  Created by LuisE on 4/27/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class CameraViewController: UIViewController {
    let locationManager = CLLocationManager()
    let client = CreatePostClient()
    var currentLocation: CLLocation?

    //En este View Controller Noemí va a hacer lo referente al acceso a la cámara/biblioteca y selección de archivos
    override func viewDidLoad() {
        super.viewDidLoad()
        enableBasicLocationServices()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        locationManager.startUpdatingLocation()
        super.viewWillDisappear(animated)
    }

    @IBAction func onTapCapture(_ sender: Any) {
        print("posting....")
        let img = UIImage(named: "aurora")!
        createPost(img: img)
    }

    func enableBasicLocationServices() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("Disable location features")
        case .authorizedWhenInUse, .authorizedAlways:
            print("Enable location features")
        }
    }

    func createPost(img: UIImage) {
        guard let imgBase64 = img.encodedBase64() else { return }
        let timestamp = Date().currentTimestamp()
        client.create(title: String(timestamp), imageData: imgBase64, location: currentLocation) { post in
            print(post)
        }
    }

}

extension CameraViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations.last
    }
}
