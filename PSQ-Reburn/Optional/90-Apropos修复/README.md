# Apropos 2 损伤修复可选补丁

默认不安装。已安装并启用 `Apropos2.esp` 时，将本目录的 `scripts` 与 `SKSE` 内容作为单独模组安装并覆盖 PSQ 核心。补丁同时需要实际脚本和 `SKSE/Plugins/PSQ/AproposRepair.enabled` 标记，勿只复制其中一项。

核心版本使用无操作的 `PSQAproposRepairScript`，不直接引用 Apropos 2 类型。安装本补丁后，修复仍检查玩家、Apropos 损伤功能、当前状态及能量；互动期间不执行。没有等级损伤时不消耗能量，修复失败时调用 PSQ 的退款流程。

`scripts/source` 为从同目录 PEX 恢复的完整可读源码，供审查使用；不是独立编译环境。修改它不会自动重建 PEX。

来源：StoneAR-Tank/PSQ_Reburn，提交 `54575f64f9047bfe113cd34a27e73bdfb161c38f`。
