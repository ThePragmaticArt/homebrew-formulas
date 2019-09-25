class Carthage < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/thepragmaticart/Carthage"
  url "https://github.com/thepragmaticart/Carthage.git",
      :tag      => "0.40.1+nsoperations",
      :version  => "0.40.1",
      :revision => "16dac63e6d2affbf10ce66a7c32104d187bfe209",
      :shallow  => false
  head "https://github.com/thepragmaticart/Carthage.git", :shallow => false

  depends_on :xcode => ["10.2", :build]

  bottle do
    root_url "https://dl.bintray.com/thepragmaticart/bottles-formulas"
    cellar :any_skip_relocation
    sha256 "9f27aa237ba73aa253068d7ebe6bd59df9aad9433a0288d16ba7660a3480e6b3" => :mojave
  end

  def install
    if MacOS::Xcode.version >= "10.2" && MacOS.full_version < "10.14.4" && MacOS.version >= "10.14"
      odie "Xcode >=10.2 requires macOS >=10.14.4 to build Swift formulae."
    end

    system "make", "prefix_install", "PREFIX=#{prefix}"
    bash_completion.install "Source/Scripts/carthage-bash-completion" => "carthage"
    zsh_completion.install "Source/Scripts/carthage-zsh-completion" => "_carthage"
    fish_completion.install "Source/Scripts/carthage-fish-completion" => "carthage.fish"
  end

  test do
    system bin/"carthage", "version"
  end
end
