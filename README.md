# homebrew-tap

Personal Homebrew tap for [michalstrnadel](https://github.com/michalstrnadel)'s tools.

## Casks

### `agentbar` — [AgentBar](https://github.com/michalstrnadel/AgentBar)

One menu bar item for all your AI coding agents (Claude Code, Codex, Copilot,
Cursor, Gemini CLI, Antigravity): live status plus one-click permission approvals.

```bash
brew install --cask michalstrnadel/tap/agentbar
```

Upgrade later with:

```bash
brew upgrade --cask agentbar
```

#### Notes

- **Signing** — AgentBar is ad-hoc signed (no Apple notarization). The cask clears
  the quarantine flag after install so the first launch isn't blocked by
  Gatekeeper's "cannot verify" dialog; installing from this tap is the opt-in
  for that.
- **Version drift** — the app also updates itself (**Check for Updates…** in its
  menu checks GitHub Releases daily). If you update that way, `brew outdated`
  keeps reporting the old version until you run `brew upgrade --cask agentbar`.
  Running it is always safe: both paths install the exact same release bundle.
- **Staying in sync** — `Casks/agentbar.rb` is bumped (version + sha256 of
  `AgentBar.app.zip`) as part of every AgentBar release; see the
  [release checklist](https://github.com/michalstrnadel/AgentBar/blob/main/CONTRIBUTING.md#releases).
