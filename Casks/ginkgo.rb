cask "ginkgo" do
  version "0.1.25"
  sha256 "87e94d3ddd67f3efb7df5e015cfc2ef0948406d4e29eb135f2733b0db9c1ac51"

  url "https://ginkgo-downloads.certimate.me/releases/0.1.25/Ginkgo-0.1.25.zip"
  name "Ginkgo"
  desc "Menu bar clipboard companion with on-device insights"
  homepage "https://ginkgo.ikit.fun"

  depends_on macos: ">= :sonoma"

  app "Ginkgo.app"

  zap trash: [
    "~/Library/Application Support/Ginkgo",
    "~/Library/Preferences/com.ginkgoapp.app.plist",
  ]
end
