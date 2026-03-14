class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.11/tars_0.5.11_darwin_arm64.tar.gz"
      sha256 "16f5d2adf8af854573970fe1de6185646c98eee88d5f4740f24f649d5dd9a43a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.11/tars_0.5.11_darwin_amd64.tar.gz"
      sha256 "294613018f6435caae8dbb4d5a523e20b312cdfbabe67e97995e5779c7efdffb"
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
