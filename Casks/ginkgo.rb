cask "ginkgo" do
  version "0.1.40"
  sha256 "954987b80b21aaa1b5c2cf2ec048b5d3cf2e94746a7c145f6249bb1bea1b5939"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.40/Ginkgo-0.1.40.zip"
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
