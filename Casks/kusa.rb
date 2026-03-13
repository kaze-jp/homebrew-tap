cask "kusa" do
  arch arm: "aarch64", intel: "9a69f879909dfce10e19ebe6a9a291facaae14fac2a0e25f4d793398d03f4090"

  version "0.3.5"

  sha256 arm:   "a3ae9805fed7678d47e9fb1aa8f5d777d763791e38b780fb078c55822dcbc353",
         intel: "9a69f879909dfce10e19ebe6a9a291facaae14fac2a0e25f4d793398d03f4090"

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
