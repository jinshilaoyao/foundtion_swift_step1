//
//  ViewController.swift
//  foundation_swift
//
//  Created by yesway on 16/8/1.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //1 简单的函数调用
    
    var someClosure = { (param: String) in
        print("\(param)")
    }
    
    // 返回值是函数，并且函数的返回值是调用者本身，可以构成链式调用
    
    typealias SELF = ViewController
    
    var run1: (String) -> ViewController {
        return {
            print($0)
            return self
        }
    }
    
    var run2: (String) -> SELF {
        return {
            print($0)
            return self
        }
    }
    
    
    //以数据流为导向的函数式编程
    
    struct CalculateManager {
        var result = 0
        
        mutating func calculate(closure:(Int) -> (Int)) ->CalculateManager {
            result = closure(result)
            return self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        someClosure("call closure")
        
//        run1("call closure one").run2("call closure two")
        
        var cal = CalculateManager()
        
        let result = cal.calculate {
            var result = $0 + 10
            
            result *= 10
            
            return result
        }.result
        
        print(result)
        
    }


}

