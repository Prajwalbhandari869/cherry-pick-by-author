# cherry-pick-by-author
# 🧰 Cherry-Pick by Author

A lightweight Bash script to cherry-pick commits authored by a specific person after a given date from a specified Git branch — with safe conflict handling and resumable execution.

---

## 🚀 Features

- ✅ Cherry-pick commits from any branch
- 👤 Filters by **author/committer**
- 📅 Filters commits **after a specific date**
- 🔁 Automatically skips already picked commits (supports re-running)
- ⚠️ Handles conflicts gracefully and resumes from where it left off

---

## 📦 Usage

```bash
./cherry_pick_by_author.sh <source-branch> <committer-name> <after-date>

