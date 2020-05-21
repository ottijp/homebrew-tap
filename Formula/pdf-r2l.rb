class PdfR2l < Formula
  desc "Change PDF reading direction to Right-to-Left (R2L)"
  homepage "https://github.com/ottijp/pdf-r2l"
  url "https://github.com/ottijp/pdf-r2l/archive/v1.0.1.tar.gz"
  sha256 "ea13710f2a17c27d46e5cd69bed01700e61646ae1325504df90f1f827c65e1a6"

  bottle do
    root_url "https://github.com/ottijp/pdf-r2l/releases/download/v1.0.1"
    cellar :any_skip_relocation
    sha256 "763118b39d3822b3ee3df8e9709332849d29499a120b9be1ad81f8594e6d08d7" => :catalina
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
