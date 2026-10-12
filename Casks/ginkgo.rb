cask "ginkgo" do
  version "0.1.28"
  sha256 "aad4c72292803f10775473d8e61d48a3a2d89c636243c853c4e4bb00e4069367"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.28/Ginkgo-0.1.28.zip"
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
