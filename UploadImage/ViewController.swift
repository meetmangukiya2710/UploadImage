//
//  ViewController.swift
//  UploadImage
//
//  Created by R95 on 29/01/24.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var text1Outlet: UITextField!
    @IBOutlet weak var text2Outlet: UITextField!
    @IBOutlet weak var text3Outlet: UITextField!
    @IBOutlet weak var text4Outlet: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        image()
    }
    
    func image() {
        imageViewOutlet.layer.cornerRadius = 15
    }
    
    @IBAction func uploadButtonOutlet(_ sender: Any) {
            alert()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageViewOutlet.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        dismiss(animated: true)
    }
    
    func alert() {
        let a = UIAlertController(title: "Secelct Photo", message: "", preferredStyle: .actionSheet)
        a.addAction(UIAlertAction(title: "Camera", style: .default))
        a.addAction(UIAlertAction(title: "Gallery", style: .default,handler: { _ in
            let a = UIImagePickerController()
            a.sourceType = .photoLibrary
            a.delegate = self
            a.allowsEditing = true
            self.present(a, animated: true)
        }))
        a.addAction(UIAlertAction(title: "Cansel", style: .destructive))
        present(a, animated: true)
    }
    
    
    @IBAction func saveButtonOutlet(_ sender: Any) {
        if text1Outlet.text == "" && text2Outlet.text == "" && text3Outlet.text == "" && text4Outlet.text == "" {
            alert1(title: "Error!", message: "Enter the All Detail")
        }
        else if text1Outlet.text == "" {
            alert1(title: "Error!", message: "Enter The Name")
        }
        else if text2Outlet.text == "" {
            alert1(title: "Error!", message: "Enter the e-mail")
        }
        else if text3Outlet.text == "" {
            alert1(title: "Error!", message: "Enter the Password")
        }
        else if text4Outlet.text == "" {
            alert1(title: "Error!", message: "Enter the Mobile Number")
        }
        else {
            alert1(title: "Save", message: "All Data Save")
        }
        
        print(text1Outlet.text)
        print(text2Outlet.text)
        print(text3Outlet.text)
        print("\(text4Outlet.text)\n")
    }
    
    func alert1(title: String,message: String) {
        let b = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        b.addAction(UIAlertAction(title: "OK", style: .default))
        b.addAction(UIAlertAction(title: "Cansel", style: .destructive))
        present(b, animated: true)
    }

}

