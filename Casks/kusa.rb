cask "kusa" do
  arch arm: "aarch64", intel: "da578ad1bbe803dfb0d9196728979360b003bc93d18fd335054aa925d77456a7"

  version "0.3.5"

  sha256 arm:   "0c012e42f1444dd8196ddf16d91d8063248962472f9d2962f4ac469703124ace",
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
