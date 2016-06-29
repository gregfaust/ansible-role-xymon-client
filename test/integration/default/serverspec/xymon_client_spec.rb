require "spec_helper"

describe "Xymon Client Daemon" do
  describe file('/etc/default/xymon-client') do
    it { should be_file }
    its(:content) { should match /^XYMONSERVERS="10.0.15.10"$/ }
    its(:content) { should match /^CLIENTHOSTNAME="default-trusty64"$/ }
  end

  describe service('xymon-client') do
    it { should be_enabled }
    it { should be_running }
  end

end
