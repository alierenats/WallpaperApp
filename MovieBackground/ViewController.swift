//
//  ViewController.swift
//  MovieBackground
//
//  Created by Eren Ates on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var imageNames = ["anime", "ayla", "birzamanlaranadoluda", "car","django","inception","interstellar","johnwıck","kobe","thor"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageNames[currentIndex])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func screenTapped(tap: UITapGestureRecognizer) {
        let tapLocation = tap.location(in: self.view)

        if tapLocation.x < self.view.bounds.width / 2 {
            currentIndex -= 1
            if currentIndex < 0 {
                currentIndex = imageNames.count - 1
            }
        } else {
            currentIndex += 1
            if currentIndex >= imageNames.count {
                currentIndex = 0
            }
        }
        imageView.image = UIImage(named: imageNames[currentIndex])
    }
}
