//
//  ViewController.swift
//  Image Piker
//
//  Created by HARSHID PATEL on 18/01/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addImageButtonAction(_ sender: Any) {
        showAlert()
    }
    func showAlert(){
        let alert = UIAlertController(title: "Your Choice", message: "Photos", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "Gallery", style: .default,handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "Camera", style: .default,handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive,handler: nil))
        present(alert, animated: true,completion: nil)
    }
    
    func imagePickerController(_ piker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        img.image = info[.editedImage] as! UIImage
        dismiss(animated: true,completion: nil)
    }
    
    func openGallery(){
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.allowsEditing = true
        gallery.sourceType = .photoLibrary
        present(gallery, animated: true,completion: nil)
    }
}

