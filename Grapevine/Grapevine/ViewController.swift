/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class ViewController: UIViewController {
  // MARK: - Variables
  @IBOutlet private weak var iconImageView: UIImageView!
  @IBOutlet private weak var appNameLabel: UILabel!
  @IBOutlet private weak var skipButton: UIButton!
  @IBOutlet private weak var appImageView: UIImageView!
  @IBOutlet private weak var welcomeLabel: UILabel!
  @IBOutlet private weak var summaryLabel: UILabel!
  @IBOutlet private weak var pageControl: UIPageControl!

  private let horizontalPadding: CGFloat = 15.0
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    appImageView.hidden = true
//    welcomeLabel.hidden = true
//    summaryLabel.hidden = true
//    pageControl.hidden = true
    
    let metrics = ["hp": horizontalPadding, "iconImageViewWidth":30.0]
    
    // 1
    // Create a views dictionary that holds string representations of views to resolve inside the format string.
    let views: [String: AnyObject] = ["iconImageView": iconImageView,
    "appNameLabel": appNameLabel,
    "skipButton": skipButton,
    "appImageView": appImageView,
    "welcomeLabel": welcomeLabel,
    "summaryLabel": summaryLabel,
    "pageControl": pageControl,
    "topLayoutGuide": topLayoutGuide,
    "bottomLayoutGuide": bottomLayoutGuide]
    
    // 2
    // Create a mutable array of constraints. You'll build this up in the rest of the code.
    var allConstraints = [NSLayoutConstraint]()
    
    // 3
    // set up vertical constraints for the iconImageView, placing its top edge 20 points from its superview's top edge, with a height of 30 points.
    let iconVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[topLayoutGuide]-[iconImageView(30)]", options: [], metrics: nil, views: views)
    allConstraints += iconVerticalConstraints
    
    // 4
    // Set up vertical constraints for the appNameLabel, placing its top edge 23 points from its superview's top edge.
//    let nameLabelVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-23-[appNameLabel]", options: [], metrics: nil, views: views)
//    allConstraints += nameLabelVerticalConstraints
    
    // 5
    // Set up vertical constraints for the skipButton, placing its top edge 20 points from its superview's top edge.
//    let skipButtonVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[skipButton]", options: [], metrics: nil, views: views)
//    allConstraints += skipButtonVerticalConstraints
    
    // 6
    // set horizontal constraint
    let topRowHorizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-hp-[iconImageView(30)]-[appNameLabel]-[skipButton]-hp-|", options: [.AlignAllCenterY], metrics: metrics, views: views)
    allConstraints += topRowHorizontalConstraints
    
    // 1
    let summaryHorizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-hp-[summaryLabel]-hp-|", options: [], metrics: metrics, views: views)
    allConstraints += summaryHorizontalConstraints
    
//    let welcomeHorizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[welcomeLabel]-15-|", options: [], metrics: nil, views: views)
//    allConstraints += welcomeHorizontalConstraints
    
    // 2
    let iconToImageVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[iconImageView]-10-[appImageView]", options: [], metrics: nil, views: views)
    allConstraints += iconToImageVerticalConstraints
    
    // 3
    let imageToWelcomeVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[appImageView]-10-[welcomeLabel]", options: [.AlignAllCenterX], metrics: nil, views: views)
    allConstraints += imageToWelcomeVerticalConstraints
    
    // 4
    let summaryLabelVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[welcomeLabel]-4-[summaryLabel]", options: [.AlignAllLeading, .AlignAllTrailing], metrics: nil, views: views)
    allConstraints += summaryLabelVerticalConstraints
    
    // 5
    let summaryToPageVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[summaryLabel]-15-[pageControl(9)]-15-|", options: [.AlignAllCenterX], metrics: nil, views: views)
    allConstraints += summaryToPageVerticalConstraints
    
    // 7
    // activate the layout constraints
    NSLayoutConstraint.activateConstraints(allConstraints)
    
  }
}
