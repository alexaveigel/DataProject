//
//  MainViewController.swift
//  MarsRoverImages
//
//  Created by Alexa Veigel on 3/19/20.
//  Copyright © 2020 Alexa Veigel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var image: UIImage = UIImage()

    var marsPhotos = [Photo]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    let dataRequest = MarsPhotosRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        getPhotos()
    }

    func getPhotos() {
        dataRequest.getPhotos { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let photos):
                self?.marsPhotos = photos

            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(marsPhotos.count)
        return marsPhotos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "picCell") as? MarsPictureTableViewCell
        let photo = marsPhotos[indexPath.row]
        let photoUrl = URL(string: photo.img_src)!

        cell?.imgMars.load(url: photoUrl)
        cell?.lblRover.text = photo.rover.name
        cell?.lblCamera.text = photo.camera.name
        cell?.lblDate.text = photo.earth_date

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

