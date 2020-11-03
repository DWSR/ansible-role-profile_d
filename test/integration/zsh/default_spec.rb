# The user that GitHub-hosted runners run as
user = 'runner'

describe file("/Users/#{user}/.profile") do
  it { should exist }
  it { should_not be_more_permissive_than('0600') }
  its('owner') { should eq user }
  its('content') { should match(%r{# Managed by Ansible}) }
  its('content') { should match(%r{# if running bash})}
  its('content') { should match(%r{# if running zsh})}
end

describe directory("/Users/#{user}/.profile.d") do
  it { should exist }
  its('owner') { should eq user }
  it { should_not be_more_permissive_than('0700') }
end

%w[00_add_private_bin 00_bashcompinit].each do |f|
  describe file("/Users/#{user}/.profile.d/#{f}") do
    it { should exist }
    its('owner') { should eq user }
    it { should_not be_more_permissive_than('0600') }
    its('content') { should match(%r{# Managed by Ansible}) }
  end
end
