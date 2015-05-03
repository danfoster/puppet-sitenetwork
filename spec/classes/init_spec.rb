require 'spec_helper'
describe 'sitenetwork' do

  context 'with defaults for all parameters' do
    it { should contain_class('sitenetwork') }
  end
end
