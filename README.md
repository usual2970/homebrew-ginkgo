# homebrew-ginkgo

Homebrew tap for [Ginkgo](https://github.com/usual2970/ginkgo). The cask
downloads its zip from Cloudflare R2.

The tap is frozen. A Ginkgo release tag does not update `Casks/ginkgo.rb`.

The only writer is `script/update-homebrew-tap.sh` in the Ginkgo repo.
Run it from a ginkgo checkout after that version is already on R2, and
only when you must move the cask. Do not edit `Casks/ginkgo.rb` by hand.

```bash
HOMEBREW_TAP_TOKEN=<github-token> ./script/update-homebrew-tap.sh 0.1.3
```
