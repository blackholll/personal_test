# Read the Docs 语言切换器显示问题

## 🔍 问题

您已经关联了中文文档项目，但是访问英文文档时没有看到语言切换器。

## ✅ 解决方案

Read the Docs 主题**自动**检测翻译子项目并显示语言切换器。如果看不到，可能是以下原因：

### 1. 检查翻译子项目是否正确关联

#### 在 Read the Docs 网站上确认：

1. 登录 Read the Docs
2. 进入您的**主项目（英文）**
3. 点击 "Admin" 或项目设置
4. 在 "Translations" 部分，您应该看到：
   ```
   主项目 (your-project)
   └── 中文 (简体) [zh_CN] ← 应该显示在这里
   ```

如果这里没有中文项目，说明翻译子项目没有正确关联。

#### 如何正确关联：

1. 在 Read the Docs 主项目页面
2. 左侧菜单 → **"Translations"** 或 **"翻译"**
3. 点击 **"Add Translation"**
4. 选择 **"Chinese (Simplified)"** (zh_CN)
5. 确保 "Project Slug" 格式正确（如：`your-project-zh-cn`）
6. 点击 "Add"

### 2. 验证两个项目配置

#### 英文项目配置：

```yaml
# 在 Read the Docs 设置中
Language: English
Config file: sphinx_docs/.readthedocs.yaml
```

#### 中文项目配置：

```yaml
# 在 Read the Docs 设置中（在翻译子项目中）
Language: Chinese (Simplified)
Config file: sphinx_docs/.readthedocs.yaml
```

### 3. 重新构建两个项目

1. 进入**英文项目** → 点击 "Build version: latest"
2. 进入**中文项目** → 点击 "Build version: latest"
3. 等待构建完成

### 4. 检查语言切换器位置

构建完成后，语言切换器应该出现在**页面右上角**，通常在：
- 项目标题旁边
- "Versions" 下拉菜单附近

看起来像这样：
```
🔄 Language: English ▼
```

### 5. 验证 URL 结构

正确配置后，您应该能够访问：

- **英文**: `https://your-project.readthedocs.io/`
- **中文**: `https://your-project.readthedocs.io/zh_CN/`

如果中文 URL 不是以 `/zh_CN/` 结尾，说明翻译子项目配置不正确。

## ⚠️ 常见问题

### Q: 我在 "Translations" 中创建了中文项目，但还是看不到切换器？

A: 检查以下几点：
1. 两个项目都**构建成功**（绿色 ✓）
2. 中文项目的 URL 是 `...readthedocs.io/zh_CN/`
3. 在两个项目的设置中，`Config file` 都是 `sphinx_docs/.readthedocs.yaml`

### Q: 语言切换器在中文页面显示，英文页面不显示？

A: 这通常是正常的。Read the Docs 主题在**当前语言页面**显示切换到其他语言的选项。

例如：
- 在英文页面：显示 "中文 (简体)" 链接
- 在中文页面：显示 "English" 链接

### Q: 如何自定义语言切换器的位置？

A: 如果要完全自定义，可以：

1. 在 `conf.py` 中添加 `html_context`：
```python
html_context = {
    'display_language_selector': True,
    'translations': {
        'en': 'English',
        'zh_CN': '中文 (简体)',
    }
}
```

2. 但这通常不需要，Read the Docs 主题会自动处理。

## 📋 配置检查清单

- [ ] 创建了英文主项目
- [ ] 创建了中文翻译子项目
- [ ] 两个项目都设置了 `sphinx_docs/.readthedocs.yaml` 作为配置文件
- [ ] 英文项目 Language: English
- [ ] 中文项目 Language: Chinese (Simplified)
- [ ] 两个项目构建都成功
- [ ] 能访问 `https://your-project.readthedocs.io/`
- [ ] 能访问 `https://your-project.readthedocs.io/zh_CN/`

## 🎯 快速测试

1. 访问英文版：`https://your-project.readthedocs.io/`
   - 右上角应该有 "Language" 或"语言"选择器
   - 点击应该能看到 "中文 (简体)" 或 "Chinese (Simplified)"

2. 访问中文版：`https://your-project.readthedocs.io/zh_CN/`
   - 右上角应该有 "Language" 或"语言"选择器
   - 点击应该能看到 "English" 或"English"

## 📞 如果还是有问题

1. 查看构建日志，确认没有错误
2. 确认翻译子项目在 "Translations" 列表中
3. 尝试删除并重新创建翻译子项目
4. 检查 Read the Docs 论坛：https://github.com/readthedocs/readthedocs.org

## 💡 提示

Read the Docs 的语言切换器**不需要**额外的配置或代码。只要：
1. 正确创建翻译子项目
2. 两个项目都构建成功
3. URL 正确（`/` 和 `/zh_CN/`）

语言切换器就会自动显示。

