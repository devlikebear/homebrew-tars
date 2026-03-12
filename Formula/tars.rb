class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.2.0/tars_0.2.0_darwin_arm64.tar.gz"
      sha256 "ebe19150756f9a8a8f6ef9b5283d96d1e5573a2e51677040e1afa9b6e8566b55"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.2.0/tars_0.2.0_darwin_amd64.tar.gz"
      sha256 "dd08ce80a87d77f484149bb56d9f8210ba05f576669943e108e149901e6340b3"
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
