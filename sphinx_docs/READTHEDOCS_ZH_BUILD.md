# Read the Docs 构建中文文档 - 完整解决方案

## 🎯 核心问题

**Read the Docs 不会自动为所有语言构建多个版本。您需要为中文创建翻译子项目。**

## ✅ 解决方案（3 步）

### 步骤 1：在 Read the Docs 网站上创建中文翻译子项目

1. 登录 [Read the Docs](https://readthedocs.org/)
2. 进入您的英文项目页面
3. 点击项目名称旁的**设置图标**（⚙️）
4. 在左侧菜单中点击 **"Translations"** 或 **"翻译"**
5. 点击 **"Add Translation"** 或 **"添加翻译"** 按钮
6. 选择 **"Chinese (Simplified)"** (zh_CN)
7. 点击 **"Add"**

### 步骤 2：配置中文子项目

1. 点击刚创建的中文项目
2. 进入 **"Settings"** → **"Advanced Settings"**
3. 确认设置：
   - **Config file**: `sphinx_docs/.readthedocs.yaml`
   - **Language**: Chinese (Simplified) - 这个会自动设置
4. 保存

### 步骤 3：等待构建

Read the Docs 会自动为中文项目单独构建。

## 📍 访问地址

构建完成后：

- **英文版**: `https://your-project.readthedocs.io/`
- **中文版**: `https://your-project.readthedocs.io/zh_CN/`

或者从项目页面点击语言切换器。

## ⚠️ 重要说明

### 为什么需要创建翻译子项目？

Read the Docs 的架构是：
- **主项目**：默认构建为英文（基于 `conf.py` 中的 `language` 设置）
- **翻译子项目**：为每种语言创建独立的构建项目，并自动设置 `-D language=zh_CN`

### 不需要修改配置文件

您的配置已经正确：
- `.readthedocs.yaml` 配置正确
- `locale/zh_CN/LC_MESSAGES/*.po` 文件已存在
- `conf.py` 中已配置 `locale_dirs = ['locale/']`

只需要在 Read the Docs 网站上创建翻译子项目即可。

## 🔍 验证设置

创建翻译子项目后，您应该看到：

1. **在项目页面**：
   ```
   主项目 (英文)
   └── 中文 (简体) [zh_CN]
   ```

2. **构建状态**：
   - 主项目构建：英文版
   - 中文项目构建：中文版（URL 显示为 `.../zh_CN/`）

3. **语言切换**：
   - 两个版本都会有语言切换器
   - 点击可以在英文和中文间切换

## 📊 构建流程说明

### 主项目构建（英文）
```
Read the Docs 自动执行：
cd sphinx_docs
sphinx-build -b html . _build/html
```
使用 `conf.py` 中 `language = 'en'` 的设置

### 翻译子项目构建（中文）
```
Read the Docs 自动执行：
cd sphinx_docs
sphinx-build -b html -D language=zh_CN . _build/html
```
Read the Docs 会自动添加 `-D language=zh_CN` 参数

## 🛠️ 如果还没有翻译内容

如果您看到中文版还是显示英文，需要先编译翻译文件。

在本地运行：
```bash
cd sphinx_docs
make gettext        # 生成翻译模板
make update-translations  # 更新翻译文件
# 编辑 locale/zh_CN/LC_MESSAGES/*.po 文件，添加中文翻译
sphinx-intl build    # 编译翻译文件（生成 .mo）
git add locale/
git commit -m "Add Chinese translations"
git push
```

Read the Docs 会自动重新构建两个版本。

## 📝 总结

**关键点**：
1. ✅ 配置文件已正确
2. ✅ 翻译文件已存在
3. ⚠️ 需要在 Read the Docs 网站上创建翻译子项目
4. ⚠️ 如果需要完整翻译，要编辑 `.po` 文件

**只需要做一件事**：在 Read the Docs 网站为中文创建翻译子项目。

