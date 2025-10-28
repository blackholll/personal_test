# 中文搜索问题修复指南

## 🔍 问题描述

在 Read the Docs 上访问中文文档时，搜索功能无法正常工作（显示 "No results" 或返回空结果）。

## ✅ 已应用的修复

### 1. 更新了 `conf.py`

添加了中文搜索配置：

```python
# -- Search language ----------------------------------------------------------

# Configure search language based on the current language setting
if language == 'zh_CN':
    html_search_language = 'zh'
    html_search_options = {'type': 'default', 'dict': 'jieba'}
elif language == 'en':
    html_search_language = 'en'
else:
    html_search_language = 'en'
```

### 2. 添加了 jieba 依赖

在 `requirements.txt` 中添加了：
```
jieba>=0.42.1
```

## 📋 接下来需要做的

### 步骤 1：提交并推送更改

```bash
git add sphinx_docs/conf.py
git add sphinx_docs/requirements.txt
git commit -m "Fix Chinese search support"
git push
```

### 步骤 2：在 Read the Docs 上重新构建

1. 登录 Read the Docs
2. 进入**中文翻译子项目**（zh_CN）
3. 点击 **"Build version: latest"**
4. 等待构建完成

### 步骤 3：验证搜索功能

1. 访问中文文档：`https://your-project.readthedocs.io/zh_CN/`
2. 在搜索框输入中文关键词
3. 测试是否返回搜索结果

## ⚠️ 如果搜索还是不工作

### 检查清单：

1. **确认 jieba 已安装**
   - 在 Read the Docs 构建日志中搜索 "jieba"
   - 应该看到 "Successfully installed jieba-..."

2. **确认中文项目正确配置了语言**
   - 在 Read the Docs 中文项目设置中
   - Language 应该是 "Chinese (Simplified)"
   
3. **检查构建日志**
   - 查看是否有 jieba 相关的错误
   - 查看是否有搜索相关的警告

### 替代方案：使用 JavaScript 搜索

如果 jieba 不可用，可以尝试：

1. 在 `conf.py` 中添加：
```python
if language == 'zh_CN':
    # 使用 JavaScript 纯文本搜索（较简单但功能受限）
    html_search_language = None
```

2. 重新构建

## 🛠️ 测试方法

### 本地测试中文搜索：

```bash
cd sphinx_docs

# 构建中文版本
make build-zh

# 启动本地服务器
cd _build/html/zh_CN
python -m http.server 8000

# 访问 http://localhost:8000
# 测试搜索功能
```

## 📚 更多信息

- [Sphinx 搜索文档](https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-html_search_language)
- [jieba 分词](https://github.com/fxsjy/jieba)
- [Read the Docs 构建日志](https://docs.readthedocs.io/en/stable/guides/build-troubleshooting.html)

## 💡 提示

**关键点**：
- ✅ `html_search_language = 'zh'` 已设置
- ✅ jieba 已添加到 requirements.txt
- ✅ 配置会在构建时根据 `language` 变量自动选择
- ⚠️ 需要重新构建中文项目才能生效

## 🔄 常见问题

### Q: 搜索框能看到，但输入什么都没结果？

A: 确认：
1. jieba 已安装（查看构建日志）
2. 中文项目的 language 设置为 zh_CN
3. 已经重新构建

### Q: 构建日志显示 jieba 安装失败？

A: 尝试使用更新版本：
```txt
jieba>=0.42.1
```

或使用：
```txt
jieba>=0.42.1,<1.0
```

### Q: 英文搜索正常，中文不行？

A: 这是预期的，因为：
- 英文使用默认搜索
- 中文需要 jieba 分词

确保中文项目中正确安装了 jieba。

