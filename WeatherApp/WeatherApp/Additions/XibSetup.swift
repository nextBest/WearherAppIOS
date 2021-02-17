//
//  XibSetup.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/02/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

@IBDesignable
class CustomXibView: UIView, XibSetup {
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        view?.prepareForInterfaceBuilder()
    }
    
}

protocol XibSetup: class {
    var view: UIView! { get set }
    func xibSetup()
}

extension XibSetup where Self: UIView {
    func xibSetup() {
        view = self.loadNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
    }
}
