class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.1/tars_0.5.1_darwin_arm64.tar.gz"
      sha256 "d0a6baeaac0af288ccd950ee1640c46e3e3beba40641d647740218de6be2c1e8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.1/tars_0.5.1_darwin_amd64.tar.gz"
      sha256 "d197f8287dde1384c1a9b325792ffa02ff5e0f857d3450215a5b102d857e406c"
    end
  end

  def install
    bin.install "tars"
    prefix.install "share" if Dir.exist?("share")
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
