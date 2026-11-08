# Helena UBE 可选资源

默认不安装。仅使用 UBE 身形时，将本目录内容作为单独模组安装并覆盖 PSQ 核心，启用 `PSQ UBE Outfits.esp`。与 Helena 3BA 方案择一使用；在 PSQ 中选择 UBE 对应身形后，仅 Helena 服装（选择 ID 2）受支持。

依赖：PSQ 核心、`UBE_AllRace.esp` 与 UBE SE 2.0 BodySlide 工程、`Heels Sound.esm`、`SexLab.esm`，以及 `Helena Succubus [SE].esp` 原模组提供的贴图（包括 `textures/dx/succubus`）。本目录不复制第三方完整身体或原服装包。

BodySlide 中使用 `PSQ UBE Outfits` 下的六个“海伦娜魅魔”工程。输出位于 `meshes/!UBE/PSQ/ExternalOutfits/Helena`；翅膀为槽位 45。AWU 翅膀仍用槽位 47。

ESP 保留上游 v0.29 原件，其中包含其他服装的被动记录。本目录只提供 Helena 资源，PSQ 菜单也只启用 Helena；其他记录不构成完整服装支持。未引入 DX 变体插件。

基础来源：StoneAR-Tank/PSQ_Reburn，提交 `54575f64f9047bfe113cd34a27e73bdfb161c38f`，精确提取 Helena 运行模型、BodySlide 工程及其共享滑块数据。

v0.3 fork 修订66将胸甲模型／变形和对应BodySlide工程更新至上游 `bafe114bff095844187c69cbc74d831e22f301eb`：新增默认开启的隐藏 `PSQNoCorsetWings` 滑块，去除胸甲附带翼。请重新构建Helena工程，避免旧个人输出覆盖此修正；独立服装翼仍为45槽。新UBE纹样贴图随核心提供，不改变本组件的外部身体与服装前置。
