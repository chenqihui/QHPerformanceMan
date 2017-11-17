# QHPerformanceMan


1、动态库General里面的Embedded Binaries & Linked Frameworks and Libraries  
2、在Build Phases -> Copy Bundle Resources 资源文件  

关键文件，Framework的资源加载问题 xib & png 等  
xib，这样才会加载xib的控件
```
let bundle = Bundle(identifier: "com.chen.QHPerformanceMan")
        
let viewControllerOne = QPMParaViewController(nibName: "QPMParaViewController", bundle: bundle)
let viewControllerTwo = QPMLogViewController(nibName: "QPMLogViewController", bundle: bundle)
let viewControllerThree = QPMPluginViewController(nibName: "QPMPluginViewController", bundle: bundle)
let viewControllerFour = QPMSettingViewController(nibName: "QPMSettingViewController", bundle: bundle)
```
