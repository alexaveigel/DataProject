//
//  Mars.swift
//  MarsRoverImages
//
//  Created by Alexa Veigel on 3/19/20.
//  Copyright © 2020 Alexa Veigel. All rights reserved.
//

import Foundation

struct MarsPhotosRequest {
    let url: URL
    let API_KEY = "mQd48pMNb7I32uayDsX0eKMibzmvunv3I6xD8bcG"

    init() {
        let apiString = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=\(API_KEY)"
        guard let url = URL(string: apiString) else { fatalError() }
        self.url = url
    }
}

enum MarsError: Error {
    case noDataAvailable
    case cantProcessData
}

struct MarsPhotos: Decodable {
    let photos: [Photo]
}

struct Photo: Decodable {
    let camera: Camera
    let img_src: String
    let earth_date: String
    let rover: Rover
}

struct Camera: Decodable {
    let name: String
}

struct Rover: Decodable {
    var name: String
    let status: String
}
