#!/bin/bash 

# === USAGE === 
# ./cherry_pick_by_author.sh <source-branch> <committer> <after-date> 

SOURCE_BRANCH="$1" 
COMMITTER="$2" 
AFTER_DATE="$3" 
PICKED_COMMITS_FILE=".picked_commits.tmp" 

if [ -z "$SOURCE_BRANCH" ] || [ -z "$COMMITTER" ] || [ -z "$AFTER_DATE" ]; then
   echo "❌ Usage: $0 <source-branch> <committer> <after-date>"
   exit 1 
fi 

echo "🔍 Cherry-picking commits by '$COMMITTER' after '$AFTER_DATE' from '$SOURCE_BRANCH'..." 
# Create or reuse the temp file to track picked commits 
touch "$PICKED_COMMITS_FILE" 

for commit in $(git log "$SOURCE_BRANCH" --after="$AFTER_DATE" --author="$COMMITTER" --pretty=format:"%H" --reverse); do
   if grep -q "$commit" "$PICKED_COMMITS_FILE"; then
     echo "⏭ Skipping already picked commit: $commit"
     continue
   fi

   message=$(git log -1 --format="%s" "$commit")
   echo "🔧 Cherry-picking commit: $commit - $message"

   git cherry-pick "$commit"
   if [ $? -ne 0 ]; then
     echo "⚠ Conflict occurred. Resolve it and run './cherry_pick_by_author.sh $SOURCE_BRANCH $COMMITTER $AFTER_DATE'."
     echo "ℹ Re-run this script to continue from where it left off."
     echo "$commit" >> "$PICKED_COMMITS_FILE"
     echo "ℹ Conflicted commit also taken in track assuming you will resolve the commit and continue."
     exit 1
   fi   
echo "$commit" >> "$PICKED_COMMITS_FILE" done echo "✅ All applicable commits have been cherry-picked." 
rm -f "$PICKED_COMMITS_FILE"  
