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
  
  override func viewDidAppear(_ animated: Bool) {
    labels = [letterL, letterA, letterM, letterB, letterD, letterA2]
    originalPositions = labels.compactMap { ($0.layer.position.x, $0.layer.position.y) }
  }
  
  func gather(pos: Int, label: UILabel) {
    guard let originalXPosition = self.originalPositions[pos].0,
      let originalYPosition = self.originalPositions[pos].1 else { return }
    label.layer.position.x = originalXPosition
    label.layer.position.y = originalYPosition
    label.layer.backgroundColor = UIColor.white.cgColor
    label.textColor = .black
    label.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
    label.transform = .identity
  }
  
  func performScatter(label: UILabel) {
    label.layer.position.x = CGFloat(arc4random_uniform(250))
    label.layer.position.y = CGFloat(arc4random_uniform(250))
    label.layer.backgroundColor = UIColor.random.cgColor
    label.textColor = UIColor.random
    label.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(360)))
      .concatenating(CGAffineTransform(scaleX: 1.9, y: 1.9))
  }
  
  @IBAction func toggle(_ sender: Any) {
    shouldScramble = !shouldScramble
    
    if shouldScramble {
      UIView.animate(withDuration: 2.0) {
        self.logo.alpha = 0.0
        self.labels.forEach { self.performScatter(label: $0) }
      }
    } else {
      UIView.animate(withDuration: 2.0) {
        self.logo.alpha = 1.0
        for (i, label) in self.labels.enumerated() {
          self.gather(pos: i, label: label)
        }
      }
    }
  }
  
  var shouldScramble: Bool = false
  var originalPositions: [(CGFloat?, CGFloat?)] = []
  var labels: [UILabel] = []
  @IBOutlet var letterL: UILabel!
  @IBOutlet var letterA: UILabel!
  @IBOutlet var letterM: UILabel!
  @IBOutlet var letterB: UILabel!
  @IBOutlet var letterD: UILabel!
  @IBOutlet var letterA2: UILabel!
  @IBOutlet var logo: UIImageView!
}

extension UIColor {
  static var random: UIColor {
    return UIColor(hue: CGFloat(arc4random_uniform(.max)) / CGFloat(UInt32.max),
                   saturation: 1,
                   brightness: 1,
                   alpha: 1)
  }
}
