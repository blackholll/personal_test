# Read the Docs 多语言文档设置指南

## 📌 关键步骤

要在 Read the Docs 上同时显示英文和中文文档，您需要在 Read the Docs 上**创建翻译子项目**。

## 🔧 完整设置步骤

### 步骤 1：创建主项目（英文）

1. 登录 [Read the Docs](https://readthedocs.org/)
2. 点击 "Import a Project"
3. 选择您的仓库
4. 配置项目：
   - **Name**: `your-project` （这是英文版）
   - **Default Language**: English
   - **Config file**: `sphinx_docs/.readthedocs.yaml`
5. 保存并等待构建完成

### 步骤 2：创建翻译子项目（中文）

在 Read the Docs 上启用多语言的正确方法是创建**翻译子项目**：

1. 进入您的英文项目页面
2. 点击项目名称旁的设置图标（齿轮图标）
3. 在左侧菜单中点击 **"Translations"**
4. 点击 **"Add Translation"** 按钮
5. 选择 **"Chinese (Simplified)"** (zh_CN)
6. 点击 **"Add"**

### 步骤 3：配置翻译子项目

1. 点击刚创建的中文子项目
2. 进入 "Settings" → "Advanced Settings"
3. 确认以下设置：
   - **Language**: Chinese (Simplified)
   - **Config file**: `sphinx_docs/.readthedocs.yaml`
   - **Default Branch**: main 或 master
4. 保存设置

### 步骤 4：修改配置文件以支持中文

创建一个中文版本的配置文件，或者修改构建命令。

**方法 1：在 Read the Docs 设置中添加环境变量**

在中文子项目的设置中：

1. 进入 "Settings" → "Build"
2. 添加环境变量：
   - 名称: `READTHEDOCS_LANGUAGE`
   - 值: `zh_CN`

**方法 2：使用构建命令**

但 Read the Docs v2 不需要这个，子项目会自动处理语言。

## 📁 文件结构

您的文档目录结构应该如下：

```
sphinx_docs/
├── .readthedocs.yaml        # 配置文件
├── conf.py                  # Sphinx 配置
├── requirements.txt         # 依赖
├── locale/
│   └── zh_CN/              # 中文翻译
│       └── LC_MESSAGES/
│           ├── *.po        # 翻译源文件
│           └── *.mo        # 编译后的翻译
├── index.rst               # 主索引
└── ...                     # 其他 .rst 文件
```

## 🌍 完成后的访问 URL

- **英文版**: `https://your-project.readthedocs.io/`
- **中文版**: `https://your-project.readthedocs.io/zh_CN/`

语言切换器会自动显示在页面上。

## ⚠️ 常见问题

### 问题 1：只有英文文档，没有中文

**原因**: 没有创建翻译子项目

**解决方案**: 按照上面的"步骤 2"创建中文翻译子项目

### 问题 2：翻译子项目构建失败

**检查清单**:
- [ ] 确认 `locale/zh_CN/LC_MESSAGES/*.mo` 文件存在
- [ ] 确认 `.po` 文件已经翻译完成
- [ ] 检查构建日志中的错误信息

### 问题 3：中文内容还是英文

**原因**: `.po` 翻译文件未完成或未编译

**解决方案**:
```bash
cd sphinx_docs

# 生成翻译模板
make gettext

# 更新中文翻译
make update-translations

# 编辑 .po 文件，添加翻译
# vi locale/zh_CN/LC_MESSAGES/*.po

# 编译翻译（生成 .mo 文件）
sphinx-intl build

# 本地测试中文构建
make build-zh
```

## 🎯 验证多语言支持

1. 在 Read the Docs 项目页面，您应该看到：
   ```
   main repository
   └── 中文 (简体) [zh_CN]
   ```

2. 访问文档后，右上角应该有语言切换器

3. 点击语言切换器，应该能在英文和中文之间切换

## 📝 更新翻译

当您更新文档内容后：

1. 生成新的翻译模板：
   ```bash
   make gettext
   make update-translations
   ```

2. 更新 `locale/zh_CN/LC_MESSAGES/*.po` 文件

3. 提交并推送：
   ```bash
   git add locale/
   git commit -m "Update Chinese translations"
   git push
   ```

4. Read the Docs 会自动重新构建两个版本

## ✅ 配置检查清单

在完成设置后，确认以下内容：

- [ ] 英文项目构建成功
- [ ] 创建了中文翻译子项目
- [ ] 中文项目构建成功
- [ ] 两个版本的文档都可以访问
- [ ] 页面右上角有语言切换器
- [ ] 点击切换器可以切换语言

## 🔗 参考资源

- [Read the Docs 多语言文档](https://docs.readthedocs.io/en/stable/localization.html)
- [Sphinx 国际化](https://www.sphinx-doc.org/en/master/usage/advanced/intl.html)
- [创建翻译子项目](https://docs.readthedocs.io/en/stable/guides/reproducible-builds.html)

