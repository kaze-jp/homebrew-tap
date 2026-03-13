cask "kusa" do
  arch arm: "aarch64", intel: "86e6b54070fb04f458a643bfb64259a639dc05e4c5ecc5f75101730749ccaba3"

  version "0.3.2"

  sha256 arm:   "1a969f212af950b32bdcc1c99da508697024f838f5863c3813fcb70eec7e8767",
         intel: "86e6b54070fb04f458a643bfb64259a639dc05e4c5ecc5f75101730749ccaba3"

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
