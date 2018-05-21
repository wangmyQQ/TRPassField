# TRPassField
密码输入控件
##如何使用<br>
1.初始化控件<br>
self.passField = TRPassField.init(frame: CGRect.init(x: 20, y: 100, width: width, height: 50))<br>
self.view.addSubview(self.passField!)<br>
2.是否进入输入密码模式<br>
self.passField?.isSecureTextEntry = true<br>
3.设置键盘类型<br>
self.passField?.keyboardType = .asciiCapable<br>
4.设置字体颜色<br>
self.passField?.textColor = UIColor.black<br>
5.是否只允许输入字母和数字<br>
self.passField?.isNumberAndAsciiOnly = true<br>
6.如果是输入不合法的字符串则触发该方法<br>
self.passField?.inputDisableStringBlock = {<br>
print("输入非法字符")<br>
}<br>
7.是否强制转化为大写<br>
self.passField?.isUppercased = false<br>
