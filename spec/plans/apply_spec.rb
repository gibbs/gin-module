require 'spec_helper'
require 'spec_helper_bolt'
require 'bolt_spec/plans'

describe 'gin_apply' do
  let(:plan)    { 'gin::apply' }
  let(:targets) { 'localhost' }

  it 'runs with no parameters' do
    expect_plan('gin::apply').be_called_times(1)
  end
end
