class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.9/tars_0.5.9_darwin_arm64.tar.gz"
      sha256 "0e03371b8e324a89a1bec69b8e2d1f809eaa95b33b549a088bd6af681fae0a9f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.9/tars_0.5.9_darwin_amd64.tar.gz"
      sha256 "f148c33aea19ac8653b1c14284efe5ce360494485778c31eab747b55d7d5b7d4"
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
