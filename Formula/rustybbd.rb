# rustybbd — host-side CANopen bootloader firmware-update CLI.
# Prebuilt, minisign-signed binary mirrored to kodezine.com (IPv4).
# Verify the public key at https://kodezine.com/software/rustybbd.html
class Rustybbd < Formula
  desc "Flash firmware onto CANopen bootloader devices over SDO (host CLI)"
  homepage "https://kodezine.com/software/rustybbd.html"
  url "https://kodezine.com/downloads/rustybbd/v0.1.0/rustybbd-v0.1.0-aarch64-apple-darwin.tar.gz"
  version "0.1.0"
  sha256 "ba648119bc925719c9beed631df9f65799c50191afbd0c2a78f4798acfa7d6ab"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "rustybbd"
  end

  test do
    assert_match "rustybbd", shell_output("#{bin}/rustybbd --help")
  end
end
