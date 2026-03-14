class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.4.0/tars_0.4.0_darwin_arm64.tar.gz"
      sha256 "b3a7e84722e4516beca20431f144d408993609711a66a4e49961030c17e33831"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.4.0/tars_0.4.0_darwin_amd64.tar.gz"
      sha256 "2f845c61dcec53e3849e4e6b33f2b9be8d3c583e41882a679aa7e00b51d97725"
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
