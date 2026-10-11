cask "ginkgo" do
  version "0.1.27"
  sha256 "ab35caa79c2d0a6bed1b334f6ed5b33039e6ad534411099849735996f6a287b7"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.27/Ginkgo-0.1.27.zip"
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
