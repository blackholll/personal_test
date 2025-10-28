# Read the Docs 快速配置指南

## ⚡ 关键步骤

在 Read the Docs 上配置项目时，最重要的一步是正确设置配置文件的路径。

### 1. 登录 Read the Docs

访问 [Read the Docs](https://readthedocs.org/) 并使用 GitHub/GitLab 账号登录。

### 2. 导入项目

1. 点击 "Import a Project"
2. 选择您的仓库
3. 点击 "Next"

### 3. ⚠️ 关键配置

在项目设置中，找到 "Config file" 字段（在 Advanced Settings 部分），并填写：

```
sphinx_docs/.readthedocs.yaml
```

这个路径告诉 Read the Docs 到哪里去找配置文件。

### 4. 其他设置

- **Default Branch**: `main` 或 `master`
- **Documentation Type**: `Sphinx HTML`

### 5. 保存并构建

保存设置后，Read the Docs 会自动触发构建。构建完成后，您可以通过以下 URL 访问文档：

- 英文版：`https://yourproject.readthedocs.io/`
- 中文版：`https://yourproject.readthedocs.io/zh_CN/`

## 🔍 故障排除

### 问题：构建失败，提示找不到 requirements.txt

**解决方案**：检查 "Config file" 字段是否填写为 `sphinx_docs/.readthedocs.yaml`

### 问题：构建失败，提示找不到 conf.py

**解决方案**：确保 `sphinx_docs/.readthedocs.yaml` 文件中的配置是正确的：
```yaml
sphinx:
   configuration: conf.py
```

## 📋 当前配置

您的 `.readthedocs.yaml` 文件位于 `sphinx_docs/.readthedocs.yaml`，内容如下：

```yaml
version: 2

build:
  os: ubuntu-24.04
  tools:
    python: "3.13"

sphinx:
   configuration: conf.py

formats:
  - htmlzip
  - pdf

python:
   install:
   - requirements: requirements.txt
```

注意：所有路径都是相对于 `sphinx_docs/` 目录的。

## ✅ 验证

构建成功后，您应该看到：
- 文档可以正常访问
- 英文版和中文版都可以访问
- 侧边栏有语言切换器

## 📚 更多信息

- 完整部署指南：`SETUP_README.md`
- 项目说明：`README.md`
- 项目总结：`PROJECT_SUMMARY.md`

