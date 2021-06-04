//
//  ViewController.swift
//  LinkedListDemo
//
//  Created by mxl on 2021/6/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkIndex(200)
    }

    func checkIndex(_ index: Int) throws {
        if index > 100 {
            throw AFError.willShow
        }
    }

}

