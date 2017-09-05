//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func ping(numb: Int) {
    return pingfang(numb: numb)
}

func pingfang(numb: Int) {
    print(numb * numb)
}

ping(numb: 10)

let image1 = UIImage(named: "1")

let image2 = UIImage(named: "2")


let imageArray = [image1,image2]


let count1 = String(format: "%ld--%ld", imageArray.count,imageArray.count,imageArray.count)

let count = String(format: "%d==%ld", arguments: [imageArray.count,imageArray.count+1])//.data(using: .utf8)

