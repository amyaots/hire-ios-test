//
//  File.swift
//  AutoAngel-Customer
//
//  Created by Myaots Alexandr on 22.08.16.
//  Copyright © 2016 myaots. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, TransitionHandler {
    
    class ConfigurationBlockHolder {
        let block: (ModuleInput) -> Void
        
        init(block: (ModuleInput) -> Void) {
            self.block = block
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let configurationBlock = sender as? ConfigurationBlockHolder {
            if let destinationController = segue.destinationViewController as? UINavigationController {
                if let controller = destinationController.topViewController as? ModuleInputProvider {
                    configurationBlock.block(controller.moduleInput)
                }
            }
            
            if let destinationController = segue.destinationViewController as? ModuleInputProvider {
                configurationBlock.block(destinationController.moduleInput)
            }
        }
    }
    
    func openModule(segueIdentifier: String) {
        performSegueWithIdentifier(segueIdentifier, sender: nil)
    }
    
    func openModule(segueIdentifier: String, configurationBlock: ConfigurationBlock) {
        performSegueWithIdentifier(segueIdentifier, sender: BaseViewController.ConfigurationBlockHolder(block: configurationBlock))
    }
    
    func closeCurrentModule() {
        if let parentViewController = self.parentViewController {
            let isNavigationStack = parentViewController is UINavigationController
            let hasManyControllersInStack = isNavigationStack ? parentViewController.childViewControllers.count > 0 : false
            
            if isNavigationStack && hasManyControllersInStack {
                let navigationController = parentViewController as! UINavigationController
                navigationController.popViewControllerAnimated(true)
            }
        }
    }
    
    func closeStackModulde() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}

extension BaseViewController : ViewInput {
    func showError(error: String) {
        self.showAlertViewControllerIn(
            withTitle: "ATTENTION"
            , message: error
            , actions: [UIAlertAction(title: "OK", style: .Default, handler: nil)])
    }
}
