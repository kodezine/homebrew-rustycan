cask "rustycan" do
  version "0.1.0"
  sha256 "55a8733c3bad371c5b7a200842d6a308c0c9e1e928abcae8967a3d0d487dadb9"

  url "https://github.com/kodezine/RustyCAN/releases/download/v0.1.0/rustycan-v0.1.0-aarch64-apple-darwin.dmg"
  name "RustyCAN"
  desc "CANopen viewer: log and analyze SDO/PDO/NMT events"
  homepage "https://github.com/kodezine/RustyCAN"

  app "RustyCAN.app"
  binary "#{appdir}/RustyCAN.app/Contents/MacOS/rustycan"

  # RustyCAN is not notarized. Strip the quarantine flag Gatekeeper attaches
  # to downloaded apps so the "damaged" error does not appear at first launch.
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/RustyCAN.app"]
  end

  caveats <<~EOS
    RustyCAN is not notarized with Apple. If macOS still blocks it, run:
      xattr -dr com.apple.quarantine /Applications/RustyCAN.app

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
