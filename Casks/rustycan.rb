cask "rustycan" do
  version "0.3.1"
  sha256 "9d0204bcb97adfdd322969b28dca32377c15e75024a5b004c7f45d99b39f0320"

  url "https://kodezine.com/downloads/v0.3.1/rustycan-v0.3.1-aarch64-apple-darwin.dmg"
  name "RustyCAN"
  desc "CANopen viewer: log and analyze SDO/PDO/NMT events"
  homepage "https://kodezine.com/software/rustycan.html"

  depends_on :macos

  app "RustyCAN.app"
  binary "#{appdir}/RustyCAN.app/Contents/MacOS/rustycan"

  # RustyCAN is not notarized. Strip the quarantine flag Gatekeeper attaches
  # to downloaded apps so the "damaged" error does not appear at first launch.
  preflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{staged_path}}/RustyCAN.app"]
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
