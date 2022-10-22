//
//  SDiffusionConfig.swift
//  
//
//  Created by Joao Pedro Monteiro Maia on 21/10/22.
//

import Foundation

public protocol SDiffusionConfig{
    var usedModel:SDiffusionModel { get }
    var numberOfExpectedImages:Int { get set }
    var timoutToGetImages:Int { get set }
    func asHttpBodyData(usingPrompt prompt:String)->Data
}
