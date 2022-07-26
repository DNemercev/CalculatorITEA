//
//  TestViewController.swift
//  Calculator
//
//  Created by Nemercev Dmytro on 25.07.2022.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.layer.cornerRadius = testView.frame.size.height / 2
    }
}
