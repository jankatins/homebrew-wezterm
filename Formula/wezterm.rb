# Note: if you are viewing this from the tap repo, this file is automatically
# updated from:
# https://github.com/wez/wezterm/blob/main/ci/wezterm-homebrew-macos.rb.template
# by automation in the wezterm repo.

class Wezterm < Formula
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"
  url "https://github.com/wez/wezterm/releases/download/20210404-112810-b63a949d/WezTerm-macos-20210404-112810-b63a949d.zip"
  sha256 "c843add5e65189f02ed1c546dd25d162b610d98655e4834a65371269d6804984"
  head "https://github.com/wez/wezterm/releases/download/nightly/WezTerm-macos-nightly.zip"

  def install
    prefix.install "WezTerm.app"
    bindir = "#{prefix}/WezTerm.app"
    macosdir = "#{bindir}/Contents/MacOS"
    if File.directory?(macosdir) then
      bindir = macosdir
    end
    ["wezterm", "wezterm-gui", "wezterm-mux-server", "strip-ansi-escapes"].each { |tool|
      bin.write_exec_script "#{bindir}/#{tool}"
    }
  end
end

