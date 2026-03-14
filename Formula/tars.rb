class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.10/tars_0.5.10_darwin_arm64.tar.gz"
      sha256 "04d341581648e7c31503bddb75042e7f31709a06594c42d3eff8ac0e6f41b467"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.10/tars_0.5.10_darwin_amd64.tar.gz"
      sha256 "aea8428c4114e12e04dbaabfd5e5cd14e4d3b7b4c6a040fac6c63c5b9e30bf1d"
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
