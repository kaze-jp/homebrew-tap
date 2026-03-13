cask "kusa" do
  arch arm: "aarch64", intel: "dbefef7052a89723ffcb800b52e3cad1fb3b0f27e227bc382079d3c1092d9fe6"

  version "0.2.1"

  sha256 arm:   "0883c3ad9879d3e440df3d79c12ebbd4c61db0c6790024905e675390b297ff5b",
         intel: "dbefef7052a89723ffcb800b52e3cad1fb3b0f27e227bc382079d3c1092d9fe6"

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
