# 🚀 OpenCode for Termux

[![Termux](https://img.shields.io/badge/Termux-000000?style=for-the-badge&logo=termux&logoColor=white)](https://termux.com/)
[![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://www.android.com/)
[![Arch](https://img.shields.io/badge/Arch-ARM64-0091BD?style=for-the-badge&logo=arm&logoColor=white)](https://www.arm.com/)
[![Version](https://img.shields.io/badge/Version-1.17.3-blue?style=for-the-badge)](https://github.com/opencode-ai/opencode)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](./LICENSE)

> 在 Termux 中运行 OpenCode AI 编程助手的 ARM64 适配安装包，**开箱即用，无需编译**。

---

## 📖 这是什么？

|[OpenCode](https://github.com/opencode-ai/opencode) 是一个强大的 AI 编程助手，支持 Claude、OpenAI、DeepSeek 等多种 AI 模型，可直接在终端中帮助你编写、调试和解释代码。|
|[opencode-termux](https://github.com/Hope2333/opencode-termux) 由这个项目提供的可以在termux编译的opencode的文件|

---


本项目提供了：

| 特性 | 说明 |
|------|------|
| ✅ **预编译 DEB 包** | 无需编译源码，直接安装，省去 1-3 小时编译时间 |
| ✅ **一键安装脚本** | 自动完成依赖安装和环境配置，零门槛上手 |
| ✅ **即用型启动脚本** | 完美解决 Termux 环境下 glibc 兼容问题 |
| ✅ **开箱即用** | 安装完成后直接运行，无需额外配置 |

**你不需要编译任何东西，下载安装即可使用！**

---

## 🚀 快速开始

### 系统要求

| 项目 | 要求 |
|------|------|
| 设备架构 | ARM64 (aarch64) |
| 运行环境 | Termux（[下载地址](https://github.com/termux/termux-app)） |
| 存储空间 | 约 200MB |
| 网络 | 需要联网下载 glibc 依赖（约 30MB） |

> 💡 查看你的架构：在 Termux 中执行 `uname -m`，输出 `aarch64` 即可使用。

---

### 一键安装（推荐）

这是最快、最省心的方式：

```bash
# 1. 下载 DEB 安装包
# 从 Releases 页面下载，或使用本仓库中的文件

# 2. 将 opencode_1.17.3_aarch64.deb 放到 ~/ 目录下

# 3. 执行安装脚本
chmod +x install.sh
./install.sh
# 然后直接输入opencode就行
