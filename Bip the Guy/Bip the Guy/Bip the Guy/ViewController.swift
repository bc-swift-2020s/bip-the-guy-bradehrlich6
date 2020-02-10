//
//  ViewController.swift
//  Bip the Guy
//
//  Created by Brad Ehrlich on 2/3/20.
//  Copyright © 2020 Brad Ehrlich. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imagetoPunch: UIImageView!
    var audioPlayer = AVAudioPlayer()
    var imagePicker = UIImagePickerController()
    
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
    func playSound(name: String){
        if let sound = NSDataAsset(name: name) {
        do{
            try audioPlayer = AVAudioPlayer(data: sound.data)
            audioPlayer.play()
        } catch{
            print("Error: \(error.localizedDescription) Could not intialize AudioPlaer Object")
        }
            
        } else {
            print("ERROR: Could not read data from file sound0")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        imagetoPunch.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil )
    }
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    //Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
        imagePicker.sourceType = .camera
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
        } else {
            showAlert(title: "Camera not Avaliable", message: "There is no camera avaliable on this device.")
        }}
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(name: "punchSound")
        print("imagePressed")
    }
}

