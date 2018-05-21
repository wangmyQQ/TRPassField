# TRPassField
密码输入控件
##如何使用
1.初始化控件
self.passField = TRPassField.init(frame: CGRect.init(x: 20, y: 100, width: width, height: 50))
self.view.addSubview(self.passField!)
2.是否进入输入密码模式
self.passField?.isSecureTextEntry = true
3.设置键盘类型
self.passField?.keyboardType = .asciiCapable
4.设置字体颜色
self.passField?.textColor = UIColor.black
5.是否只允许输入字母和数字
self.passField?.isNumberAndAsciiOnly = true
6.如果是输入不合法的字符串则触发该方法
self.passField?.inputDisableStringBlock = {
print("输入非法字符")
}
7.是否强制转化为大写
self.passField?.isUppercased = false
