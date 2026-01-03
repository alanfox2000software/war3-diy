## 框架
- 分为资源,数据,逻辑
- 资源目录  子目录整理的图片,模型资源
- 数据目录  游戏全局性的数据  Handle数据自身维护
- 逻辑目录  读写数据 与引擎交互

## Handle
- 属性配置(物编)
- 函数功能(Class.xx)
- 事件功能(Class.Onxx)

## 物编
- 属性配置 生成物编
- 分层次的物编
```
Unit
    CommonUnit
    BuildUnit
    HeroUnit
    SpecialUnit
```