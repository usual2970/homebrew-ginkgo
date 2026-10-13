cask "ginkgo" do
  version "0.1.38"
  sha256 "7b554030330657305fdbc617e0041389f81e6b37ed57abd7004eb57640170c04"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.38/Ginkgo-0.1.38.zip"
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
