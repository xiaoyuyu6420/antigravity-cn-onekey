# Antigravity 一键汉化（Windows）

Google [Antigravity 2.x](https://antigravity.google)（Agent 指挥中心桌面应用）的 Windows 一键中文汉化脚本。双击 `Localize.bat`，等 1 分钟，界面变中文。

> **汉化引擎来自 [qqxpee/antigravity2-cn](https://github.com/qqxpee/antigravity2-cn)**（ASAR 注入方案，覆盖界面/菜单/托盘/设置面板），本仓库只是给它套了一层更省事的引导脚本，不包含其任何代码——所有更新都实时从原仓库拉取。

## 前置要求

| 项目 | 说明 |
|---|---|
| 系统 | Windows 10 / 11 |
| Antigravity | 2.x 已安装（[antigravity.google](https://antigravity.google/download)） |
| Node.js | ≥ 18，[nodejs.org](https://nodejs.org) |
| git | [git-scm.com](https://git-scm.com) |

## 用法

1. 下载本仓库（`Code` → `Download ZIP` 解压，或 `git clone`）
2. 双击 **`Localize.bat`** —— 自动完成：关闭应用 → 拉取最新引擎（断网时用本地缓存）→ 注入 → 自动重启 Antigravity
3. 看到"汉化完成"即生效；首次运行会先克隆引擎仓库，需要网络

**官方每次自动更新都会把界面打回英文**（大约每 10 天一个版本），再双击一次 `Localize.bat` 即可恢复。

## 还原官方英文

双击 **`Restore.bat`**：从 `app.asar.bak` 备份无痕还原官方包并清缓存。

## 常见问题

- **登录页 / "Welcome back" 欢迎语还是英文？** 这些是 Google 云端下发的页面，不在本地注入范围内，属正常现象。
- **双击后一闪而过？** 右键 `Localize.bat` → 编辑，确认 `%USERPROFILE%\antigravity2-cn` 目录没被你挪过位置；或按住 Win+R 输入 `cmd` 再手动运行看报错。
- **公司网络克隆 GitHub 仓库失败？** 脚本内置 10 秒低速超时保护，断网时若本地已有引擎缓存仍可注入；首次使用必须联网。
- **能永久生效吗？** 不能。注入的是本地应用文件，官方更新必然覆盖，重跑即可。这是所有 ASAR 注入类汉化的共同限制。

## 致谢与声明

- 汉化引擎与词典：[qqxpee/antigravity2-cn](https://github.com/qqxpee/antigravity2-cn)（未声明许可证，版权归原作者所有；本仓库仅提供调用脚本，不包含、不再分发其任何代码）
- 本仓库脚本部分采用 [MIT](LICENSE) 许可
- 本项目与 Google 无关，仅供个人学习研究；使用第三方汉化有覆盖与失效风险，会话历史等用户数据存于系统用户目录，不受注入影响

## Star 历史

[![Star History Chart](https://api.star-history.com/svg?repos=xiaoyuyu6420/antigravity-cn-onekey&type=Date)](https://star-history.com/#xiaoyuyu6420/antigravity-cn-onekey&Date)
