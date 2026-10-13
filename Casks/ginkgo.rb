cask "ginkgo" do
  version "0.1.34"
  sha256 "b7bb628eaaf52fe6c8fcd4375e81759601b073a916de45dbd5e409cb7134132a"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.34/Ginkgo-0.1.34.zip"
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
