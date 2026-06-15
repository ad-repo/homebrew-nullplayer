cask "nullplayer" do
  version "0.25.0"
  sha256 "7a4ff2144808631139edf676228b60e5a5a2c20d7af552ae77ae7b7100fb8cc0"

  url "https://github.com/ad-repo/nullplayer/releases/download/#{version}/NullPlayer-#{version}.dmg"
  name "NullPlayer"
  desc "Free open source media player with first-class headless CLI"
  homepage "https://github.com/ad-repo/nullplayer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "NullPlayer.app"

  # App is ad-hoc signed (not notarized). Strip quarantine so Gatekeeper
  # does not block first launch. Remove this block once notarization ships.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/NullPlayer.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/NullPlayer",
    "~/Library/Caches/com.nullplayer.app",
    "~/Library/Preferences/com.nullplayer.app.plist",
    "~/Library/Saved Application State/com.nullplayer.app.savedState",
  ]

  # NOTE: Plex/Subsonic/Jellyfin/Emby tokens are stored in the macOS Keychain
  # under service "com.nullplayer.app" (see KeychainHelper.swift in the main
  # repo). `zap trash:` cannot remove keychain items. Users can remove them
  # manually with:
  #   security delete-generic-password -s com.nullplayer.app
end
