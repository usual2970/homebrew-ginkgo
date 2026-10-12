cask "ginkgo" do
  version "0.1.29"
  sha256 "7e2aff932a212c6a742bf04fc60764f116f372c756e584af51f4e6d737610e0a"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.29/Ginkgo-0.1.29.zip"
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
