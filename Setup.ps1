# Run once after cloning to enable the repository's git hooks
git config core.hooksPath .githooks
Write-Host "Git hooks configured. Pre-commit hook is now active."
