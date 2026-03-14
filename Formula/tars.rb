class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.6/tars_0.5.6_darwin_arm64.tar.gz"
      sha256 "7feefa28cb2e88704c6da33f75942b142796f0bbccb5e227c65769df473b0c10"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.6/tars_0.5.6_darwin_amd64.tar.gz"
      sha256 "49fc18107adb95511892eb9674da0f8b26d1495f9fe36a95dce530868eb4d345"
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
