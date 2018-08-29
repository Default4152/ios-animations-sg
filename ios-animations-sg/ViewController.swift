//
//  ViewController.swift
//  ios-animations-sg
//
//  Created by Conner on 8/29/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func toggle(_ sender: Any) {
    shouldScramble = !shouldScramble
  }
  
  var shouldScramble: Bool = false
  @IBOutlet var letterL: UILabel!
  @IBOutlet var letterA: UILabel!
  @IBOutlet var letterM: UILabel!
  @IBOutlet var letterB: UILabel!
  @IBOutlet var letterD: UILabel!
  @IBOutlet var letterA2: UILabel!
  @IBOutlet var logo: UIImageView!
}

