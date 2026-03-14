class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.7/tars_0.5.7_darwin_arm64.tar.gz"
      sha256 "7ba9907dadcc872f93b6c09cf786588621d802250a1715cdb5f58809f2f19750"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.7/tars_0.5.7_darwin_amd64.tar.gz"
      sha256 "064d707df7c36450467097cc10c9c10ff3c785f978b4eb31affcc896b9d2ba4a"
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
