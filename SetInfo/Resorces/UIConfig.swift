//
//  UIConfig.swift
//  SetInfo
//
//  Created by LaxmiPrasad Sahu on 22/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit


protocol AlartControllerConfigProtocol {
    func updateTextFieldValue(text: String)
}
class AlartControllerConfig {
    
    var delegate:AlartControllerConfigProtocol?
    
    func configAlartController(viewController: UIViewController,title : String?, message :String?, placeholder:String?, selectedView: UIView) {
        
        let alert = UIAlertController(title: title!, message: message!, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Done", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            if textField.text != "" {
                self.delegate?.updateTextFieldValue(text: textField.text!)
            }
        }
        let cancelaction = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in
            
        }
        alert.addTextField { (textField) in
            textField.placeholder = placeholder!
        }
        alert.addAction(action)
        alert.addAction(cancelaction)
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = selectedView
            popoverController.sourceRect = selectedView.bounds
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
}

extension UIColor {
     class func colorWithHexString(hexStr: String) -> UIColor {
        var cString:String = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (hexStr.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if (cString.isEmpty || (cString.count) != 6) {
            return colorWithHex(rgbValue: 0xFF5300);
        } else {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            return colorWithHex(rgbValue: rgbValue);
        }
    }
    
    class func colorWithHex(rgbValue: UInt32) -> UIColor {
        return UIColor( red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                        alpha: CGFloat(1.0))
    }
}
