# homebrew-imageweb

Homebrew tap for [imageWebMacGUI](https://github.com/maximilianMairinger/imageWebMacGUI) — Finder Quick Actions for image-web.

## Install

```bash
brew tap maximilianMairinger/imageweb
brew install imageweb-macos
imageweb-setup
```

`imageweb-setup` registers the Quick Actions with Finder. Run it once after install.

## Uninstall

```bash
imageweb-teardown
brew uninstall imageweb-macos
brew untap maximilianMairinger/imageweb
```

Run `imageweb-teardown` before uninstalling to clean up `~/Library/Services/`.
