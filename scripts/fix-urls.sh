#!/bin/bash
echo "🔧 修复 URL 访问问题..."
# 为标签目录创建直接访问文件
echo "📁 处理标签目录..."
cd public/tags
for dir in */; do
    if [ "$dir" != "" ]; then
        cp "$dir/index.html" "${dir%/}.html"
    fi
done

# 为分类目录创建直接访问文件
echo "📁 处理分类目录..."
cd ../categories
for dir in */; do
    if [ "$dir" != "" ]; then
        cp "$dir/index.html" "${dir%/}.html"
    fi
done

echo "✅ URL 修复完成"
