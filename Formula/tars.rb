class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.3.0/tars_0.3.0_darwin_arm64.tar.gz"
      sha256 "a72d3bfbb2ac50d6633fd65f9e15ec2a0f7a58f1dd742501af21b2cb9fab2d6b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.3.0/tars_0.3.0_darwin_amd64.tar.gz"
      sha256 "a22bd55da075808a2f9f8b8b0d8f1f68ff7f730d560b92d52468df997e48b6f0"
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
