//
//  TransitionHandler.swift
//  AutoAngel-Customer
//
//  Created by Myaots Alexandr on 22.08.16.
//  Copyright © 2016 myaots. All rights reserved.
//

typealias ConfigurationBlock = (ModuleInput) -> Void

protocol TransitionHandler: class {
    func openModule(segueIdentifier: String)
    func openModule(segueIdentifier: String, configurationBlock: ConfigurationBlock)
    func closeCurrentModule()
    func closeStackModulde()
}
