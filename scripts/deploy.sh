#!/bin/bash
# Hexo 技术博客部署脚本
echo "🚀 部署 Hexo 技术博客到 GitHub Pages..."

# 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
    echo "❌ 检测到未提交的更改，请先提交所有更改"
    echo "💡 建议运行："
    echo "   git add ."
    echo "   git commit -m \"Update blog content\""
    echo "   git push origin main"
    exit 1
fi

# 清理并生成
echo "🧹 清理缓存..."
npm run clean

echo "🏗️  生成静态文件..."
npm run build

echo "🚀 部署到 GitHub Pages..."
npm run deploy

echo "✅ 部署完成！"
echo "🌐 访问地址：https://1019350030wfj.github.io"
