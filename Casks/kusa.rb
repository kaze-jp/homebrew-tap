cask "kusa" do
  arch arm: "aarch64", intel: "91390aaf3fde34f5860cf93532a20a790c4c800119b4d78cb9bed48c3ef6e417"

  version "0.3.6"

  sha256 arm:   "8c4fd4a183deda9bd479118d7ae67771ddb8ca06dcaf0571fbf712ed527287b1",
         intel: "91390aaf3fde34f5860cf93532a20a790c4c800119b4d78cb9bed48c3ef6e417"

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
