class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.1.2/tars_0.1.2_darwin_arm64.tar.gz"
      sha256 "67ef1dc7a1a20478c86a5e50abf5bd5151939722aab36e3950da40b18a56e1d8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.1.2/tars_0.1.2_darwin_amd64.tar.gz"
      sha256 "4d876b8d0c4d146574fcbc1e7b44c22c0e4d5b5467a0d154af18603da2b64633"
    end
  end

  def install
    bin.install "tars"
  end

  def caveats
    <<~EOS
      Optional assistant dependencies are not installed by this formula.
      Install them separately when needed:
        brew install ffmpeg whisper-cpp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
