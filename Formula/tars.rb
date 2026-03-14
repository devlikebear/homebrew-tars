class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.5.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.5.2/tars_0.5.2_darwin_arm64.tar.gz"
      sha256 "9d51f47aa3b22b32af803fa8fa403e8bc1d746f22c58a199ab9472236fc0d101"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.5.2/tars_0.5.2_darwin_amd64.tar.gz"
      sha256 "3bbfc7155aca091a5d6221edc03ff091889aa62973d3b5cc1380faa546b74a41"
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
