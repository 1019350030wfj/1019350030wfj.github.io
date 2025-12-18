# Jayden 技术博客
## 技术栈
- Hexo
- GitHub Pages
- GitHub Actions
- Butterfly 主题

## 写作方向
- Android 性能优化
- C++ / Native 开发
- 系统架构设计
- 工程化实践

## 部署
Push 到 main 分支自动部署

## 项目结构

```
hexo-tech-blog/
├── .github/
│   └── workflows/
│       └── deploy.yml        # GitHub Actions 自动部署
├── source/
│   ├── _posts/
│   │   ├── android/
│   │   ├── cpp/
│   │   ├── performance/
│   │   ├── architecture/
│   │   └── engineering/
│   ├── about/
│   │   └── index.md
│   └── categories/
│       └── index.md
├── themes/
│   └── butterfly/            # 主题
├── _config.yml               # Hexo 主配置
├── _config.butterfly.yml     # 主题配置
├── package.json
└── README.md
```

## 快速开始

### 1. 环境准备

确保已安装 Node.js 18+ 和 Git。

### 2. 初始化项目

```bash
# 克隆项目
git clone https://github.com/1019350030wfj/1019350030wfj.github.io.git
cd 1019350030wfj.github.io

# 一键初始化
./scripts/setup.sh
```

### 3. 本地开发

```bash
# 方式1：使用 npm 脚本
npm run dev

# 方式2：使用初始化脚本
./scripts/setup.sh
```

访问 http://localhost:4000 查看博客。

### 4. 部署到 GitHub Pages

```bash
# 方式1：使用 npm 脚本
npm run deploy

# 方式2：使用部署脚本
./scripts/deploy.sh

# 方式3：推送到 main 分支（自动部署）
git add .
git commit -m "Update blog content"
git push origin main
```

## 写作指南

### 创建新文章

```bash
# 使用 hexo 命令
npm run new "文章标题"

# 或直接在 source/_posts/ 相应分类下创建 .md 文件
```

### 文章分类

- `source/_posts/android/` - Android 相关技术
- `source/_posts/cpp/` - C++ 开发相关
- `source/_posts/performance/` - 性能优化相关
- `source/_posts/architecture/` - 架构设计相关
- `source/_posts/engineering/` - 工程化实践相关

### 文章模板

每篇文章都应包含：

1. **标准 Front Matter**
2. **背景 & 问题**
3. **结论先行（TL;DR）**
4. **原理分析**
5. **实现方案**
6. **核心代码**
7. **常见坑**
8. **可迁移经验**

## 文章规范

所有文章都遵循以下标准结构：

```md
## 背景 & 问题

## 结论先行（TL;DR）

## 原理分析

## 实现方案

## 核心代码

## 常见坑

## 可迁移经验
```

## 核心原则

- **长期维护**：博客作为技术沉淀，长期维护更新
- **工程化**：标准化的开发和部署流程
- **自动部署**：GitHub Actions 实现自动化
- **技术深度**：每篇文章都是深度原创内容

## 联系方式

- GitHub: [1019350030wfj](https://github.com/1019350030wfj)
- Blog: [https://1019350030wfj.github.io](https://1019350030wfj.github.io)
