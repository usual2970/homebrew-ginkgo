cask "ginkgo" do
  version "0.1.41"
  sha256 "77c133a5b6a097ed7e50ada8dd97c585da7cda9b25a23ee47456f9cd6bb5e292"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.41/Ginkgo-0.1.41.zip"
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
