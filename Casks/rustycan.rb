cask "rustycan" do
  version "0.1.0"
  sha256 "placeholder"

  url "https://github.com/kodezine/RustyCAN/releases/download/v#{version}/rustycan-v#{version}-aarch64-apple-darwin.dmg"
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
