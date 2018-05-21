# TRPassField
密码输入控件(swift)
## 用途
除了限制输入数字和大小写外，还能将字符串强制转化为大写。<br>
![image](https://github.com/wangmyQQ/TRPassField/raw/master/demo.png)  
## 如何使用
如果是有安装cocopods的话则在Podfile文件中添加“pod 'TRPassField'”,没有的话直接下载本项目，并将TRPassField文件下的代码导入自己的项目。
### 具体代码
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
