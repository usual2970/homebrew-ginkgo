cask "ginkgo" do
  version "0.1.35"
  sha256 "61ea24f7cd19e1d865dd397024965ee853ed7fdab4a8a81df2c387e36a00871d"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.35/Ginkgo-0.1.35.zip"
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
