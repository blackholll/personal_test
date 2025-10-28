# Read the Docs 多语言文档设置指南

本指南将帮助您在 Read the Docs 上设置一个支持多语言的 Sphinx 文档网站。

## 步骤 1：推送代码到 Git 仓库

确保您的代码已经推送到 GitHub、GitLab 或其他 Git 托管平台。

```bash
git add sphinx_docs/
git commit -m "Add Sphinx multi-language documentation"
git push
```

## 步骤 2：在 Read the Docs 上创建项目

1. 访问 [Read the Docs](https://readthedocs.org/)
2. 使用 GitHub/GitLab 账号登录
3. 点击 "Import a Project"
4. 选择您的项目
5. 点击 "Next"

## 步骤 3：配置项目设置

### 基本设置

在项目设置页面，配置以下内容：

- **Name**: 您的项目名称
- **Repository URL**: 自动填充
- **Default Branch**: main 或 master
- **Default Version**: latest
- **Python configuration file**: `sphinx_docs/.readthedocs.yaml` ⚠️ **重要：必须指定这个路径**
- **Requirements file**: 留空（由 .readthedocs.yaml 配置自动处理）
- **Documentation type**: Sphinx HTML

### 重要说明

`.readthedocs.yaml` 文件放在 `sphinx_docs` 目录下。在 Read the Docs 的 "Config file" 字段中，您需要明确指定路径为：**`sphinx_docs/.readthedocs.yaml`**

如果留空，Read the Docs 会在根目录查找 `.readthedocs.yaml`，导致找不到配置文件。

### 高级设置（多语言）

1. 在 "Languages" 部分，添加语言：
   - English (默认)
   - Chinese (Simplified) - zh_CN

2. 在 "Features" 中启用：
   - "Build pull requests"
   - "Suggest taxonomies"

## 步骤 4：创建中文子项目

1. 在 Read the Docs 项目页面，点击 "Admin" 标签
2. 滚动到 "Translations" 部分
3. 点击 "Add translation"
4. 选择 "Chinese (Simplified)"
5. 在新创建的子项目中：
   - 在 "Advanced Settings" > "Language" 中选择 "Chinese (Simplified)"
   - 在 "Config File" 中指定 `sphinx_docs/.readthedocs.yaml`

## 步骤 5：触发构建

1. 返回到主项目页面
2. 点击 "Build version: latest" 触发构建
3. 等待构建完成

## 步骤 6：访问文档

- 英文版本：`https://yourproject.readthedocs.io/`
- 中文版本：`https://yourproject.readthedocs.io/zh_CN/`

## 本地测试

在推送到 Read the Docs 之前，您可以在本地测试构建：

```bash
cd sphinx_docs

# 安装依赖
pip install -r requirements.txt

# 构建英文文档
make html

# 构建中文文档
make build-zh

# 查看英文文档
# 在浏览器中打开 _build/html/index.html

# 查看中文文档
# 在浏览器中打开 _build/html/zh_CN/index.html
```

## 更新翻译

当您更新文档内容后，需要更新翻译：

1. 生成翻译模板：
   ```bash
   make gettext
   ```

2. 更新中文翻译文件：
   ```bash
   make update-translations
   ```

3. 编辑 `locale/zh_CN/LC_MESSAGES/*.po` 文件，添加翻译

4. 编译翻译：
   ```bash
   sphinx-intl build
   ```

5. 推送更改到仓库，Read the Docs 会自动重新构建

## 常见问题

### Q: 构建失败怎么办？

A: 检查以下几点：
- 确保 `.readthedocs.yaml` 配置正确
- 确保 `requirements.txt` 存在且包含所有依赖
- 检查构建日志中的错误信息

### Q: 如何添加新语言？

A: 
1. 创建新的语言目录（如 `locale/fr/LC_MESSAGES/`）
2. 运行 `sphinx-intl update -p _build/gettext -l fr`
3. 在 Read the Docs 中添加新的翻译子项目

### Q: 如何添加新的文档页面？

A:
1. 创建新的 `.rst` 文件
2. 在 `index.rst` 的 toctree 中添加引用
3. 如果需要翻译，运行 `sphinx-intl update` 并编辑 `.po` 文件

## 参考资料

- [Sphinx 国际化文档](https://www.sphinx-doc.org/en/master/usage/advanced/intl.html)
- [Read the Docs 多语言文档](https://docs.readthedocs.io/en/stable/localization.html)
- [reStructuredText 语法](https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html)

