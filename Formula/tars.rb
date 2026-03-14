class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.3/tars_0.5.3_darwin_arm64.tar.gz"
      sha256 "0f01f1106ba884b6f7ed48f437006af1e416fe607265a4d2c85b5937e65ddb3f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.3/tars_0.5.3_darwin_amd64.tar.gz"
      sha256 "124430f0e08bbece4eeafce562bc44e0c6db4639c85d7afa157336ccfd425bd4"
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
