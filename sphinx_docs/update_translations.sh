#!/bin/bash
# 脚本：更新和编译翻译文件

set -e

echo "=== 更新 Sphinx 多语言翻译 ==="

# 安装依赖
echo "安装依赖..."
pip install sphinx-intl -q

# 生成翻译模板
echo "生成翻译模板..."
make gettext 2>/dev/null || {
    echo "首次运行，创建 .po 文件..."
    mkdir -p locale/zh_CN/LC_MESSAGES
}

# 更新翻译文件
echo "更新翻译文件..."
make update-translations

# 编译翻译文件（生成 .mo 文件）
echo "编译翻译文件..."
sphinx-intl build

# 验证
echo "验证翻译文件..."
if [ -f "locale/zh_CN/LC_MESSAGES/getting_started.mo" ]; then
    echo "✓ 翻译文件编译成功"
    ls -lh locale/zh_CN/LC_MESSAGES/*.mo
else
    echo "✗ 翻译文件未找到"
fi

echo "=== 完成 ==="
echo ""
echo "下一步："
echo "1. 检查 locale/zh_CN/LC_MESSAGES/*.po 文件，确保翻译完整"
echo "2. 提交更改: git add locale/ && git commit -m 'Update translations' && git push"
echo "3. 在 Read the Docs 上创建中文翻译子项目（参见 MULTILANG_SETUP.md）"

