# PSQ Reburn v0.28

本包由当前启用的 PSQ 本体修订 63 整理，单独服装包、动作包和 Optional 内的额外资源不包括在内。

安装和升级前结束互动、退出变身及飞行，备份 .ess 和 .skse 后退出游戏。安装本体与所需前置，停用旧 PSQ 和累积补丁。

主插件依赖 Skyrim.esm、Heels Sound.esm 与 SexLab.esm。需要匹配游戏版本的 SKSE、SkyUI、PapyrusUtil，SexLab SE 1.63 或 P+ 2.19 二选一，外观、服装及可选功能需各自前置。

Body Change NG 相关功能需独立安装 Body Change NG 1.3.8 及其前置，PSQ 提供接口版 DLL 1.3.8.1/API4；在 MO2 中让 PSQ 覆盖 BCNG 同名 DLL。不同版本需确认对应接口兼容性。

变身服装按上衣、靴子、手套、角、尾、翼六部分选择；独立服装需其原作及资源。Set08/Hiroshi 资源包未随本体提供，缺少时回退模型可能不可见。独立飞行及 TRX 模组、可选动作亦需各自安装。

近期变身流程优化、尾巴清理及外观恢复经过离线检查；游戏内结果和性能改善幅度取决于具体环境，仍需验证。历史文件见 Docs，存在旧版信息时以较新的适配文档为准。

本体包含第三方资源与代码，相关署名、来源及许可请参阅仓库 README 和随附文件。

修订 62 修复了 UBE 可选装备检查、魅惑冷却、自动变身开关联动，以及 BCNG 的快捷键捕获和预设文件名识别；同步了相关 PSC 与发行 PEX 的页面及场景入口。DLL 仍使用 1.3.8.1/API4，需与本修订配套覆盖。修复通过编译及离线回归，游戏内表现仍需验证。

修订 63：独立翅膀目录改为可选 Animated Wings Ultimate 1.3.0（No Flying Mod Integration），保留服装翼，退役旧 Animated Dragon Wings／Animated Fairy Wings 路径检测。PSQ 服装翼仍为45槽，AWU装备保留原47槽，按实际槽位保存/恢复装备。此接入不提供起降自动收放，仍由独立飞行模组控制飞行。
