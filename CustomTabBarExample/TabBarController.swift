//
//  TabBarController.swift
//  Bookeasē
//
//  Created by Jevon Cowell on 10/16/16.
//  Copyright © 2016 Jevon Cowell. All rights reserved.
//

import UIKit

class TabBarController: UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Initalize storyboards
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
         cartViewController = storyboard.instantiateViewController(withIdentifier: "CartViewController")
       profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
        ideaViewController = storyboard.instantiateViewController(withIdentifier: "IdeaViewController")
        settingsViewController = storyboard.instantiateViewController(withIdentifier: "SettingViewController")
        
        
        //Add stroyboards to array
        viewControllers = [ homeViewController, cartViewController,profileViewController, ideaViewController, settingsViewController]
        
        //Initallly select a ViewController
        didPressTab(buttons[selectedIndex])
    }
  
    //MARK: - View Controller Variables
    
    var viewControllers: [UIViewController]!
    
    var homeViewController: UIViewController!
    var cartViewController: UIViewController!
    var profileViewController: UIViewController!
    var ideaViewController: UIViewController!
    var settingsViewController: UIViewController!
    
    //MARKS: - Selected Index: 
    
    var selectedIndex: Int = 0
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewDisplay: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func didPressTab(_ sender: UIButton) {
        
        //Keeps track of the previous button
        let previousIndex = selectedIndex
        //Set the selectedIndex to the tag value of which ever button was tapped.
        selectedIndex = sender.tag
        //Set previous selected button to non-selected state
        buttons[previousIndex].isSelected = false
        
        //Use the previousIndex to access the previous ViewController from the viewControllers array.
        let previousVC = viewControllers[previousIndex]
        
        //Remove the previous ViewController
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
    
        //Access the selected button and set it to the selected state.
        sender.isSelected = true
        
        //Use the selectedIndex to access the current ViewController from the viewControllers array.
        let vc = viewControllers[selectedIndex]
        //Add the new ViewController to display view
        addChildViewController(vc)
        
        //Adjusts the size of the ViewController view add it as a subView of the contentView.
        vc.view.frame = viewDisplay.bounds
        viewDisplay.addSubview(vc.view)
        //Call the viewDidAppear method of the coming ViewController
        vc.didMove(toParentViewController: self)

        }
    
}




