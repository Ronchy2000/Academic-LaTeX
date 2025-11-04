
# CJC LaTeX 模板

这是一个适用于 macOS 的中文 LaTeX 模板项目，支持多版本 TeX Live 管理。

## ⚠️ 重要提示

**此模板必须使用 PDFLaTeX 编译!**

- ✅ **推荐**: PDFLaTeX + TeX Live 2019
- ❌ **不支持**: XeLaTeX、LuaLaTeX
- 📝 **原因**: 模板使用特定的中文字体映射和 CJK 宏包，仅兼容 PDFLaTeX

如果使用 XeLaTeX 或 LuaLaTeX 编译，会出现字体错误或格式问题。

## 项目结构

```
.
├── CjC_main.tex          # 主文档
├── CjC_main.pdf          # 编译生成的 PDF (被 gitignore)
├── CjC.cls               # 自定义文档类
├── zhwinfonts.tex        # 中文字体配置
├── switch-texlive.sh     # TeX Live 版本切换脚本
├── INSTALL_TEXLIVE.md    # TeX Live 多版本安装指南
└── fonts/                # 项目字体目录（所有字体已包含）
    ├── simsun.ttc        # 宋体 (Windows)
    ├── simkai.ttf        # 楷体 (Windows)
    ├── simhei.ttf        # 黑体 (Windows)
    ├── simfang.ttf       # 仿宋 (Windows)
    ├── simli.ttf         # 隶书 (Windows)
    ├── simyou.ttf        # 幼圆 (Windows)
    ├── Fsong_GB2312.ttf  # 仿宋字体 (备用)
    ├── Kaiti_GB2312.ttf  # 楷体字体 (备用)
    ├── STHeiti-Light.ttc # 华文黑体 Light (备用)
    └── STHeiti-Medium.ttc# 华文黑体 Medium (备用)
```

## 特性

✅ **专为 PDFLaTeX 优化**: 使用 PDFLaTeX 编译引擎，兼容性最佳  
✅ **便携性强**: 所有中文字体已包含在 `fonts/` 目录中，无需安装系统字体  
✅ **多版本管理**: 支持 TeX Live 2019/2024/2025 多版本共存和切换  
✅ **兼容性强**: 使用 Windows 标准中文字体，与在线模板完全兼容  
✅ **TeX Live 2019**: 推荐使用 TeX Live 2019，兼容性和稳定性最佳  
✅ **自动编译**: 保存时自动编译  
✅ **自动清理**: 编译失败时自动清理辅助文件  
✅ **Git 友好**: 所有编译产物已添加到 `.gitignore`  

## 使用方法

### 1. 环境要求

