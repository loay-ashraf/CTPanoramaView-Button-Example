//
//  ViewController.swift
//  CTPanoramaView
//
//  Created by Cihan Tek on 12/10/2016.
//  Copyright © 2016 Home. All rights reserved.
//

import UIKit
import CTPanoramaView

class ViewController: UIViewController {

    @IBOutlet weak var compassView: CTPieSliceView!
    @IBOutlet weak var panoramaView: CTPanoramaView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSphericalImage()
        panoramaView.compass = compassView
        
        // check for image x, y to be in door range to show or hide button
        panoramaView.movementHandler = { [weak self] x,y in
            if (-1.0 ... -0.9).contains(x), (0.8 ... 0.9).contains(y) {
                self?.button.isHidden = false
            } else {
                self?.button.isHidden = true
            }
            print("(\(x),\(y))")
        }
    }
    
    @IBAction func panoramaTypeTapped() {
        if panoramaView.panoramaType == .spherical {
            loadCylindricalImage()
        } else {
            loadSphericalImage()
        }
    }

    @IBAction func motionTypeTapped() {
        if panoramaView.controlMethod == .touch {
            panoramaView.controlMethod = .motion
        } else if panoramaView.controlMethod == .motion {
            panoramaView.controlMethod = .both
        } else {
            panoramaView.controlMethod = .touch
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("Let me in!")
    }
    
    func loadSphericalImage() {
        panoramaView.image = UIImage(named: "spherical")
    }

    func loadCylindricalImage() {
        panoramaView.image = UIImage(named: "cylindrical")
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
}
