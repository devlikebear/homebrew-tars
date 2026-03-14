class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.4/tars_0.5.4_darwin_arm64.tar.gz"
      sha256 "5912995d302406b5cd440928e531bf0a20c95e48ac7db4aa5b0c7aa5d34f96e5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.4/tars_0.5.4_darwin_amd64.tar.gz"
      sha256 "0f021c7e1ba34ce612ef6b9d82815655b223e62db852e320e49e6b1e4d7cc685"
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
