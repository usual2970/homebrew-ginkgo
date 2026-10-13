cask "ginkgo" do
  version "0.1.33"
  sha256 "b07f58b6aefc53904e52fe3c51f867fea587e483da2765d9090c5736dd6fb621"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.33/Ginkgo-0.1.33.zip"
  name "Ginkgo"
  desc "Menu bar clipboard companion with on-device insights"
  homepage "https://ginkgo.ikit.fun"

  depends_on macos: :sonoma

  app "Ginkgo.app"

  # Ad-hoc signed, not notarized: Gatekeeper rejects it while quarantined.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Ginkgo.app"]
  end

  zap trash: [
    "~/Library/Application Support/Ginkgo",
    "~/Library/Preferences/com.ginkgoapp.app.plist",
  ]
end
