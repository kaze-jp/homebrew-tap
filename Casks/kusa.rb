cask "kusa" do
  arch arm: "aarch64", intel: "65ea7e3c33713a1d124c21f5b1a7a46897461200ea48f6a327c148c8f0f28132"

  version "0.3.2"

  sha256 arm:   "dea846a08e83062c1ac6aeea0bbf8f5c46bef01c11b14869199422077c042879",
         intel: "65ea7e3c33713a1d124c21f5b1a7a46897461200ea48f6a327c148c8f0f28132"

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
