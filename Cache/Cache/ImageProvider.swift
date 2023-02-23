//
//  ImageProvider.swift
//  Cache
//
//  Created by Heber Alvarez on 23/02/23.
//

import UIKit

class ImageProvider {
    static let shared = ImageProvider()

    // MARK: - Private methods
    private let cache = NSCache<NSString, UIImage>()

    private init() {}

    public func fetchImage(completion: @escaping (UIImage?) -> Void) {
        if let image = cache.object(forKey: "image") {
            debugPrint("Use cache")
            completion(image)
            return
        }
        guard let url = URL(string: "https://source.unsplash.com/random/500x500") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            debugPrint("Fetch from service")
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                self?.cache.setObject(image, forKey: "image")
                completion(image)
            }
        }
        task.resume()
    }
}
