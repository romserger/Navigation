//
//  Data.swift
//  Navigation
//
//  Created by Roman Geraskin on 25.07.2023.
//

import UIKit

struct Data {
    static let postArray = [
        PostViewModel(title: "GUGKJK", imagePost: "Smile cat", likes: 2324, views: 232323, discription: "LJGKJKHH"),
        PostViewModel(title: "VJHGHKLJ", imagePost: "Smile cat1", likes: 686, views: 988, discription: "KGIKHKLJ"),
        PostViewModel(title: "JKHLHJ:J", imagePost: "Smile cat2", likes: 87686, views: 989987, discription: "KGKKHG"),
        PostViewModel(title: "HHJLHJL", imagePost: "Smile cat3", likes: 87, views: 87879, discription: "KGJKHLKLL")
    ]

    static let photoArray: [UIImage] = {
        var photoArray: [UIImage] = []
        for item in 1...20 {
            let photo: UIImage = UIImage(named: String(item))!
            photoArray.append(photo)
        }
        return photoArray
    }()
}
