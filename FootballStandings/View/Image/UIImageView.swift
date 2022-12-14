//
//  UIImageView.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import UIKit

extension UIImageView {
    
    func loadFrom(urlString: String?) {
        
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        
        let provider = ImageProvider.shared
        provider.getImage(for: url) { image, _ in
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.image = image
            }
            
        }
        
    }
    
}
