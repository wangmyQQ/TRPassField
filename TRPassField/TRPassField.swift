//
//  TRPassField.swift
//  
//
//  Created by 王明阳 on 2018/4/26.
//  Copyright © 2018年 joydoon. All rights reserved.
//

import UIKit

class TRPassField: UIControl,UIKeyInput {

    /// 是否只允许输入数字与字母，如果输入非法字符则触发回调inputDisableStringBlock
    var isNumberAndAsciiOnly:Bool = false
    var inputDisableStringBlock:(() ->Void)?
    var isUppercased:Bool = false

    // MARK: - Public variables
    @IBInspectable public var numberOfDigits: Int = 6 {
        didSet {

            if oldValue != numberOfDigits {

                if passcode.characters.count > numberOfDigits {
                    let endOfString = passcode.index(passcode.startIndex, offsetBy: numberOfDigits)
                    passcode = passcode.substring(to: endOfString)
                }

                relayout()
                redisplay()
            }

        }
    }

    @IBInspectable public var passcode: String = "" {
        didSet {

            if oldValue != passcode {

                guard passcode.characters.count <= numberOfDigits else {
                    return
                }

                redisplay()
                sendActions(for: .valueChanged)

            }
        }
    }

    @IBInspectable public var spaceBetweenDigits: CGFloat = 10.0 {

        didSet {

            if oldValue != spaceBetweenDigits {

                relayout()
                redisplay()

            }
        }

    }

    @IBInspectable public var dashColor: UIColor = UIColor.gray {
        didSet {

            if oldValue != dashColor {
                redisplay()
            }

        }
    }

    @IBInspectable public var textColor: UIColor = UIColor.black {
        didSet {
            if oldValue != textColor {
                redisplay()
            }
        }
    }

    // MARK: - Private variables
    private var numberLabels: [UILabel] = []
    private let emptyDigit = "–"
    private var isSecure = false {
        didSet {
            if isSecure != oldValue {
                redisplay()
            }
        }
    }


    // MARK: - UIView
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override public func layoutSubviews() {

        for index in 0..<numberLabels.count {
            let label = numberLabels[index]
            let frame = frameOfNumberLabel(ofDigitIndex: index)
            label.font = UIFont.systemFont(ofSize: frame.size.width * 0.9)
            label.frame = frame
        }

    }


    // MARK: - Private methods
    private func setup() {

        addTarget(self, action: #selector(TRPassField.didTouchUpInside), for: .touchUpInside)
        relayout()

    }

    private func relayout() {
        numberLabels.forEach { label in
            label.removeFromSuperview()
        }
        numberLabels = []

        for _ in 0..<numberOfDigits {
            let numberLabel = UILabel()
            numberLabel.text = emptyDigit
            numberLabel.textColor = dashColor
            numberLabel.textAlignment = .center
            numberLabels.append(numberLabel)
            addSubview(numberLabel)
        }

        setNeedsLayout()

    }


    private func frameOfNumberLabel(ofDigitIndex index:Int) -> CGRect {

        let w = (bounds.size.width - spaceBetweenDigits * (CGFloat(numberOfDigits) - 1.0)) / CGFloat(numberOfDigits)
        let h = bounds.size.height
        let x = (w + spaceBetweenDigits) * CGFloat(index)
        let y = CGFloat(0)
        return CGRect(x:x, y:y, width:w, height:h)

    }

    private func redisplay() {

        for i in 0..<numberOfDigits {

            let label = numberLabels[i]

            if i < passcode.characters.count {

                let start = passcode.index(passcode.startIndex, offsetBy: i)
                let end = passcode.index(start, offsetBy: 1)
                let number = passcode.substring(with:start..<end)
//                label.text = isSecureTextEntry ? "●" : number
                label.textColor = textColor
                label.text = number

            } else {

                label.text = emptyDigit
                label.textColor = dashColor
            }
        }

    }
    // MARK: - Handle the touch up event
    @objc private func didTouchUpInside() {
        becomeFirstResponder()
    }

    //    TODO:是否合法
    func isEnableStr(text:String) -> Bool {

        if self.isNumberAndAsciiOnly == true {

            return inputLettersOrNumbers(text)
        }
        return true
    }
    //允许大小写或数字(不限字数)
    func inputLettersOrNumbers(_ string: String) -> Bool {
        let regex = "[a-zA-Z0-9]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let inputString = predicate.evaluate(with: string)
        return inputString
    }
    // MARK: UIKeyInput protocol
    public var hasText: Bool {
        return !passcode.isEmpty
    }

    public func insertText(_ text: String) {

        guard passcode.characters.count + text.characters.count <= numberOfDigits else {
            return
        }

        if isEnableStr(text: text) == false {
            if self.inputDisableStringBlock != nil {
                self.inputDisableStringBlock!()
            }
            return
        }

        if self.isUppercased == true{
            passcode = passcode + text.uppercased()
        }else{
            passcode = passcode + text
        }
    }

    public func deleteBackward() {
        guard passcode.characters.count > 0 else {
            return
        }
        passcode = passcode.substring(to: passcode.index(before: passcode.endIndex))
    }

    public var isSecureTextEntry: Bool {
        @objc(isSecureTextEntry) get {
            return isSecure
        }
        @objc(setSecureTextEntry:) set {
            isSecure = newValue
        }
    }

    // MARK: UIResponder
    public override var canBecomeFirstResponder: Bool {
        return true
    }

    // MARK: UIKeyboardTrait

    public var keyboardType: UIKeyboardType = .numberPad



}
