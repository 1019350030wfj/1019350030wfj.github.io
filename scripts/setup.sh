#!/bin/bash
# Hexo 技术博客初始化脚本
echo "🚀 初始化 Hexo 技术博客..."

# 检查 Node.js 是否安装
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装，请先安装 Node.js 18+"
    exit 1
fi

# 检查 Node.js 版本
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js 版本过低，需要 18+，当前版本：$(node -v)"
    exit 1
fi

# 清理并重新安装依赖
echo "🧹 清理旧的依赖..."
rm -rf node_modules package-lock.json

echo "📦 安装依赖..."
npm install

# 安装主题（如果还没有安装）
if [ ! -d "themes/butterfly" ]; then
    echo "🦋 安装 Butterfly 主题..."
    git clone https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly
fi

# 清理并生成
echo "🧹 清理缓存..."
npm run clean

echo "🏗️  生成静态文件..."
npm run build

# 检查是否可以启动本地服务器
if command -v npx &> /dev/null; then
    echo "🌐 启动本地服务器..."
    echo "访问地址：http://localhost:4000"
    echo "按 Ctrl+C 停止服务器"
    npx hexo server
else
    echo "✅ 初始化完成！"
    echo "请手动运行：npx hexo server"
fi
