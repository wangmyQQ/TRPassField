//
//  ViewController.swift
//  TRPassFieldDemo
//
//  Created by 王明阳 on 2018/5/21.
//  Copyright © 2018年 joydoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var passField :TRPassField?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let width = UIScreen.main.bounds.size.width - 20*2

        self.passField = TRPassField.init(frame: CGRect.init(x: 20, y: 100, width: width, height: 50))
        self.view.addSubview(self.passField!)

        //是否是输入密码模式
        self.passField?.isSecureTextEntry = true
        //设置键盘类型
        self.passField?.keyboardType = .asciiCapable
        //设置字体颜色
        self.passField?.textColor = UIColor.black
        //是否只允许输入字母和数字
        self.passField?.isNumberAndAsciiOnly = true

        //如果是输入不合法的字符串则触发该方法
        self.passField?.inputDisableStringBlock = {
            print("输入非法字符")
        }
        //是否强制转化为大写
        self.passField?.isUppercased = false


    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let width = UIScreen.main.bounds.size.width - 20*2
        self.passField?.frame = CGRect.init(x: 20, y: 100, width: width, height: 50)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

