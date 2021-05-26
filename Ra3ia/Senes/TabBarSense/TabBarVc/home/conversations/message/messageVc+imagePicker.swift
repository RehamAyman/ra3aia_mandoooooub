//
//  messageVc+imagePicker.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/12/21.
//

import UIKit




extension messageVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    // user image
    
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            
            if picker == imagePicker {
               // self.Userimg.image = image
                
            }
            
            
            picker.dismiss(animated: true, completion: nil)
            
            
            
        }
         
        }
    
    
    

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}

