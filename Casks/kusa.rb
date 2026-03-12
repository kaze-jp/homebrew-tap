cask "kusa" do
  arch arm: "aarch64", intel: "0bea1d31543c8844055d14758cefad373ecf4e565f9d11cf2d2b93327e13e94b"

  version "0.2.0"

  sha256 arm:   "366d99dd9c3ce3f2735700ddaba80cce6ba83a01674f73d963bb84e3a7886a74",
         intel: "0bea1d31543c8844055d14758cefad373ecf4e565f9d11cf2d2b93327e13e94b"

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
