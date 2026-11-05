
#!/bin/bash
set -e

echo "Starting Frequency Analyzer..."

# Run the Python frequency analyzer
FREQ_RESULT=$(python3 /app/.github/scripts/frequency.py /workspace/data.txt)

echo "Vowel frequency results: $FREQ_RESULT"

# Run the README updater
cd /workspace
bash /app/.github/scripts/update_readme.sh "$FREQ_RESULT" "$GITHUB_USER"

echo "Process Completed!"
