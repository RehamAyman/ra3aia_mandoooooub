//
//  personalInfoVC+imagePicker.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/8/21.
//

import UIKit

extension personalInfoVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
  
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            
            if picker == imagePicker {
                self.userImage.image = image
                
                uploadImge.append(UploadData(data: (image).pngData()! as Data, fileName: "Image.jpg", mimeType: "image/jpg", name: "avatar"))
                
            } else if picker == idPicker {
                
                self.IDpic.image = image
                
                uploadImge.append(UploadData(data: (image).pngData()! as Data, fileName: "Image.jpg", mimeType: "image/jpg", name: "id_image"))
                
            } else if picker == vhicelPicker {
                
                self.vehiclePic.image = image
                uploadImge.append(UploadData(data: (image).pngData()! as Data, fileName: "Image.jpg", mimeType: "image/jpg", name: "car_image"))
                
                
            } else if picker == DrivingLicense {
                self.drivingPic.image  = image
                uploadImge.append(UploadData(data: (image).pngData()! as Data, fileName: "Image.jpg", mimeType: "image/jpg", name: "licence_image"))
            }
            picker.dismiss(animated: true, completion: nil)
    
            
        
         
        }}
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}

