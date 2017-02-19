//
//  MotionViewController.swift
//  Lynkurs-03-App
//
//  Created by Fredrik Lillejordet on 15.02.2017.
//  Copyright © 2017 Bekk Consulting AS. All rights reserved.
//

import UIKit
import CoreMotion

class MotionViewController: UIViewController {

    @IBOutlet weak var accelerometerX: UILabel!
    @IBOutlet weak var accelerometerY: UILabel!
    @IBOutlet weak var accelerometerZ: UILabel!

    @IBOutlet weak var magnetometerX: UILabel!
    @IBOutlet weak var magnetometerY: UILabel!
    @IBOutlet weak var magnetometerZ: UILabel!

    let motionManager = CMMotionManager()
    let updateIntervalInSeconds = 0.2

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Motion"
        setupAccelerometerUpdates()
    }

    override func viewWillDisappear(_ animated: Bool) {
        motionManager.stopAccelerometerUpdates()
        motionManager.stopMagnetometerUpdates()
    }

    func setupAccelerometerUpdates() {
        motionManager.accelerometerUpdateInterval = updateIntervalInSeconds
        motionManager.startAccelerometerUpdates(to: OperationQueue.main) {(accelerometerData: CMAccelerometerData?, error: Error?) in

            if let acc: CMAcceleration = accelerometerData?.acceleration {
                self.accelerometerX.text = "X: \(acc.x)"
                self.accelerometerY.text = "Y: \(acc.y)"
                self.accelerometerZ.text = "Z: \(acc.z)"
            }
        }
    }

    func setupMagnetometerUpdates() {
        motionManager.magnetometerUpdateInterval = updateIntervalInSeconds
        motionManager.startMagnetometerUpdates(to: OperationQueue.main) {(magnetometerData: CMMagnetometerData?, error: Error?) in

            if let mag: CMMagneticField = magnetometerData?.magneticField {
                self.magnetometerX.text = "X: \(mag.x)"
                self.magnetometerY.text = "Y: \(mag.y)"
                self.magnetometerZ.text = "Z: \(mag.z)"
            }

        }
    }
}
