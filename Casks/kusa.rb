cask "kusa" do
  arch arm: "aarch64", intel: "af0420893cd71d15a92af9b53e18e09332c0cb9329f0c4b5d50edb02e00bc8ba"

  version "0.1.0"

  sha256 arm:   "ed1d427a87bd1e0d9f6b14988902d3d89593b5e203beb3fa85758f7bfccb58c4",
         intel: "af0420893cd71d15a92af9b53e18e09332c0cb9329f0c4b5d50edb02e00bc8ba"

  url "https://github.com/kaze-jp/kusa/releases/download/v#{version}/kusa_#{version}_#{arch}.dmg",
      verified: "github.com/kaze-jp/kusa/"

  name "kusa"
  desc "Markdown editor for AI developers"
  homepage "https://github.com/kaze-jp/kusa"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "kusa.app"

  # Symlink the CLI binary so `kusa` is available in PATH
  binary "#{appdir}/kusa.app/Contents/MacOS/kusa"

  zap trash: [
    "~/Library/Application Support/jp.kaze.kusa",
    "~/Library/Caches/jp.kaze.kusa",
    "~/Library/Preferences/jp.kaze.kusa.plist",
    "~/Library/Saved Application State/jp.kaze.kusa.savedState",
  ]
end
