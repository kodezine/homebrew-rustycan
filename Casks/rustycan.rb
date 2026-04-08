cask "rustycan" do
  version "0.0.3-rc1"
  sha256 "11217f23655fa7a1012aaebc7b4288571df5aa1eed82e3d820ee956de954d034"

  url "https://github.com/kodezine/RustyCAN/releases/download/v0.0.3-rc1/rustycan-v0.0.3-rc1-aarch64-apple-darwin.dmg"
  name "RustyCAN"
  desc "CANopen viewer: log and analyze SDO/PDO/NMT events"
  homepage "https://github.com/kodezine/RustyCAN"

  app "RustyCAN.app"

  caveats <<~EOS
    RustyCAN requires the PEAK PCANBasic driver to use PEAK USB adapters.
    Download from:
      macOS:          https://mac-can.com
      Windows/Linux:  https://peak-system.com/downloads

    The KCAN USB dongle works without any additional drivers.

    On Linux, install the udev rules for USB access:
      sudo cp /opt/RustyCAN/packaging/50-rustycan.rules /etc/udev/rules.d/
      sudo udevadm control --reload-rules && sudo udevadm trigger
  EOS
end
