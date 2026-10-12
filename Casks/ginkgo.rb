cask "ginkgo" do
  version "0.1.31"
  sha256 "5078161c68cbd8c16bb11d88e3d0235a3d2a6d77fc661378b93388f714611d6c"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.31/Ginkgo-0.1.31.zip"
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
