cask "agentbar" do
  version "1.3.0"
  sha256 "84f5910f4dd2584b60708c10ed078f5afb803b6087d3c201be918ab31db2d483"

  url "https://github.com/michalstrnadel/AgentBar/releases/download/v#{version}/AgentBar.app.zip"
  name "AgentBar"
  desc "One menu bar item for all your AI coding agents"
  homepage "https://github.com/michalstrnadel/AgentBar"

  depends_on macos: :monterey

  app "AgentBar.app"

  # Ad-hoc signed (no notarization): clear quarantine so first launch isn't blocked
  # by Gatekeeper's "cannot verify" dialog. Installing from this tap is the opt-in.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AgentBar.app"]
  end

  zap trash: [
    "~/.agentbar",
  ]

  caveats <<~EOS
    AgentBar is ad-hoc signed (no Apple notarization); this cask removes the
    quarantine flag after install so the first launch isn't blocked. If macOS
    still shows "cannot verify" later (e.g. after a manual download), run:
      xattr -dr com.apple.quarantine "/Applications/AgentBar.app"

    First launch installs Claude Code hooks into ~/.claude/settings.json.
    Start a NEW agent session afterwards to see it in the menu bar.
  EOS
end
