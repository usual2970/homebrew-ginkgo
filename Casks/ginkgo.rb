cask "ginkgo" do
  version "0.1.25"
  sha256 "fa1317551a0d9ba295051bea42eea3fe7677870a8052e4fa73317fa45543be7e"

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
