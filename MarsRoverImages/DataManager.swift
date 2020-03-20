//
//  DataManager.swift
//  MarsRoverImages
//
//  Created by Alexa Veigel on 3/19/20.
//  Copyright © 2020 Alexa Veigel. All rights reserved.
//

import Foundation
import UIKit

func getPhotos(completion: @escaping(Result<[MarsPhotos], MarsError>) -> Void) {
    let request = MarsPhotosRequest()

    let dataTask = URLSession.shared.dataTask(with: request.url){
        data, URLResponse, error in
        guard let jsonData = data else {
            completion(.failure(.noDataAvailable))
            return
        }
        do {
            let decoder = JSONDecoder()
            let marsResponse = try decoder.decode(MarsPhotos.self, from: jsonData)
            let marsData = marsResponse.photos
            completion(.success(marsData))
        } catch {
            completion(.failure(.cantProcessData))
        }
    }
    dataTask.resume()
}
