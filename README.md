Explain perspective projection
----

Demo: http://r.tiye.me/Quatrefoil-GL/explain-perspective-projection/

### 使用者影响

配对正式 **Calcit CLI / @calcit/procs 0.37.0**。完整正式图使用 Quatrefoil **0.3.4**、
Quaternion **0.2.23**、Touch Control **0.0.39**、Pointed Prompt **0.0.27**、
Markdown **0.8.2**、UI **0.15.2**、Respo **0.19.5**、JS-FFI **0.2.13**、Router **0.12.2**；
需整体安装后重新生成 JS，不混装旧图，不再保留传递 Router alpha。

三份材质常量使用 `MaterialValue = Tag | Number | Bool`，两个 CSS 常量明确为 String；
三维 helper 和 Projection 的 p0/shadow 明确要求三项 Number Tuple，不再将任意长度
List 视作完整坐标合同。两个已存在的三项字面量使用受检静态标注，没有运行时转换。

投影公式、坐标次序、相机、原 0.01 scale、菜单内容和 HUD 保持。唯一可选场景子节点
用 Quatrefoil 已有 Option some/none 表达，关闭时仍无子节点；两处竖直间距迁为同尺寸
space-y。菜单继续构造名义 NavOp，开放 Quatrefoil dispatch/updater 的兼容行为保持。

原 Node 24、Yarn 4.18.0 和全部 npm/Three/Vite 锁版本保持，仅 procs 更新。
原类型门禁、生产 CDN/rsync 路径不变；不新增验证脚本或测试框架，不提交生成目录。

### 开发与验收

```sh
caps --strict --ci
yarn install --immutable
caps verify --toolchain
yarn compile
yarn build
yarn dev
```

此前 0.34.2 迁移的正式 Caps strict/toolchain、immutable、canonical dry-run、375/375 全定义、31/31
公开定义、完整 strict（diagnostics=[]）、编译及构建通过。原项目没有附带测试套件，
不把空套件当作通过；临时 native 数学验收覆盖向量加法、缩放及原投影的倍率/原点字段。
同一官方 0.34.2 对照中 schema Dynamic **17→12**、unresolved **25→18**，unsafe/deprecated
为零，不放宽门禁。官方 CLI 全量逐定义对照保留原公式、测试、示例与 FFI。

全新临时 Chrome 156 headless profile 以真实鼠标三轮开关 Menu、显示原 Markdown 并刷新。
实际 Three 场景 25 个 geometry、51231 项坐标有限，菜单开关前后缓冲区摘要相同；截图已检查。
默认远景仍极小，桌面聚焦改进仍见 [issue #6](https://github.com/Quatrefoil-GL/explain-perspective-projection/issues/6)，
不改变 VR 坐标或原场景布局。本轮不承诺所有参数、相机交互、实体移动硬件、VR 或跨 GPU 验收。
本次 0.37.0 的 CI 和评审见迁移 PR。

COS仅使用action内置public-base-url校验，PR prefix按编号/run/attempt隔离，
原生产CDN、rsync路径与main触发条件不变；本地构建不代替实际上传和生产验收。

### License

MIT
