cask "ginkgo" do
  version "0.1.30"
  sha256 "ebe6a7eec3c50a388e1a8afbdf894ad73bfe3a8e77d1c9cebe7d194130566192"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.30/Ginkgo-0.1.30.zip"
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