- macOS 系统
- 安装 [MacTeX](https://www.tug.org/mactex/) (推荐 TeX Live 2019 以获得最佳兼容性)
- 安装 VS Code 及 [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 插件

### 2. TeX Live 版本管理

#### 为什么需要 TeX Live 2019?

某些模板在 TeX Live 2025 上可能出现兼容性问题，推荐使用 TeX Live 2019 以获得最佳兼容性。

Texlive or MacTex 历史版本下载链接：[https://mirrors-i.tuna.tsinghua.edu.cn/tex-historic-archive/systems/](https://mirrors-i.tuna.tsinghua.edu.cn/tex-historic-archive/systems/).

#### 查看当前版本

```bash
./switch-texlive.sh
```

输出示例：
```
当前 TeX Live 版本:
XeTeX 3.14159265-2.6-0.999991 (TeX Live 2019)

已安装的版本:
2019
2024
2025
```

#### 切换 TeX Live 版本

```bash
# 切换到 2019 (推荐，兼容性最好)
./switch-texlive.sh 2019

# 切换到 2025
./switch-texlive.sh 2025

# 切换到 2024
./switch-texlive.sh 2024
```

**重要**: 切换版本后需要**重启 VS Code** 才能生效：
```bash
# 方式 1: 命令行重启
killall "Visual Studio Code" && code .

# 方式 2: 手动退出并重新打开 VS Code
```

#### 安装 TeX Live 2019

如果你还没有安装 TeX Live 2019，请参考 [`INSTALL_TEXLIVE.md`](INSTALL_TEXLIVE.md) 文档获取详细安装指南。

### 3. 打开项目

```bash
cd /path/to/CJC_PACE
code .
```

### 4. 编译文档

**⚠️ 重要: 必须使用 PDFLaTeX 编译器!**

有多种编译方式可选：

#### 方式 1: 自动编译（推荐）
- 打开 `CjC_main.tex`
- 按 `Cmd+S` 保存文件
- **自动使用 PDFLaTeX** 编译，PDF 将在 VS Code 中自动预览

#### 方式 2: 手动选择编译器
- 按 `Cmd+Shift+P` 打开命令面板
- 输入 `LaTeX Workshop: Build with recipe`
- **必须选择 PDFLaTeX 相关选项**：
  - ✅ **PDFLaTeX** (推荐)
  - ✅ **PDFLaTeX ➞ BibTeX ➞ PDFLaTeX×2** (如果有参考文献)
  - ✅ **latexmk (PDFLaTeX) 🔃** (自动处理多次编译)
  - ❌ ~~XeLaTeX~~ (不支持)
  - ❌ ~~LuaLaTeX~~ (不支持)

#### 方式 3: 快捷键
- `Cmd+Alt+B`: 使用上次的编译配置编译 (确保使用 PDFLaTeX)
- `Cmd+Alt+V`: 查看 PDF

#### 方式 4: 命令行编译
```bash
# 使用 PDFLaTeX 编译
/Library/TeX/texbin/pdflatex -interaction=nonstopmode CjC_main.tex

# 如果有参考文献，需要多次编译
/Library/TeX/texbin/pdflatex CjC_main.tex
/Library/TeX/texbin/bibtex CjC_main
/Library/TeX/texbin/pdflatex CjC_main.tex
/Library/TeX/texbin/pdflatex CjC_main.tex
```

## 编译器说明

### ⭐ PDFLaTeX (此模板唯一支持的编译器)

**必须使用 PDFLaTeX!** 这是此模板的硬性要求。

- ✅ **完全兼容**: 与在线模板完全兼容
- ✅ **编译速度快**: 比 XeLaTeX 快 2-3 倍
- ✅ **字体支持**: 使用 Windows 标准中文字体 + CJK 宏包
- ✅ **最佳版本**: TeX Live 2019 兼容性和稳定性最佳
- ✅ **CJK 宏包**: 通过 `zhwinfonts.tex` 实现中文支持
- 🎯 **适用场景**: CJC 模板（唯一选择）

### ❌ XeLaTeX (不支持)

**警告**: 此模板不支持 XeLaTeX!

- ❌ 与模板的字体配置不兼容
- ❌ 会导致字体加载错误
- ❌ 可能出现编译失败或格式错误
- ℹ️ XeLaTeX 适合其他类型的中文文档，但不适合此模板

### ❌ LuaLaTeX (不支持)

**警告**: 此模板不支持 LuaLaTeX!

- ❌ 与模板的 CJK 配置不兼容
- ❌ 编译速度慢且可能失败
- ℹ️ LuaLaTeX 适合需要高级功能的项目，但不适合此模板

## 字体说明

### Windows 标准中文字体（主要）

项目使用 Windows 标准中文字体，与在线 LaTeX 平台完全兼容：

| 字体文件 | 字体名称 | 用途 | 大小 |
|---------|---------|------|------|
| `simsun.ttc` | 宋体 | 正文、标题 | 10 MB |
| `simkai.ttf` | 楷体 | 强调文本 | 11 MB |
| `simhei.ttf` | 黑体 | 标题、加粗 | 9.3 MB |
| `simfang.ttf` | 仿宋 | 特殊格式 | 10 MB |
| `simli.ttf` | 隶书 | 装饰性文字 | 8.8 MB |
| `simyou.ttf` | 幼圆 | 装饰性文字 | 6.4 MB |

这些字体来自 Windows 系统，**仅供个人学习使用**。

### 备用字体

项目还包含以下备用字体：
- `Fsong_GB2312.ttf` - 仿宋 GB2312
- `Kaiti_GB2312.ttf` - 楷体 GB2312
- `STHeiti-Light.ttc` - 华文黑体轻
- `STHeiti-Medium.ttc` - 华文黑体中

### 字体配置文件

`zhwinfonts.tex` 文件负责字体映射，已配置为自动使用项目 `fonts/` 目录中的字体，无需安装到系统。

### 字体版权说明

- **Windows 字体**: 来自 Windows 系统，仅供个人学习研究使用
- **商业使用**: 如需商业使用，请购买相应字体授权
- **开源替代**: 可使用思源宋体、思源黑体等开源字体替代

## 输出文件

- **PDF 文档**: `CjC_main.pdf` (在项目根目录)
- **辅助文件**: 所有 `.aux`、`.log`、`.out` 等文件都在项目根目录中
- **Git**: 所有编译产物已被 `.gitignore` 忽略,不会提交到仓库

## 清理辅助文件

LaTeX Workshop 提供了多种清理方式：

### 自动清理
编译失败时会自动清理辅助文件（已在 settings.json 中配置）

### 手动清理
**方式 1**: 使用命令面板
- 按 `Cmd+Shift+P`
- 输入 `LaTeX Workshop: Clean up auxiliary files`

**方式 2**: 使用终端
```bash
# 清理当前目录的辅助文件
cd /path/to/CJC_PACE
rm -f *.aux *.log *.out *.toc *.xdv *.bbl *.blg *.synctex.gz

# 注意: 这也会删除 PDF 文件
rm -f *.pdf
```

## 常见问题

### Q: 为什么推荐 TeX Live 2019？
**A**: 此模板在 TeX Live 2019 上测试通过，与在线 LaTeX 平台完全兼容。TeX Live 2025 可能存在一些兼容性问题。

### Q: 如何切换 TeX Live 版本？
**A**: 使用 `./switch-texlive.sh 2019` 切换到 2019，切换后**必须重启 VS Code**。

### Q: 切换版本后编译仍使用旧版本？
**A**: 
1. 确认切换成功：`./switch-texlive.sh` 查看当前版本
2. 重启 VS Code：`killall "Visual Studio Code" && code .`
3. 检查符号链接：`ls -l /Library/TeX/texbin`

### Q: 编译错误怎么办？
**A**: 
1. **确认使用 PDFLaTeX**: 在 VS Code 左下角查看编译器，必须是 PDFLaTeX
2. 确认使用 TeX Live 2019：`./switch-texlive.sh 2019`
3. 清理辅助文件：`rm -f *.aux *.log *.out`
4. 重新编译：按 `Cmd+S` 保存文件
5. 查看错误日志：查看 VS Code 输出面板

### Q: 使用 XeLaTeX 或 LuaLaTeX 编译失败？
**A**: 
此模板**不支持** XeLaTeX 和 LuaLaTeX! 必须使用 PDFLaTeX:
1. 按 `Cmd+Shift+P` 打开命令面板
2. 输入 `LaTeX Workshop: Build with recipe`
3. 选择 `PDFLaTeX` 或 `latexmk (PDFLaTeX)`
4. 不要选择 XeLaTeX 或 LuaLaTeX 选项

### Q: PDF 没有自动打开？
**A**: 
- 在 VS Code 右侧面板查看
- 或执行命令：`LaTeX Workshop: View LaTeX PDF`
- 或手动打开：`open CjC_main.pdf`

### Q: 中文显示为方框 (□□□)？
**A**: 
1. **确认使用 PDFLaTeX 编译** (不是 XeLaTeX)
2. 检查 `fonts/` 目录是否包含所有 Windows 字体
3. 确认 `zhwinfonts.tex` 配置正确
4. 使用 PDFLaTeX + TeX Live 2019 编译

### Q: 如何切换编译器？
**A**: 
**警告**: 此模板只支持 PDFLaTeX，不要切换到其他编译器!
- 如果误用了其他编译器，按 `Cmd+Shift+P`
- 输入 `LaTeX Workshop: Build with recipe`
- 选择 `PDFLaTeX` 或 `latexmk (PDFLaTeX)`

### Q: 字体文件太大，可以删除备用字体吗？
**A**: 
可以。如果不需要备用字体，可以删除：
```bash
cd fonts/
rm -f Fsong_GB2312.ttf Kaiti_GB2312.ttf STHeiti-*.ttc
```
但建议保留 Windows 字体（sim*.ttf/ttc）。

### Q: 如何获取 Windows 字体？
**A**: 
1. 从 Windows 系统复制：`C:\Windows\Fonts\`
2. 使用虚拟机中的 Windows 系统
3. 在线搜索 "Windows 中文字体包"（仅供学习）

### Q: macOS 上没有 Windows 系统怎么办？
**A**: 
可以使用 macOS 系统字体替代：
```bash
cd fonts/
ln -sf /System/Library/Fonts/PingFang.ttc simsun.ttc
ln -sf /System/Library/Fonts/PingFang.ttc simhei.ttf
# ... 创建其他符号链接
```
但可能与在线模板效果略有差异。

## VS Code 配置

项目已配置好 LaTeX Workshop，无需额外设置。如果需要自定义配置，可以在用户或工作区的 `settings.json` 中修改。

### 关键配置项

- `latex-workshop.latex.autoBuild.run`: 保存时自动编译
- `latex-workshop.latex.autoClean.run`: 失败时自动清理
- 输出文件在项目根目录，所有编译产物已被 `.gitignore` 忽略
- 编译器路径使用 `/Library/TeX/texbin` 符号链接，支持版本切换

### 符号链接说明

VS Code 配置使用 `/Library/TeX/texbin` 作为 TeX 命令路径，这是一个符号链接，指向当前激活的 TeX Live 版本：

```bash
# 查看当前符号链接
ls -l /Library/TeX/texbin

# 输出示例（指向 2019）
lrwxr-xr-x  1 root  wheel  56  11  4 19:00 /Library/TeX/texbin -> /usr/local/texlive/2019/bin/universal-darwin
```

这样设计的好处：
- ✅ 切换 TeX Live 版本时，VS Code 配置无需修改
- ✅ 所有使用 `/Library/TeX/texbin` 的应用自动使用当前版本
- ✅ 通过 `switch-texlive.sh` 统一管理版本切换

## 快速开始指南

### 首次使用

1. **确认环境**
   ```bash
   # 查看已安装的 TeX Live 版本
   ./switch-texlive.sh
   ```

2. **切换到推荐版本**
   ```bash
   # 切换到 TeX Live 2019 (推荐)
   ./switch-texlive.sh 2019
   ```

3. **重启 VS Code**
   ```bash
   killall "Visual Studio Code" && code .
   ```

4. **编译文档 (使用 PDFLaTeX)**
   - 打开 `CjC_main.tex`
   - 按 `Cmd+S` 保存
   - **确认使用 PDFLaTeX 编译** (VS Code 左下角显示)
   - PDF 自动生成并预览

### 日常使用

1. 打开项目：`code .`
2. 编辑 `CjC_main.tex`
3. 按 `Cmd+S` 保存，**自动使用 PDFLaTeX 编译**
4. 查看 PDF 预览

### ⚠️ 重要提醒

- **必须使用 PDFLaTeX**: 不要使用 XeLaTeX 或 LuaLaTeX
- **推荐 TeX Live 2019**: 兼容性最佳
- **首次编译**: 第一次编译可能较慢，之后会快很多

### 遇到问题

1. 清理辅助文件：`Cmd+Shift+P` → `LaTeX Workshop: Clean up auxiliary files`
2. 检查版本：`./switch-texlive.sh`
3. 查看日志：VS Code 输出面板

## 技术细节

### 为什么必须使用 PDFLaTeX?

此模板的技术架构决定了必须使用 PDFLaTeX:

1. **CJK 宏包**: 使用传统的 CJK 宏包处理中文，只兼容 PDFLaTeX
2. **字体映射**: 通过 `\pdfmapline` 命令映射字体，这是 PDFTeX 特有的功能
3. **编码方式**: 使用 GBK/Unicode 编码映射，与 XeLaTeX 的 fontspec 机制不兼容
4. **在线兼容**: 在线 LaTeX 平台也使用 PDFLaTeX + CJK 方案

### 字体加载机制

`zhwinfonts.tex` 文件通过 `\pdfmapline` 命令将 LaTeX 字体名映射到实际字体文件：

```tex
\pdfmapline{=gbk@UGBK@ <fonts/simsun.ttc}
\pdfmapline{=gbksong@UGBK@ <fonts/simsun.ttc}
\pdfmapline{=gbkkai@UGBK@ <fonts/simkai.ttf}
...
```

**关键点**:
- `\pdfmapline` 是 **PDFTeX 专用命令**
- XeLaTeX/LuaLaTeX 使用不同的字体系统 (fontspec)
- 两种系统互不兼容

这样 LaTeX 文档中的中文字体命令会自动使用项目 `fonts/` 目录中的字体。

### 版本切换原理

`switch-texlive.sh` 脚本通过修改 `/Library/TeX/texbin` 符号链接实现版本切换：

```bash
# 切换到 2019
sudo ln -sfn /usr/local/texlive/2019/bin/universal-darwin /Library/TeX/texbin

# 切换到 2025
sudo ln -sfn /usr/local/texlive/2025/bin/universal-darwin /Library/TeX/texbin
```

### 编译流程

1. VS Code 保存文件触发自动编译
2. 调用 `/Library/TeX/texbin/pdflatex`（符号链接）**[必须是 PDFLaTeX]**
3. pdflatex 加载 `zhwinfonts.tex` 配置字体 **[使用 \pdfmapline]**
4. 从 `fonts/` 目录读取 Windows 字体文件
5. 使用 CJK 宏包处理中文
6. 生成 PDF 文件
7. VS Code 自动预览 PDF

**关键**: 整个流程依赖 PDFLaTeX 的 `\pdfmapline` 和 CJK 宏包，XeLaTeX/LuaLaTeX 无法正常工作。

## 参考资源

- [MacTeX 官网](https://www.tug.org/mactex/)
- [TeX Live 历史版本](https://tug.org/historic/systems/mactex/)
- [LaTeX Workshop 文档](https://github.com/James-Yu/LaTeX-Workshop)
- [TeX Live 多版本管理指南](INSTALL_TEXLIVE.md)

## License

请参考各个文件头部的版权声明。字体文件仅供个人学习使用，商业使用请购买授权。
