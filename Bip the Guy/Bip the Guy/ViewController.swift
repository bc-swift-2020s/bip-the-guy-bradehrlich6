//
//  ViewController.swift
//  Bip the Guy
//
//  Created by Brad Ehrlich on 2/3/20.
//  Copyright © 2020 Brad Ehrlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imagetoPunch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Functions
    func animateImage(){
        let bounds = self.imagetoPunch.bounds
        
        self.imagetoPunch.bounds = CGRect(x: self.imagetoPunch.bounds.origin.x + 60, y: self.imagetoPunch.bounds.origin.y + 60, width: self.imagetoPunch.bounds.size.width - 60, height: self.imagetoPunch.bounds.size.height - 60)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imagetoPunch.bounds = bounds}, completion: nil)
    }
    //Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        print("imagePressed")
    }
}

