//
//  Observable+Rx.swift
//  Battleground
//
//  Created by Stas Kirichok on 01-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

extension ObservableConvertibleType {

    func asSkipErrorDriver() -> Driver<Element> {
        return asDriver(onErrorDriveWith: .never())
    }
}
