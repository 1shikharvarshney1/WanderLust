#!/bin/sh
# Rewrite author/committer info for past commits
OLD_EMAIL1="111690724+resmit-dholariya@users.noreply.github.com"
OLD_EMAIL2="resmit.dholariya.prsnl@gmail.com"
CORRECT_NAME="Shikhar Varshney"
CORRECT_EMAIL="1shikharvarshney1@users.noreply.github.com"

git filter-branch --env-filter '
if [ "$GIT_COMMITTER_EMAIL" = "'"$OLD_EMAIL1"'" ] || [ "$GIT_COMMITTER_EMAIL" = "'"$OLD_EMAIL2"'" ]; then
    export GIT_COMMITTER_NAME="'"$CORRECT_NAME"'"
    export GIT_COMMITTER_EMAIL="'"$CORRECT_EMAIL"'"
fi
if [ "$GIT_AUTHOR_EMAIL" = "'"$OLD_EMAIL1"'" ] || [ "$GIT_AUTHOR_EMAIL" = "'"$OLD_EMAIL2"'" ]; then
    export GIT_AUTHOR_NAME="'"$CORRECT_NAME"'"
    export GIT_AUTHOR_EMAIL="'"$CORRECT_EMAIL"'"
fi
' --tag-name-filter cat -- --branches --tags

echo "Rewrite complete"
