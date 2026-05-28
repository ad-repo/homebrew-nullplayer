# homebrew-nullplayer

Personal [Homebrew](https://brew.sh) tap for [NullPlayer](https://github.com/ad-repo/nullplayer), a throwback open-source macOS music player.

## Install

```bash
brew install --cask ad-repo/nullplayer/nullplayer
```

That expands to `brew tap ad-repo/nullplayer && brew install --cask nullplayer`.

## Upgrade

```bash
brew update
brew upgrade --cask nullplayer
```

## Uninstall

```bash
brew uninstall --cask nullplayer
# Or, to also remove app data (Application Support, Preferences, Caches):
brew uninstall --cask --zap nullplayer
```

`--zap` does **not** remove Keychain entries for Plex/Subsonic/Jellyfin/Emby tokens. To clear those:

```bash
security delete-generic-password -s com.nullplayer.app
```

## Notes

- NullPlayer is currently ad-hoc signed (no Apple Developer ID notarization yet). The cask runs `xattr -cr` in `postflight` so Gatekeeper does not block first launch. The `postflight` block will be removed once notarization ships in the upstream release pipeline.
- `depends_on macos: ">= :sonoma"` matches the app's `LSMinimumSystemVersion = 14.0`.

## Issues

Report cask-specific issues here. Report app bugs at [ad-repo/nullplayer/issues](https://github.com/ad-repo/nullplayer/issues).
