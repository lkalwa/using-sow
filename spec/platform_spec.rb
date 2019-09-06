# frozen_string_literal: true

RSpec.describe 'Something' do
  it 'passes or fails for MRI' do
    expect(ENV.key?('MRI')).to be_truthy
  end

  it 'passes or fails for jRuby' do
    expect(ENV.key?('MRI')).to be_falsey
  end
end