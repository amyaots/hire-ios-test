//
//  SwinjectStoryboard.swift
//  AutoAngel-Customer
//
//  Created by Myaots Alexandr on 22.08.16.
//  Copyright © 2016 myaots. All rights reserved.
//

import Foundation
import Swinject

class AssemblerHolder {
    static let sharedAssembler = Assembler(container: SwinjectStoryboard.defaultContainer)
}

class ViperAssembler<T: ViperModuleAssembly>: Assembler {
    init() {
        super.init(container: SwinjectStoryboard.defaultContainer)
        
        self.applyAssembly(T())
    }
}

protocol ViperModuleAssembly: AssemblyType {
    init()
}

extension SwinjectStoryboard {
    public static func setup() {
        AssemblerHolder.sharedAssembler.applyAssemblies([ModelAssembly()])
    }
}
