class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.0/tars_0.5.0_darwin_arm64.tar.gz"
      sha256 "3cca33a7639f69ed01bef212480df74e36381ec1f4c93354760aea718a54746f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.0/tars_0.5.0_darwin_amd64.tar.gz"
      sha256 "25aa01ce0f02756963565e32c0a6c412d57166e04add30ee5acbb259c0d488e6"
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
