#!/bin/bash
# TeX Live 版本切换脚本 for macOS
# 用法: ./switch-texlive.sh [2019|2024|2025]

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "当前 TeX Live 版本:"
    /Library/TeX/texbin/xelatex --version | head -1
    echo ""
    echo "已安装的版本:"
    ls -d /usr/local/texlive/[0-9]* 2>/dev/null | xargs -n1 basename || echo "  无"
    echo ""
    echo "用法: $0 <版本号>"
    echo "示例: $0 2019"
    echo "      $0 2024"
    echo "      $0 2025"
    exit 1
fi

# 检查版本是否存在
TEXLIVE_PATH="/usr/local/texlive/$VERSION"
if [ ! -d "$TEXLIVE_PATH" ]; then
    echo "❌ 错误: TeX Live $VERSION 未安装"
    echo ""
    echo "已安装的版本:"
    ls -d /usr/local/texlive/[0-9]* 2>/dev/null | xargs -n1 basename || echo "  无"
    echo ""
    echo "如需安装 TeX Live $VERSION:"
    echo "  1. 访问 https://tug.org/historic/systems/mactex/"
    echo "  2. 下载 MacTeX-$VERSION.pkg"
    echo "  3. 双击安装"
    exit 1
fi

# 查找 bin 目录
BIN_DIR=""
if [ -d "$TEXLIVE_PATH/bin/universal-darwin" ]; then
    BIN_DIR="$TEXLIVE_PATH/bin/universal-darwin"
elif [ -d "$TEXLIVE_PATH/bin/x86_64-darwin" ]; then
    BIN_DIR="$TEXLIVE_PATH/bin/x86_64-darwin"
elif [ -d "$TEXLIVE_PATH/bin/arm64-darwin" ]; then
    BIN_DIR="$TEXLIVE_PATH/bin/arm64-darwin"
else
    echo "❌ 错误: 找不到 TeX Live $VERSION 的 bin 目录"
    exit 1
fi

echo "正在切换到 TeX Live $VERSION..."
echo "目标路径: $BIN_DIR"

# 需要 sudo 权限
sudo ln -sfn "$BIN_DIR" /Library/TeX/texbin

echo ""
echo "✅ 成功切换到 TeX Live $VERSION"
echo ""
echo "验证:"
/Library/TeX/texbin/xelatex --version | head -1
/Library/TeX/texbin/pdflatex --version | head -1

echo ""
echo "提示: VS Code 重启后生效"
