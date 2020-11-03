describe file('/home/kitchen/.profile') do
  it { should exist }
  it { should_not be_more_permissive_than('0600') }
  its('owner') { should eq 'kitchen' }
  its('group') { should eq 'kitchen' }
  its('content') { should match(%r{# Managed by Ansible}) }
  its('content') { should match(%r{# if running bash})}
  its('content') { should match(%r{# if running zsh})}
end

describe directory('/home/kitchen/.profile.d') do
  it { should exist }
  its('owner') { should eq 'kitchen' }
  its('group') { should eq 'kitchen' }
  it { should_not be_more_permissive_than('0700') }
  its('owner') { should eq 'kitchen' }
  its('group') { should eq 'kitchen' }
end

describe file('/home/kitchen/.profile.d/00_add_private_bin') do
  it { should exist }
  its('owner') { should eq 'kitchen' }
  its('group') { should eq 'kitchen' }
  it { should_not be_more_permissive_than('0600') }
  its('content') { should match(%r{# Managed by Ansible}) }
  its('content') { should match(%r{# set PATH so it includes user's private bin if it exists}) }
end

describe file('/home/kitchen/.profile.d/00_bashcompinit') do
  it { should_not exist}
end
