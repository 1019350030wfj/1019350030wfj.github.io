---
title: Hello World - 我的技术博客之旅
date: 2016-12-14
categories:
  - Engineering
  - 博客建设
tags:
  - Hexo
  - GitHub Pages
  - 静态博客
  - 开源
---
## 背景 & 问题

2016年，我决定开始搭建自己的技术博客。当时的目标很明确：
- 记录技术学习历程
- 分享开发经验
- 与更多开发者交流
- 建立个人技术品牌

经过调研，我选择了 GitHub Pages + Hexo 的方案，这是一个开源、免费、功能强大的静态博客解决方案。

## 结论先行（TL;DR）

经过多年的发展，这个博客已经从简单的技术记录，演变成了一个完整的技术内容管理系统。现在按照新的模板重构，使其更符合工程化、标准化的要求。

## 原理分析

### 技术选型分析

选择 GitHub Pages + Hexo 的原因：

1. **零成本**：完全免费，无需服务器
2. **高可用**：GitHub 提供稳定的CDN服务
3. **版本控制**：文章和配置都可以版本控制
4. **自动部署**：通过 GitHub Actions 实现自动化
5. **高度定制**：丰富的主题和插件生态

### 架构设计

```
开发流程：Markdown -> Hexo -> HTML -> GitHub Pages
部署流程：Git Push -> Actions -> Build -> Deploy
```

## 实现方案

### 重构方案

按照新的模板要求，博客重构包含以下几个方面：

1. **目录结构标准化**
2. **配置文件规范化**
3. **CI/CD 自动化**
4. **文章模板统一化**

### 技术升级

- Hexo 版本升级到最新稳定版
- 主题切换到 Butterfly
- 添加更多实用插件
- 完善自动化部署流程

## 核心代码

#### 新的配置文件

```yaml
# _config.yml
theme: butterfly
url: https://1019350030wfj.github.io
post_asset_folder: true
```

#### GitHub Actions 工作流

```yaml
name: Deploy Hexo Tech Blog
on:
  push:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 18
      - run: npm install
      - run: npx hexo clean && npx hexo generate
      - uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

## 常见坑

### 1. 部署失败

**问题**：GitHub Actions 部署时出现权限错误。

**解决方案**：
- 确保 `github_token` 正确配置
- 检查分支权限设置
- 验证 Actions 工作流语法

### 2. 主题渲染异常

**问题**：切换主题后页面显示异常。

**解决方案**：
- 清理缓存：`hexo clean`
- 重新安装依赖：`npm install`
- 检查主题兼容性

### 3. 图片路径错误

**问题**：文章中图片无法正常显示。

**解决方案**：
- 开启 `post_asset_folder: true`
- 将图片放在同名文件夹下
- 使用相对路径引用

## 可迁移经验

1. **版本控制的重要性**：所有内容都纳入版本控制，便于追踪和回滚
2. **自动化思维**：尽可能自动化重复性工作
3. **文档先行**：完善的项目文档能减少很多沟通成本
4. **渐进式改进**：重构不需要一步到位，可以逐步改进

## 未来规划

1. **内容规划**：每月2篇深度技术文章
2. **技术方向**：重点在 Android 性能优化和 C++ 开发
3. **生态建设**：建立技术交流群，组织技术分享
4. **工具链完善**：集成更多开发工具

## 总结

从 2016 年的 Hello World 开始，这个技术博客见证了我的技术成长历程。现在的重构，让博客更加工程化、标准化，为未来的技术沉淀奠定了坚实的基础。

> 技术之路，永无止境。愿与各位同行者一起，在技术的道路上不断前行。
