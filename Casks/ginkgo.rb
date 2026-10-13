cask "ginkgo" do
  version "0.1.36"
  sha256 "13736b1ffaeebf67474e08d6eae7512b7acd674af4cbca46dfbde967f7c04dab"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.36/Ginkgo-0.1.36.zip"
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
