Explain perspective projection
----

Demo: http://r.tiye.me/Quatrefoil-GL/explain-perspective-projection/

### 使用者影响

配对使用正式 Calcit CLI/procs 0.32.1，类型标注由官方 CLI 迁移。
Quatrefoil 0.2.0、Quaternion 0.2.19、Touch Control 0.0.35、Pointed Prompt 0.0.24、
JS-FFI 0.2.9 组成一致的正式依赖图。包龄明确为 60 分钟，无单版本豁免。
保留原类型/质量门禁和 hud! 页面提示，不新增验证脚本或测试框架，不提交生成目录。

投影公式、Projection字段、坐标轴、相机、原0.01 scale及菜单内容不变。
说明面板的可选子节点改成Respo list->显式列表，保留链接键0和说明键1。
新增真实菜单操作NavOp，只有states(cursor:List<Tag>,state:Map<Tag,Dynamic>)；
菜单实际构造此Enum并绑定Respo dispatch-op，render!通过对应类型回调转发。
原Quatrefoil开放dispatch/updater及其兼容行为不变，不用dynamic类型槽绕过检查。

说明面板配对正式Markdown 0.5.0、UI 0.9.0、Respo 0.17.1；UI固定依赖Router
0.9.0-alpha.4，该传递alpha保留，不宣称整个依赖图都已稳定。

### 开发与验收

```sh
caps --strict --ci
yarn install --immutable
caps verify --toolchain
yarn compile
yarn build
yarn dev
```

完整strict、370/370定义、30/30公开定义、配对工具链、immutable安装、编译和构建通过。
原项目无附带测试，本轮不新增测试框架。实际IAB菜单多次开关、Markdown显示、
相机靠近及刷新通过，控制台无警告/错误；不宣称所有3D参数、VR、移动硬件或跨GPU验收。
默认远景仍极小，桌面聚焦改进见 [issue #6](https://github.com/Quatrefoil-GL/explain-perspective-projection/issues/6)，迁移不改变VR坐标或场景布局。

COS仅使用action内置public-base-url校验，PR prefix按编号/run/attempt隔离，
原生产CDN、rsync路径与main触发条件不变；本地构建不代替实际上传和生产验收。

### License

MIT
