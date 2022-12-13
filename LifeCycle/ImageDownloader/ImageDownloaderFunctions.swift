//
//  ImageDownloaderFunctions.swift
//  LifeCycle
//
//  Created by Admin on 21/10/22.
//
import UIKit
import Kingfisher
import PKHUD
import Promises

enum ImageError: Error{
    case emptyImage
}

extension UIImageView{
    func setImage(url: String) -> Promise<UIImage>{
        return Promise{ fulfill, reject in
            self.kf.setImage(with: URL(string: url),
                             options: [.cacheOriginalImage,.transition(.fade(0.25)),],
                             progressBlock: nil){ response in
                switch response {
                case .success(_): self.image == nil ? reject(ImageError.emptyImage) : fulfill(self.image!)
                case .failure(let error): reject(error)
                    
                }
            }
            
        }
    }
}
extension ImageDownloaderViewController{
    
    @objc
    func getImage(){
        HUD.show(.progress)
        imageViewContainer.isHidden = false
        guard let url = urlTextField.text else {return}
        let imageView = UIImageView(frame: self.imageViewContainer.bounds)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setImage(url: url).then { imageView in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            HUD.flash(.success, delay: 1.0)
                        }
        }.catch { error in
            print(error)
        }
        self.imageViewContainer.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.imageViewContainer.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.imageViewContainer.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.imageViewContainer.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.imageViewContainer.bottomAnchor, constant: 0)
        ])
        self.imageViewContainer.layoutIfNeeded()
    }
}






