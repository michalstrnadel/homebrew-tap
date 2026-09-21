cask "agentbar" do
  version "1.28.0"
  sha256 "c8464f6d2639048c9d567e13553661223209a495b2a1750e19ed1bb0e9ab0dc6"

  url "https://github.com/michalstrnadel/AgentBar/releases/download/v#{version}/AgentBar.app.zip"
  name "AgentBar"
  desc "Menu bar item and Dynamic Island for all your AI coding agents"
  homepage "https://github.com/michalstrnadel/AgentBar"

  depends_on macos: :monterey

  app "AgentBar.app"

  # Signed with the project's stable certificate but not notarized: clear quarantine
  # so first launch isn't blocked by Gatekeeper's "cannot verify" dialog. Installing
  # from this tap is the opt-in.
  postflight_steps do
    run "/usr/bin/xattr",
        args:  ["-dr", "com.apple.quarantine", "AgentBar.app"],
        chdir: "{{appdir}}"
  end

  # The OpenCode plugin lives outside ~/.agentbar because OpenCode loads plugins
  # only from its own directory; hook entries merged into other agents' configs
  # stay for the user to remove (see the README's Uninstall section).
  zap trash: [
    "~/.agentbar",
    "~/.config/opencode/plugins/agentbar.js",
  ]

  caveats <<~EOS
    AgentBar is signed with the project's certificate but not Apple-notarized;
    this cask removes the quarantine flag after install so the first launch
    isn't blocked. If macOS still shows "cannot verify" later (e.g. after a
    manual download), run:
      xattr -dr com.apple.quarantine "/Applications/AgentBar.app"

    Since 1.10.2 releases share one signing identity, so permissions you grant
    (e.g. Documents access) survive updates.

    First launch installs Claude Code hooks into ~/.claude/settings.json.
    Start a NEW agent session afterwards to see it in the menu bar.
  EOS
end
