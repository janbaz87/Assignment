//
//  UIViewController+Extension.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 18/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import UIKit
extension UIViewController{
    func showError(error: AppError, errorTitle: String="Error", cancelTitle: String="OK") {
        DispatchQueue.main.async {
             let controller = UIAlertController.init(title: errorTitle, message: error.error, preferredStyle: UIAlertController.Style.alert)
                   let cancel = UIAlertAction.init(title: cancelTitle, style: .cancel) { (action) in
                   }
                   controller.addAction(cancel)
                   self.present(controller, animated: true, completion: nil)
        }
    }
}
    
extension UIViewController {
    func addAndShowActivity() {
        addActivityIndicatory()
        showActivityIndicatory()
    }
    
    
    func addActivityIndicatory() {
        DispatchQueue.main.async {
            let container: UIView = UIView()
            container.frame = self.view.frame
            container.center = self.view.center//CGPoint(x: self.view.center.x,y: self.view.center.y - 100)
            container.tag = 999
            container.backgroundColor = UIColor.clear
            container.isHidden = true
            
            let loadingView: UIView = UIView()
            loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            loadingView.center = self.view.center
            loadingView.backgroundColor = UIColor.offwhite_darkgray
            loadingView.clipsToBounds = true
            loadingView.layer.cornerRadius = 10
            
            let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
            activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0);
            activityIndicator.style =
                UIActivityIndicatorView.Style.large
            activityIndicator.color = UIColor.white
            activityIndicator.center =  CGPoint(x: loadingView.frame.size.width / 2,
                                               y: loadingView.frame.size.height / 2);
            loadingView.addSubview(activityIndicator)
            container.addSubview(loadingView)
            self.view.addSubview(container)
        
         activityIndicator.startAnimating()
        }
    }
    
    func showActivityIndicatory() {
        DispatchQueue.main.async {
            guard let activity = self.view.viewWithTag(999) else {
                return
            }
            activity.isHidden = false
        }
    }
    
    func removeActivity(){
        DispatchQueue.main.async {
            guard let activity = self.view.viewWithTag(999) else {
                return
            }
            activity.isHidden = true
        }
    }
}
