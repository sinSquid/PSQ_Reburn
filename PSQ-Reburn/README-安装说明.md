# PSQ Reburn v0.28

本包为 PSQ Reburn v0.28 修订 64，单独服装包、动作包和 Optional 内的额外资源不包括在内。

安装和升级前结束互动、退出变身及飞行，备份 .ess 和 .skse 后退出游戏。安装本体与所需前置，停用旧 PSQ 和累积补丁。

主插件依赖 Skyrim.esm、Heels Sound.esm 与 SexLab.esm。需要匹配游戏版本的 SKSE、SkyUI、PapyrusUtil，SexLab SE 1.63 或 P+ 2.19 二选一，外观、服装及可选功能需各自前置。

Body Change NG 相关功能需独立安装 Body Change NG 1.3.8 及其前置，PSQ 提供接口版 DLL 1.3.8.1/API4；在 MO2 中让 PSQ 覆盖 BCNG 同名 DLL。不同版本需确认对应接口兼容性。

变身服装只保留 Helena Succubus，需启用 `Helena Succubus [SE].esp` 并安装对应适配资源；六部位仍可分别关闭。其他套装已从当前逻辑退役，不再使用 Set08/Hiroshi 备用模型。UBE 需对应的 Helena 转换。AWU 独立翅膀、可选角饰、独立飞行及 TRX 功能继续保留，并需各自前置。

近期变身流程优化、尾巴清理及外观恢复经过离线检查；游戏内结果和性能改善幅度取决于具体环境，仍需验证。历史文件见 Docs，存在旧版信息时以较新的适配文档为准。

本体包含第三方资源与代码，相关署名、来源及许可请参阅仓库 README 和随附文件。

修订 62 修复了 UBE 可选装备检查、魅惑冷却、自动变身开关联动，以及 BCNG 的快捷键捕获和预设文件名识别；同步了相关 PSC 与发行 PEX 的页面及场景入口。DLL 仍使用 1.3.8.1/API4，需与本修订配套覆盖。修复通过编译及离线回归，游戏内表现仍需验证。

修订 63：独立翅膀目录改为可选 Animated Wings Ultimate 1.3.0（No Flying Mod Integration），保留服装翼，退役旧 Animated Dragon Wings／Animated Fairy Wings 路径检测。PSQ 服装翼仍为45槽，AWU装备保留原47槽，按实际槽位保存/恢复装备。此接入不提供起降自动收放，仍由独立飞行模组控制飞行。
