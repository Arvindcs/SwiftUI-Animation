//
//  ImageProvider.swift
//  WidgetApp
//
//  Created by Arvind on 19/11/20.
//

import Foundation
import UIKit

protocol ImageProviderProtocol {
    func getImage(completionHandler: @escaping (UIImage?) -> Void)
}

struct ImageProvider: ImageProviderProtocol {
    
    func getImage(completionHandler: @escaping (UIImage?) -> Void) {
        // https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg
        let url =  URL(string: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg")!
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let image = UIImage(data: data)
            completionHandler(image)
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
