# 🧰 Cherry-Pick by Author

A robust and user-friendly Bash script to cherry-pick Git commits by a specific **author/committer**, filtered by **date** and **source branch**. Ideal for syncing selective changes between branches, especially in collaborative or monorepo environments.

---

## 📌 Overview

In large teams or long-lived branches, you may want to selectively bring in only the commits made by a specific person after a certain point in time — without manually identifying and cherry-picking them one by one.

This script:
- Automates the cherry-pick process.
- Ensures commits are applied **in chronological order**.
- Handles **conflicts safely**.
- Supports **resumability** — you can re-run the script after fixing conflicts and it will **continue from where it left off**.

---

## ✨ Features

✅ Cherry-picks commits from a given source branch  
👤 Filters commits by **author/committer name**  
📅 Supports `--after` date filtering  
🔄 Resumable: skips already-picked commits across runs  
⚠️ Handles conflicts gracefully and guides you on how to resolve and resume  
📝 Tracks picked commits in a `.picked_commits.tmp` file (auto-cleaned on success)

---

## 📦 Usage

```bash
./cherry_pick_by_author.sh <source-branch> <committer-name> <after-date>
