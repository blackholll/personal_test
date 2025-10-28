# Sphinx 多语言文档项目

这是一个支持多语言的 Sphinx 文档项目，默认语言为英语，同时支持简体中文。

## 🚀 快速开始

### 1. 在本地安装依赖

```bash
cd sphinx_docs
pip install -r requirements.txt
```

### 2. 构建文档

```bash
# 构建英文文档
make html

# 构建中文文档
make build-zh

# 查看构建结果
# 英文: open _build/html/index.html
# 中文: open _build/html/zh_CN/index.html
```

### 3. 部署到 Read the Docs

详见 `SETUP_README.md` 文件，包含完整的部署指南。

## 目录结构

```
sphinx_docs/
├── .readthedocs.yaml          # Read the Docs 配置文件
├── conf.py                     # Sphinx 主配置文件
├── requirements.txt            # Python 依赖
├── index.rst                   # 主索引文件
├── getting_started.rst        # 快速入门
├── user_guide.rst             # 用户指南
├── api_reference.rst          # API 参考
├── locale/                     # 翻译文件目录
│   └── zh_CN/                 # 简体中文
│       └── LC_MESSAGES/
├── _static/                    # 静态文件
└── _templates/                 # 模板文件
```

## 本地构建

### 安装依赖

```bash
pip install -r requirements.txt
```

### 构建文档（英语）

```bash
cd sphinx_docs
sphinx-build -b html . _build/html
```

### 生成翻译模板

```bash
sphinx-build -b gettext . _build/gettext
```

### 更新翻译

```bash
sphinx-intl update -p _build/gettext -l zh_CN
```

### 构建中文文档

```bash
sphinx-build -b html -D language=zh_CN . _build/html/zh_CN
```

## Read the Docs 配置

### 在 Read the Docs 上设置多语言支持

1. 登录到 Read the Docs
2. 导入你的项目
3. 在项目设置中，转到 "Admin" > "Translations"
4. 添加中文（简体）翻译子项目
5. 在子项目中，在 "Advanced Settings" > "Language" 选择 "Chinese (Simplified)"

### 更新 .readthedocs.yaml

已经配置了基本的多语言支持设置。

## 添加新内容

### 添加新的 .rst 文件

1. 在根目录创建新的 .rst 文件
2. 在 `index.rst` 的 toctree 中添加引用
3. 如果需要翻译，运行 `sphinx-intl update` 并编辑 `.po` 文件

### 添加翻译

1. 生成翻译模板：
   ```bash
   sphinx-build -b gettext . _build/gettext
   ```

2. 更新翻译文件：
   ```bash
   sphinx-intl update -p _build/gettext -l zh_CN
   ```

3. 编辑 `locale/zh_CN/LC_MESSAGES/` 目录中的 .po 文件

4. 编译翻译文件：
   ```bash
   sphinx-intl build
   ```

5. 构建文档（如上述构建中文文档步骤）

## 开发建议

- 使用 `.rst` 文件编写文档
- 使用 reStructuredText 标记语法
- 遵循 Sphinx 最佳实践
- 定期更新翻译以确保中英文内容同步

## 参考资料

- [Sphinx 文档](https://www.sphinx-doc.org/)
- [Read the Docs 文档](https://docs.readthedocs.io/)
- [sphinx-intl 文档](https://sphinx-intl.readthedocs.io/)
- [reStructuredText 语法](https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html)

