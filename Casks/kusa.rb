cask "kusa" do
  arch arm: "aarch64", intel: "68173e433b37f0df97f3069e81e59a1ec2d6ba15660de33c20979ae92207b86b"

  version "0.3.7"

  sha256 arm:   "638be11e00ac5ff4a2ff2992504657deaa34ba0eb7d193b39d96a70ec429cc45",
         intel: "68173e433b37f0df97f3069e81e59a1ec2d6ba15660de33c20979ae92207b86b"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/kusa.app"]
  end

  zap trash: [
    "~/Library/Application Support/jp.kaze.kusa",
    "~/Library/Caches/jp.kaze.kusa",
    "~/Library/Preferences/jp.kaze.kusa.plist",
    "~/Library/Saved Application State/jp.kaze.kusa.savedState",
  ]
end
