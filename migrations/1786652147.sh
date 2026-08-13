echo "Remove AI agent shims from ~/.local/bin"
rm ~/.local/bin/codex
rm ~/.local/bin/copilot
rm ~/.local/bin/gemini
rm ~/.local/bin/opencode
rm ~/.local/bin/pi
rm ~/.local/bin/playwright-cli

echo "Remove AI agent omarchy skill"
rm -rf ~/.agents
rm -rf ~/.claude
rm -rf ~/.codex
rm -rf ~/.pi
