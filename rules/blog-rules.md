# Hexo 技术博客模板（工程师版）

> 目标：**长期维护 / 工程化 / 自动部署 / 技术沉淀**
> 适用人群：Android / C++ / 架构方向开发者

---

## 一、整体架构

```text
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
│   └── butterfly/            # 示例主题（可替换）
├── _config.yml               # Hexo 主配置
├── _config.butterfly.yml     # 主题配置
├── package.json
└── README.md
```

---

## 二、分支 & 部署策略（推荐）

| 分支       | 用途                    |
| -------- | --------------------- |
| main     | Hexo 源码（文章 / 配置 / 主题） |
| gh-pages | 自动生成的静态站点             |

部署方式：**GitHub Actions 自动构建 + 发布**

---

## 三、GitHub Actions 工作流

**路径：** `.github/workflows/deploy.yml`

```yaml
name: Deploy Hexo Tech Blog

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 18

      - name: Install dependencies
        run: npm install

      - name: Build
        run: |
          npx hexo clean
          npx hexo generate

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

---

## 四、Hexo 主配置（精简工程版）

**_config.yml**

```yaml
# Site
url: https://用户名.github.io
root: /
title: 技术博客
subtitle: Android · C++ · 架构
language: zh-CN

# Writing
post_asset_folder: true
highlight:
  enable: false

# Theme
theme: butterfly

# Pagination
per_page: 10
```

---

## 五、文章目录规划（强约束）

```text
_posts/
├── android/
│   ├── 启动优化全流程.md
│   ├── RecyclerView 性能优化.md
│   └── JNI 调用链分析.md
├── cpp/
│   ├── FFmpeg 内存管理.md
│   └── C++ 跨平台编译实践.md
├── performance/
│   ├── gfxinfo 指标解析.md
│   └── 卡顿排查方法论.md
├── architecture/
│   ├── 视频编辑器架构设计.md
│   └── 模块化拆分实践.md
└── engineering/
    ├── Git 分支管理规范.md
    └── CI/CD 实践.md
```

---

## 六、统一 Front Matter 模板（必须遵守）

```md
---
title: Android 启动优化完整拆解
date: 2025-01-10
categories:
  - Android
  - 性能优化
tags:
  - 冷启动
  - AMS
  - 性能分析
---
```

---

## 七、技术文章标准结构（强烈建议）

```md
## 背景 & 问题

## 结论先行（TL;DR）

## 原理分析

## 实现方案

## 核心代码

## 常见坑

## 可迁移经验
```

---

## 八、必装插件清单

```bash
npm install hexo-prism-plugin hexo-asset-image hexo-generator-sitemap --save
```

```yaml
prism_plugin:
  mode: preprocess
```

---

## 九、推荐写作节奏

* 每月 2 篇 **深度文章**
* 系列化输出
* 每篇都是“可被搜索 / 可被引用”的内容

---

## 十、README 模板（项目说明）

```md
# Hexo 技术博客

## 技术栈
- Hexo
- GitHub Pages
- GitHub Actions

## 写作方向
- Android 性能
- C++ / Native
- 架构设计

## 部署
Push 到 main 分支自动部署
```

---

## 十一、你可以在此模板基础上直接做的事

* Fork 仓库
* 修改 url / title
* 选择主题
* 开始写第一篇技术文章

> 这是一个**工程师长期可用的博客骨架**，不是一次性 Demo
