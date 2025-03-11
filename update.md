### **完整操作流程：确保本地更改保留、同步上游版本并推送到自己的仓库**

------

### **前提假设**

- ✅ `upstream` 指向上游仓库（`https://github.com/infiniflow/ragflow.git`）。
- ✅ 你的个人仓库（`origin`）尚未添加。
- ✅ 你当前已成功切换到 `tags/v0.17.0` 并带有本地更改。

------

## **✅ 第一步：配置个人仓库，提交当前更改**

### **1. 添加 `origin` 远程仓库（如尚未添加）**

将你的个人仓库地址替换 `<你的个人仓库地址>`：

```bash
git remote add origin <你的个人仓库地址>
```

确认是否添加成功：

```bash
git remote -v
```

------

### **2. 基于 `tags/v0.17.0` 创建一个新分支**

在当前已切换到 `tags/v0.17.0` 的状态下，执行：

```bash
git checkout -b feature-v0.17
```

此时 `feature-v0.17` 将作为你的工作分支，确保你的本地修改已保留。

------

### **3. 提交本地更改到 `feature-v0.17`**

```bash
git add .
git commit -m "初始化：基于 v0.17.0 创建的分支，包含本地更改"
```

------

### **4. 将 `feature-v0.17` 推送到你的个人仓库**

```bash
git push origin feature-v0.17
```

------

## **✅ 第二步：同步上游的新标签并更新本地代码**

当上游发布了新版本（如 `tags/v0.18.0`）时，按照以下步骤操作：

### **1. 获取上游最新的 `tag` 版本**

```bash
git fetch upstream --tags
```

------

### **2. 检查新标签是否存在**

查看最新的标签，确保新版本已拉取成功：

```bash
git tag
```

------

### **3. 创建临时分支并切换到新标签**

为避免污染你的 `feature-v0.17`，使用临时分支切换到新标签：

```bash
git checkout -b temp-merge tags/v0.18.0
```

------

### **4. 切回你的 `feature-v0.17` 分支并合并**

将 `tags/v0.18.0` 的更新合并到你的开发分支：

```bash
git checkout feature-v0.17
git merge temp-merge
```

------

### **5. 解决冲突（如有）**

若出现冲突，按以下步骤处理：

- 使用 `git status` 检查冲突文件：

  ```bash
  git status
  ```

- 手动编辑冲突文件，完成后标记已解决：

  ```bash
  git add .
  ```

- 提交合并：

  ```bash
  git commit -m "合并 upstream/v0.18.0 并解决冲突"
  ```

------

### **6. 清理临时分支**

在合并成功后，删除临时分支：

```bash
git branch -d temp-merge
```

------

## **✅ 第三步：将合并后的代码推送到自己的仓库**

1. 将 `feature-v0.17` 更新后的代码推送到自己的仓库：

   ```bash
   git push origin feature-v0.17
   ```

2. 如果你需要将新标签也推送到自己的仓库：

   ```bash
   git push origin tags/v0.18.0
   ```

------

## **✅ 第四步：后续流程（获取更新时的简化步骤）**

今后每当上游有新版本时，只需执行以下命令：

```bash
git fetch upstream --tags
git checkout -b temp-merge tags/新版本号
git checkout feature-v0.17
git merge temp-merge
git branch -d temp-merge
git push origin feature-v0.17
```

------

## **✅ 最终效果**

- **`upstream`** → 获取上游更新的 `tag`。
- **`feature-v0.17`** → 你的本地分支，始终保留你的更改。
- **`origin`** → 推送到你的个人仓库，保持同步。

### **示意流程图**

```
                 upstream/tags/v0.17.0 ───→ feature-v0.17 ───→ origin/feature-v0.17
                                           ↑
                  upstream/tags/v0.18.0 ───┘
```

这种方法确保你既能及时获取上游更新，又能保留自己的更改，并推送到个人仓库，流程简洁且安全。