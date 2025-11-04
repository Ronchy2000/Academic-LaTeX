# MacTeX 多版本管理指南

本文档说明如何在 macOS 上安装和管理多个 TeX Live 版本 (2019/2024/2025)。

## 当前状态

运行以下命令查看当前版本:
```bash
./switch-texlive.sh
```

## 安装 MacTeX 2019

### 方法 1: 直接下载 (推荐)

1. **下载安装包**
   ```bash
   # 使用浏览器访问以下链接下载 (约 3.9GB)
   open "https://tug.org/historic/systems/mactex/2019/MacTeX-2019.pkg"
   
   # 或使用 curl 下载 (需要时间)
   curl -O https://tug.org/historic/systems/mactex/2019/MacTeX-2019.pkg
   ```

2. **安装**
   - 双击 `MacTeX-2019.pkg` 进行安装
   - 按照提示完成安装
   - 安装位置: `/usr/local/texlive/2019`

### 方法 2: FTP 镜像下载

如果上述链接失败,可尝试镜像站点:

**清华大学镜像 (推荐)**:
```bash
# 清华大学 TeX 历史存档镜像
open "https://mirrors-i.tuna.tsinghua.edu.cn/tex-historic-archive/systems/mactex/2019/MacTeX-2019.pkg"
```

**其他镜像**:
```bash
# 中国科技大学镜像
open "https://mirrors.ustc.edu.cn/CTAN/systems/mac/mactex/MacTeX-2019.pkg"
```

**完整历史版本列表**:
- 清华镜像: https://mirrors-i.tuna.tsinghua.edu.cn/tex-historic-archive/systems/
- TUG 官方: https://tug.org/historic/systems/mactex/

### 验证安装

安装完成后,验证:
```bash
ls -d /usr/local/texlive/2019
# 应该显示: /usr/local/texlive/2019
```

## 版本切换

### 使用切换脚本 (推荐)

项目提供了 `switch-texlive.sh` 脚本:

```bash
# 查看当前版本和已安装版本
./switch-texlive.sh

# 切换到 2019
./switch-texlive.sh 2019

# 切换到 2024
./switch-texlive.sh 2024

# 切换到 2025
./switch-texlive.sh 2025
```

### 手动切换

如果脚本不工作,可以手动切换:

```bash
# 切换到 2019
sudo ln -sfn /usr/local/texlive/2019/bin/universal-darwin /Library/TeX/texbin

# 切换到 2024
sudo ln -sfn /usr/local/texlive/2024/bin/universal-darwin /Library/TeX/texbin

# 切换到 2025
sudo ln -sfn /usr/local/texlive/2025/bin/universal-darwin /Library/TeX/texbin
```

### 验证切换

```bash
/Library/TeX/texbin/xelatex --version | head -1
# 应该显示对应版本,如: XeTeX ... (TeX Live 2019)
```

## VS Code 配置

### 重要: 使用符号链接路径

确保 VS Code 的 settings.json 使用 `/Library/TeX/texbin` 而非绝对路径。

**正确配置** ✅:
```json
"command": "/Library/TeX/texbin/xelatex"
```

**错误配置** ❌:
```json
"command": "/usr/local/texlive/2025/bin/universal-darwin/xelatex"
```

当前项目已正确配置,无需修改。

### 切换后重启 VS Code

版本切换后,**必须重启 VS Code** 才能生效:
```bash
# 命令行重启 VS Code
killall "Visual Studio Code" && code .
```

或手动退出并重新打开 VS Code。

## 使用场景

### 场景 1: 使用 2019 编译旧模板

```bash
# 1. 切换到 2019
./switch-texlive.sh 2019

# 2. 重启 VS Code
killall "Visual Studio Code" && code .

# 3. 正常编译 (Cmd+S)
```

### 场景 2: 切回最新版本

```bash
# 1. 切换到 2025
./switch-texlive.sh 2025

# 2. 重启 VS Code
```

## 故障排查

### 问题 1: 切换后版本未变化

**解决**: 重启 VS Code 或检查 PATH:
```bash
echo $PATH | grep -o '/Library/TeX/texbin'
# 应该包含 /Library/TeX/texbin
```

### 问题 2: sudo 要求密码

**正常**: 切换需要管理员权限,输入 macOS 密码即可。

### 问题 3: 找不到 universal-darwin

某些版本可能使用 `x86_64-darwin` 或 `arm64-darwin`:
```bash
ls /usr/local/texlive/2019/bin/
# 查看实际目录名
```

脚本会自动检测正确的目录。

### 问题 4: 编译仍然出错

1. 清理辅助文件:
   ```bash
   rm -f *.aux *.log *.out *.xdv
   ```

2. 重新编译

## 磁盘空间

每个完整的 MacTeX 安装约占用 **7-8 GB**:
- MacTeX 2019: ~7 GB
- MacTeX 2024: ~8 GB  
- MacTeX 2025: ~8 GB

确保有足够空间。

## 卸载旧版本

如果不再需要某个版本:

```bash
# 卸载 2019 (谨慎!)
sudo rm -rf /usr/local/texlive/2019

# 卸载 2024
sudo rm -rf /usr/local/texlive/2024
```

**警告**: 卸载后无法恢复,需重新下载安装。

## 在 shell 中添加快捷命令 (可选)

编辑 `~/.zshrc`:
```bash
# 添加 TeX 版本切换别名
alias tex2019='sudo ln -sfn /usr/local/texlive/2019/bin/universal-darwin /Library/TeX/texbin && echo "切换到 TeX Live 2019"'
alias tex2024='sudo ln -sfn /usr/local/texlive/2024/bin/universal-darwin /Library/TeX/texbin && echo "切换到 TeX Live 2024"'
alias tex2025='sudo ln -sfn /usr/local/texlive/2025/bin/universal-darwin /Library/TeX/texbin && echo "切换到 TeX Live 2025"'
alias texversion='/Library/TeX/texbin/xelatex --version | head -1'

# 重新加载配置
source ~/.zshrc
```

使用:
```bash
tex2019      # 切换到 2019
texversion   # 查看当前版本
```

## 总结

1. ✅ 下载并安装 MacTeX 2019
2. ✅ 使用 `switch-texlive.sh` 切换版本
3. ✅ 切换后重启 VS Code
4. ✅ 正常编译项目

多版本并存不会冲突,可以随时切换! 🎉
