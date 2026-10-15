
(TODO)Expain perspective projection
----

> Based on [Quatrefoil](https://github.com/Quatrefoil-GL/quatrefoil).

Demo http://r.tiye.me/Quatrefoil-GL/explain-perspective-projection/

### 迁移说明

使用正式 Calcit/procs 0.30.0；依赖为 Quatrefoil 0.1.8、Quaternion 0.2.14、
Touch Control 0.0.31、Respo 0.16.120、UI 0.7.39 和 Markdown 0.4.54，
沿用它们声明的正式传递依赖，无 alpha/hash 或冲突豁免。

投影公式、单位坐标轴、Projection 字段、菜单、场景、相机及原 0.01 scale 不变。
清理两处无效果的 wo-log、旧 remove-watch 和 import 标记，不新增 cast、定义、
测试框架或编译器规则。仅维护 calcit.cirru/deps.cirru，不提交生成目录。

本地全定义 368/368、项目公开 29/29、完整 strict、配对工具链、immutable install
及 CDN 构建通过。八个数学/投影定义完整元数据不变，旧/新正式图上的 native
单位坐标轴与原点投影回放通过；菜单、说明面板、重载无 browser error。
本轮未重做键盘相机、完整 3D 操控、VR 或 WASM，不沿用历史记录冒充本轮验收。
formatter 仍有开放类型位置，未宣称全部类型债务清零，也未放宽 bundle 警告阈值。
正式 0.30.1 尚未发布，届时仍需配对更新。实际 COS 和生产验收以相应 Actions 为准。

### Frontend deployment

CI uses Calcit 0.30.0 and Node 24 with strict Caps, immutable Yarn, full-definition
checks and the read-only strict workflow gate. Frontend dist assets use COS Action
v1.2.0 builtin public checksum verification, with no separate verification script.
PR CDN paths include PR/run/attempt; production uses the original repository
prefix. Fork PRs build without deployment secrets. The original main rsync
destination remains unchanged; no backend deployment is migrated.

### Workflow

https://github.com/Quatrefoil-GL/quatrefoil-workflow

### License

MIT
