
#!/bin/bash
set -e

# Inputs
FREQ_RESULT="$1"
GITHUB_USER="$2"
TIMESTAMP=$(date)

# Update README
echo "" >> README.md
echo "### Vowel Frequency Analysis" >> README.md
echo "Contributor: $GITHUB_USER" >> README.md
echo "Timestamp: $TIMESTAMP" >> README.md
echo "Results: $FREQ_RESULT" >> README.md

# Configure Git
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

# Add README and commit changes
git add README.md

if ! git diff --cached --quiet; then
    git commit -m "Update README with vowel frequency results"
    git push origin HEAD:main
else
    echo "No changes to commit"
fi
