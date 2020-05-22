class PdfR2l < Formula
  desc "Change PDF reading direction to Right-to-Left (R2L)"
  homepage "https://github.com/ottijp/pdf-r2l"
  url "https://github.com/ottijp/pdf-r2l/archive/v1.0.2.tar.gz"
  sha256 "421c44dae937bb010e5268ffc061fee3841ec1c668a208c06dd73dcfa9b62ab7"

  bottle do
    root_url "https://github.com/ottijp/pdf-r2l/releases/download/v1.0.2"
    cellar :any_skip_relocation
    sha256 "2218917185397ab470ee42c39cabed405de639500bb5d5c42fd0e238f950b83e" => :catalina
  end

  depends_on "gradle" => :build

  def install
    system "gradle", "-q", "installDist"

    bin.install "build/install/pdf-r2l/bin/pdf-r2l"
    libexec.install Dir["build/install/pdf-r2l/lib/*"]
    system "sed", "-i", "", "s/\\$APP_HOME\\/lib\\//\\$APP_HOME\\/libexec\\//g", "#{bin}/pdf-r2l"
  end

  test do
    system "false"
  end
end
