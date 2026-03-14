class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.5/tars_0.5.5_darwin_arm64.tar.gz"
      sha256 "412ea19eaa20b879ac8cc8650e1309459e27ebec63c584a13e589b9fc7d9c114"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.5/tars_0.5.5_darwin_amd64.tar.gz"
      sha256 "49d2daf4ece1e8f286a15d2e9ce18b0f6e40f8e24ffc6b0d659cc2fd2e55d09c"
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
