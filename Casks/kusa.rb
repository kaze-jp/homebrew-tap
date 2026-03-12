cask "kusa" do
  arch arm: "aarch64", intel: "e6d7421cb0b5b6a28277c6355056889a37c96dea624a7421de74af6a1135e333"

  version "0.2.0"

  sha256 arm:   "0f1a909b069a1890198381d1fddb7a3fef1fe990bbda6582d241c93a348a70ae",
         intel: "e6d7421cb0b5b6a28277c6355056889a37c96dea624a7421de74af6a1135e333"

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
