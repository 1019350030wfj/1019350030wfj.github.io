#!/bin/bash
echo "🔧 修复标签编码URL问题..."
cd public/tags

# 获取所有标签目录
for dir in */; do
    if [ "$dir" != "" ] && [ -d "$dir" ]; then
        # 复制原始文件
        cp "$dir/index.html" "${dir%/}.html"
        
        # 创建编码版本（从首页链接中提取编码）
        encoded_name=$(grep -o "$dir[^\"/]*" ../index.html | head -1 | sed 's/\/tags\///')
        if [ "$encoded_name" != "" ]; then
            cp "$dir/index.html" "public/tags/${encoded_name}.html"
            echo "✅ 创建编码文件: ${encoded_name}.html"
        fi
    fi
done

cd ../categories

# 获取所有分类目录
for dir in */; do
    if [ "$dir" != "" ] && [ -d "$dir" ]; then
        # 复制原始文件
        cp "$dir/index.html" "${dir%/}.html"
        
        # 创建编码版本
        encoded_name=$(grep -o "$dir[^\"/]*" ../../index.html | head -1 | sed 's/\/categories\///')
        if [ "$encoded_name" != "" ]; then
            cp "$dir/index.html" "public/categories/${encoded_name}.html"
            echo "✅ 创建编码文件: ${encoded_name}.html"
        fi
    fi
done

echo "✅ 标签和分类URL修复完成"
