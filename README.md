# homebrew-ginkgo

Formula-only Homebrew tap for [Ginkgo](https://github.com/usual2970/ginkgo).
Binaries are **not** stored here — the cask downloads from the public
Cloudflare R2 origin configured in the release pipeline.

```sh
brew tap usual2970/ginkgo
brew install --cask ginkgo
```

`Casks/ginkgo.rb` is regenerated on each `v*` tag by
`ginkgo/script/update-homebrew-tap.sh` in CI.
