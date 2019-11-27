# iOS组件化之framework
* 前言：之前的组件化，但是并不是以动态库、静态库的形式进行依赖
* 概述：通过 pod package 插件打包 framework
* 优势：减小包体积,保密源码的特性，增加编译速度，不需要知道具体实现方法，只需要引入头文件调用即可。

###环境：
* 1、XCode11.2
* 2、cocoapods
* 3、ios13


* __环境配置：__安装git、安装CocoaPods
* __托管平台：__github、gitlab等平台
* pod package 是 cocoapods 的一个自动化打包插件，可以用来打包生成动态库或静态库，如果没有的话使用以下命令安装：（如果不安装会提示不支持的报错）
* 
```
sudo gem install cocoapods-packager
```
* 一、单个库打包
   
   1.创建项目(跟组件化创建项目流程一样)
   
   ```
    pod  lib create 项目名
   ``` 
   
   2.podfile里添加三方比如AFNetworking，更新Pod依赖

   3.在根目录(和项目名.podspec同级目录)下创建打包用的package.podspec 文件
     
     package.podspec的具体配置参考demo工程中
     
   4.执行打包命令
   
   ```
   pod package package.podspec --no-mangle --exclude-deps --spec-sources=https://github.com/CocoaPods/Specs.git --force
   ```
   如果成功的话当前目录下生成一个    项目名-0.0.1文件夹 点进去在ios目录下会找到打包生成的framework文件
   
   5.打包完之后修改podspec文件
   
   注意点：
   
   s.ios.vendored_frameworks配置的是相对路径(一定不能写错，写错会报不识别文件的错误)
   s.ios.vendored_frameworks指的是给用户用到的framework
   配置完之后上传的是framework
   
   xxx.framework这个一定要推到远程仓库里
   
   6.发布(更新)framework推到pod库里(我这里是发布到官方pod里面，如果是私有仓库的话请参照之前组件化的方式 pod repo 索引库  xxx.podspec  source= xxxxxx.......)
   
   1)、执行pod trunk push DJCocoapods.podspec --use-libraries --allow-warnings

   如果遇到提示trunk 错误的时候，请注册cocoaPods  trunk账号
   
   注册
   
   pod trunk register 邮箱(xxxx@qq.com) '用户名' --description='描述' --verbose
   
   查看注册信息
   
   pod trunk me
   
   添加其他维护者
   
   pod trunk add-owner XXXSDK 邮箱(xxx@qq.com)
   
   podspec文件具体配置可参考demo工程
   
  如果Push成功的话会有下图提示
  
  <img src="./cocoaPodsSuc.jpeg" width = "200" height = "100" alt="" align=center />

   
   然后 pod search 你的sdk
   
   如果pod search 搜索的时候出现[!] Unable to find a pod with name, author, summary, or description matching xxxxx 错误
   
   执行rm ~/Library/Caches/CocoaPods/search_index.json 
   
   然后在pod search xxx
   
   如果仍搜索不到，更新一下本地pod依赖库
   
   pod setup
   
   
   
   
   
   
  项目中添加依赖的时候直接修改podfile文件
  
  pod 'xxxxSDK' 
  
  
  
* 二、有依赖关系的subspecs 分别打包成 framework
 
 这里模拟一个组件，该组件有多个 subspec，其中OMTSocial/Core 为基础 subspec，其余的如 OMTSocial/Facebook 等都要依赖  OMTSocial/Core
 
 1、创建项目

   和之前的方式一样 pod lib create DJXXXXsdk（项目名）
 
 2、创建添加文件

    比如subspec 的依赖关系：Core 为基础 subspec，Facebook 依赖 Core
    
    然后更新pod
    
 3、打包其中一个subspec - Core

    由于一个 .podspec 只能生成一个 framework，因此每个 subspec 都要一个 .podspec 文件作为配置文件打包
    
    注意：
    
    *    创建 Packagexxxx.podspec 文件为打包 Core 提供支持，内容如下。
    *    s.name 应该为 OMTSocial，这样其他模块才可以通过 #import <OMTSocial/OMTSocial.h> 引入头文件，这样子可以使开发过程中和打包过程的引入头文件的方式统一，避免其中会有一个失败，并且 Core 编译成功后生成的为 OMTSocial-s.version.framework （s.version为当前的版本号）

```
Pod::Spec.new do |s|
  s.name             = 'OMTSocial'
  s.version          = '0.0.1'
  s.summary          = 'A short description of OMTSocial.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/yangshiyu666/OMTSocial'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '864745256@qq.com' => 'wyh900207@126.com' }
  s.source           = { :git => 'https://github.com/yangshiyu666/OMTSocial.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.subspec 'Core' do |sp|
     sp.source_files = 'OMTSocial/Classes/*', 'OMTSocial/Classes/Core/*'
  end
end


```
    

    
 




*  [demo工程稍后附上](http://192.168.0.169/ComponentDemo) 
.....
