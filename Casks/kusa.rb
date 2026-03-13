cask "kusa" do
  arch arm: "aarch64", intel: "6f62d2065f5b705f855cb9a88674880c42f2adc0f6a5eca55fcb0d67fa0bb133"

  version "0.3.4"

  sha256 arm:   "ca7d463f42a3a960b450c9f456df7ebc7d3f4a4fd646b544f047e7612423c9db",
         intel: "6f62d2065f5b705f855cb9a88674880c42f2adc0f6a5eca55fcb0d67fa0bb133"

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
