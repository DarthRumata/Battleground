//
//  ViewModelInterface.swift
//  Battleground
//
//  Created by Stas Kirichok on 01-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation

protocol ViewModelInterface {

    associatedtype Input
    associatedtype Output

    var input: Input { get }
    var output: Output { get }

}
