cask "ginkgo" do
  version "0.1.32"
  sha256 "013fae8888548f2d35e831f98df21769da3d0bf7bd56f26e942bbc3a6537c9b0"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.32/Ginkgo-0.1.32.zip"
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
