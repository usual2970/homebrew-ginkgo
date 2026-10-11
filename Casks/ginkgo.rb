cask "ginkgo" do
  version "0.1.26"
  sha256 "28770804f57ac523166a1a181c4909ca1ced5ea57a84d8dd508234dd5dacbd61"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.26/Ginkgo-0.1.26.zip"
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
