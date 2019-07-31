<div align="center">
  <img src="./screenshot/logo.png" alt="uPic">
</div>

# ☁️ Terse image hosting client for Mac

<div style="display: flex;justify-content: center;" align="center">
   <a href="https://github.com/gee1k/uPic/stargazers">
    <img src="https://img.shields.io/github/stars/gee1k/uPic.svg?style=popout-square" alt="">
  </a> <a href="https://github.com/gee1k/uPic/releases" style="margin: 0 5px;">
    <img src="https://img.shields.io/github/downloads/gee1k/uPic/total.svg?style=popout-square" alt="">
  </a> <a href="https://github.com/gee1k/uPic/releases/latest">
    <img src="https://img.shields.io/github/release/gee1k/uPic.svg?style=popout-square" alt="">
  </a>
</div>


## 📑 Introduction

> **uPic(upload Picture) is a image(file) hosting client for Mac. **
> You can upload images、files to specified provider’s OSD service which was configured.
> Before uploading, you can get an url immediately which can be accessed on internet. 



**💡 Tips：** They can automatic uploading local file and screenshot,meanwhile the menu bar shows the uploading progress constantly.File's link will automatically copied to the clipboard when finish upload,make you insert pictures quickly when you are blogging or chatting.Link’s format can be a normal URL,HTML or Markdown,it's totally up to you.

**🔋 Support image hosting：**[smms](https://sm.ms/)、 [UPYUN USS](https://www.upyun.com/products/file-storage)、[qiniu KODO](https://www.qiniu.com/products/kodo)、 [Aliyun OSS](https://www.aliyun.com/product/oss/)、 [TencentCloud COS](https://cloud.tencent.com/product/cos)、[Weibo](https://weibo.com/)、[Github](https://github.com/settings/tokens)、 [Gitee](https://gitee.com/profile/personal_access_tokens)、 [Amazon S3](https://aws.amazon.com/cn/s3/)、[custom upload api](https://blog.svend.cc/upic/tutorials/custom)、...

## 🚀 How to install


### 1.Homebrew:
```
brew cask install upic
```
### 2.Download from github
 click [release](https://github.com/gee1k/uPic/releases) to download

### 检查 Finder 扩展权限

- 1.打开 uPic

- 2.打开`系统偏好设置` - `扩展` - `访达扩展` make sure that `uPicFinderExtension` is be selected

  <center>
    <img src="./screenshot/finder-extension.png" height="300">
  </center>



## 🕹 使用方式

| 功能 | 描述 | 预览 |
| --- | --- | --- |
| **🖥 选择文件上传** | 从`Finder`选择文件上传 | ![](./screenshot/selectFile.gif) |
| **⌨️ 复制文件上传** | 上传已拷贝到剪切板的文件 | ![](./screenshot/paste.gif) |
| **🖱 拖拽本地文件上传** | 拖拽文件到状态栏上传 | ![](./screenshot/drag-finder.gif) |
| **🖱 拖拽浏览器图片上传** | 从浏览器拖拽图片到状态栏上传 | ![](./screenshot/drag-browser.gif) |
| **📸 截图上传** | 直接拉框截图上传 | ![](./screenshot/screenshot.gif) |
| **📂 Finder 中右键上传** | 右击文件上传 | ![](./screenshot/finder-contextmenu.gif) |



## 🧰 更多功能

**除了以上这些最基本的功能以外，uPic 还提供了一系列小功能让你使用起来更方便更顺心**

<details><summary>1. ⌨︎ 全局快捷键</summary><br>
<p>
	<center>
		<img src="./screenshot/shortcuts.png" height="300">
	</center>
</p>
</details>
<details><summary>2. 🕦 上传历史</summary><br>
<p>
	<center>
		<img src="./screenshot/history.png" height="300">
	</center>
</p>
</details>
<details><summary>3. 📢 更多功能等待你发现</summary><br>
<p>
	...
</p>
</details>



## ❓ 常见问题

<details>
	<summary>1.图床如何配置❓</summary>
	<ul>
		<li><a href="https://blog.svend.cc/upic/tutorials/weibo" target="_blank">uPic 图床配置教程 - 微博</a></li>
		<li><a href="https://blog.svend.cc/upic/tutorials/upyun_uss" target="_blank">uPic 图床配置教程 - 又拍云</a></li>
		<li><a href="https://blog.svend.cc/upic/tutorials/qiniu_kodo" target="_blank">uPic 图床配置教程 - 七牛云</a></li>
		<li><a href="https://blog.svend.cc/upic/tutorials/aliyun_oss" target="_blank">uPic 图床配置教程 - 阿里云</a></li>
		<li><a href="https://blog.svend.cc/upic/tutorials/tencent_cos" target="_blank">uPic 图床配置教程 - 腾讯云</a></li>
		<li><a href="https://blog.svend.cc/upic/tutorials/amazon_s3" target="_blank">uPic 图床配置教程 - Amazon S3</a></li>
		<li><a href="https://blog.svend.cc/upic/tutorials/github" target="_blank">uPic 图床配置教程 - Github</a></li>
		<li><a href="https://blog.svend.cc/upic/tutorials/gitee" target="_blank">uPic 图床配置教程 - 码云(Gitee)</a></li>
		<li><a href="https://blog.svend.cc/upic/tutorials/custom" target="_blank">uPic 图床配置教程 - 自定义上传</a></li>
	</ul>
</details>
<details><summary>2. Finder 扩展不工作了❓</summary><br>
<p>由于 Finder 扩展是只要加上之后会一直都存在，所以当你遇到 Finder 扩展操作无反应的时候，可能是 uPic 主程序没有打开</p>
</details>
<details>
	<summary>3.为什么我配置了图床，图片/文件却没有上传到我的图床中</summary>
	<div>
		<p>配置好的图床可以在菜单栏`图床`中选择。选中的图床就是您接下来文件会上传到的图床</p>
		<img src="./screenshot/default-host.png" width="450">
	</div> 
</details>



# 💌 Contact information

- `Email`: svend.jin@gmail.com
- `Telegram`: [gee1k](https://t.me/gee1k)
- `github`: [Github](https://github.com/gee1k/uPic)
- `uPic chat group(Telegram)`:  [click here to join in](https://t.me/upic_host)
- `Wechat group`:  <small>scan the QR code below to join in ↓ </small>

	<img src="https://raw.githubusercontent.com/gee1k/oss/master/personal/geee1k.JPG" height="200">


# ❤️ Support

If you like uPic,please hit the star button and thanks for your support.

| **Paypal** | **Alipay** | **Wechat** |
| :-: | :-: | :-: |
| [@Geee1k](https://paypal.me/geee1k) | ![](./screenshot/qrcode/alipay-mini.jpeg) | ![](./screenshot/qrcode/wechat-zs.JPG) |


## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2019 gee1k

