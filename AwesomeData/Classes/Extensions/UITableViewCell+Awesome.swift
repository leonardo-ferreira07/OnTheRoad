//
//  UITableViewCell+Awesome.swift
//  AwesomeData
//
//  Created by Evandro Harrison Hoffmann on 6/7/16.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

extension UITableViewCell{
    
    public func setImage(_ url: String?, thumbnailUrl: String? = nil, placeholder: UIImage? = nil, imageViewName: String, tableView: UITableView, indexPath: IndexPath, completion:((_ image: UIImage?) -> Void)?) -> URLSessionDataTask?{
        
        if let imageView = self.value(forKey: imageViewName) as? UIImageView {
            return imageView.setImage(url, placeholder: placeholder) { (image) in
                
                if let updateCell = tableView.cellForRow(at: indexPath) {
                    if let imageView = updateCell.value(forKey: imageViewName) as? UIImageView {
                        imageView.image = image
                    }
                }
                
                completion?(image)
            }
        } else {
            completion?(nil)
        }
        
        return nil
    }
    
}
