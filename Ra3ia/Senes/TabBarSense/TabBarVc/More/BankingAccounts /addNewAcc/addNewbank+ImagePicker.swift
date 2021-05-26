//
//  addNewbank+ImagePicker.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/14/21.
//

import UIKit
extension addNewBankAccVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    func AddImageAlert(){
        self.showImage()
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.popoverPresentationController?.sourceView = view
        alert.addAction(UIAlertAction(title: "Photo from Camera".localized, style: .default, handler: { _ in
            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.cameraCaptureMode = .photo
//            imagePicker.sourceType = .camera
//            imagePicker.modalPresentationStyle = .fullScreen
//            imagePicker.allowsEditing = true
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
             imagePicker.delegate = self
             imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.allowsEditing = true
           imagePicker.modalPresentationStyle = .fullScreen
                
            }
            self.present(imagePicker, animated: true, completion: nil)
           // self.present(imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title:"Photo from the studio".localized, style: .default, handler: { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.modalPresentationStyle = .fullScreen
            self.present(imagePicker, animated: true, completion: nil)
            
        }))
        
        alert.view.tintColor =  UIColor.BasicColor
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker:UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let image_data = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
        //self.imageArray.append(image_data)
        uploadImge.append(UploadData(data:(image_data).pngData()! as Data , fileName: "Image.jpg", mimeType: "image/jpg", name: "bank_image"))
        self.Selectedimage.image =  image_data
        self.dismiss(animated: true, completion: nil)
        }}
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//
//
//            if picker == picker {
//
//                self.Selectedimage.image = image
//
//            }
//
//
//            picker.dismiss(animated: true, completion: nil)
//
//
//
//        }
//
//        }
    
    
    

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
