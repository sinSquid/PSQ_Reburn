# PSQ Reburn v0.3 fork

本包为 PSQ Reburn v0.3 fork 修订66，以 v0.29 Helena-only／AWU 版本为基础整合上游 v0.3 的适用更新。保留原安装布局和本地已修复的 DLL；没有 FOMOD 安装器。`Optional` 内容不会自动生效，需按下述说明单独合并。

安装和升级前结束互动、退出变身及飞行，备份 .ess 和 .skse 后退出游戏。安装本体与所需前置，停用旧 PSQ 和累积补丁。

主插件依赖 Skyrim.esm、Heels Sound.esm 与 SexLab.esm。需要匹配游戏版本的 SKSE、SkyUI、PapyrusUtil，SexLab SE 1.63 或 P+ 2.19 二选一，外观、服装及可选功能需各自前置。

Body Change NG 相关功能需独立安装 Body Change NG 1.3.8 及其前置，PSQ 提供接口版 DLL 1.3.8.1/API4；在 MO2 中让 PSQ 覆盖 BCNG 同名 DLL。不同版本需确认对应接口兼容性。

变身服装只保留 Helena Succubus，需启用 `Helena Succubus [SE].esp` 并安装对应适配资源；六部位仍可分别关闭。其他套装已从当前逻辑退役，不再使用 Set08/Hiroshi 备用模型。UBE 需对应的 Helena 转换。AWU 独立翅膀、可选角饰、独立飞行及 TRX 功能继续保留，并需各自前置。

近期变身流程优化、尾巴清理及外观恢复经过离线检查；游戏内结果和性能改善幅度取决于具体环境，仍需验证。历史文件见 Docs，存在旧版信息时以较新的适配文档为准。

本体包含第三方资源与代码，相关署名、来源及许可请参阅仓库 README 和随附文件。

## v0.3 适用更新

新增 UBE 女性身体的魅魔纹样贴图及眷属纹样延迟加载处理；Helena 胸甲去除附带翼，独立服装翼仍为45槽，AWU 翼仍为47槽。已有个人 BodySlide 输出可能覆盖新模型，请重新构建对应 Helena 工程。

合入变身身体请求、装备恢复和旧饱食属性清理的适用优化，兼容页资源诊断改为按需检查。详细整合范围及验证限制见 `Docs/上游v0.3整合-20261109.md`。

本 fork 继续使用当前83种可装备 AWU 翼及稳定菜单索引；没有切换到上游新增的法术翼控制方案，也不提供起降自动收放。已修复的冷却、原装备恢复及最终／延期补满保护继续保留。Apropos 仍为默认关闭的可选组件。

## v0.29 玩法更新

- 饱食模式默认关闭。启用后按能量分为饥饿（低于30%）、正常、饱足（80%及以上）；饥饿达到35%退出，饱足低于75%退出，每10秒更新，减少边界反复切换。
- 饥饿时吸取魅魔经验增加10%、练习技能经验减少10%；饱足时相反。固定种族天赋经验不参与。旧饱食对属性上限、恢复率、移速和负重的加减通过原安全更新流程撤销，其他变身／等级加成保留。
- 魅魔商人资金每24游戏小时按等级刷新，1级1万至10级10万金币；重复召唤不补钱。移除重复的31种法术书商品，保留学习能力与已学法术，新增10个空黑色灵魂石。

## 可选 Apropos 2 损伤修复

核心 `scripts/psqaproposrepairscript.pex` 是空实现，默认不启用修复。安装并启用 `Apropos2.esp` 后，将 `Optional/90-Apropos修复` 内的内容合并到本体根目录，覆盖脚本并提供 `SKSE/Plugins/PSQ/AproposRepair.enabled` 标记。

取消该组件时，移除本体根目录的上述标记，并用核心版本恢复 `scripts/psqaproposrepairscript.pex`；保留 Optional 中的文件不会自动启用。重新启动游戏读档后 PSQ 会收回未启用补丁的能力。请保留核心脚本备份，或从干净安装包重装本体再选择组件；不要把整个 Optional 目录扁平复制到 Data。

## Helena 身体体系与资源

本次只整合 Helena 适用的 BodySlide／UBE资源；其他上游服装与 Set08 备用模型没有重新启用。Helena 原作仍需单独安装。BodySlide需用户自行选择匹配的3BA或UBE预设，勾选建立变形后构建；不会自动运行BodySlide或附带个人预设。

使用可选 Helena UBE 资源前，需满足其插件的 `UBE_AllRace.esp`、`Heels Sound.esm`、`SexLab.esm` 前置，并保留 Helena 原作所提供的贴图。只启用一个生效的 `PSQ UBE Outfits.esp`；不要叠加旧的同名转换覆盖包或上游含DX变体。详细文件位置与限制见本次整合说明。

修订 62 修复了 UBE 可选装备检查、魅惑冷却、自动变身开关联动，以及 BCNG 的快捷键捕获和预设文件名识别；同步了相关 PSC 与发行 PEX 的页面及场景入口。DLL 仍使用 1.3.8.1/API4，需与本修订配套覆盖。修复通过编译及离线回归，游戏内表现仍需验证。

修订 63：独立翅膀目录改为可选 Animated Wings Ultimate 1.3.0（No Flying Mod Integration），保留服装翼，退役旧 Animated Dragon Wings／Animated Fairy Wings 路径检测。PSQ 服装翼仍为45槽，AWU装备保留原47槽，按实际槽位保存/恢复装备。此接入不提供起降自动收放，仍由独立飞行模组控制飞行。
