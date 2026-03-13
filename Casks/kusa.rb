cask "kusa" do
  arch arm: "aarch64", intel: "da578ad1bbe803dfb0d9196728979360b003bc93d18fd335054aa925d77456a7"

  version "0.3.6"

  sha256 arm:   "ef7874bb9de81f1b1da1fe6308d451e698b5011f789d97dc589fc0a3ee9f930f",
         intel: "da578ad1bbe803dfb0d9196728979360b003bc93d18fd335054aa925d77456a7"

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
