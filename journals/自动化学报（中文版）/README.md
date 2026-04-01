# 自动化学报（中文版）LaTeX 模板说明

本目录收录官网《自动化学报（中文版）》模板文件。
仅仅对figure文件的存放做了统一调整，所有的图片放在`./figures`目录下，作者信息放在`figures/bio`目录下。

## 使用前必读

请先阅读本目录官方说明文件：

- `LaTex排版注意事项.txt`

说明：该 txt 为官方给出的排版注意事项与环境建议，使用模板前请先通读。

## 环境配置

根据官方 txt，推荐安装版本：

- `CTex_2.9.2.164_Full`

经测试，以下版本同样可用：

- `CTeX_2.9.2.167_Full.exe`

下载地址：

- https://mirrors.tuna.tsinghua.edu.cn/ctex/legacy/2.9/

## 编译与使用

1. 不要修改类文件（如 `aas.cls`），主要在 `template.tex` 中写作。
2. 建议图像路径统一使用 `/`，在 Windows/macOS/Linux 上都可正常识别。
3. 当前示例已将图片引用替换为 pdf 版本，便于跨平台编译与减小仓库体积。
4. 编译时建议在模板目录内执行常规流程（如 LaTeX 工具链连续编译两次）。

## 目录说明

- `template.tex`：模板主文件
- `figures/`：示例图片（已优先使用 pdf）
- `LaTex排版注意事项.txt`：官方说明

