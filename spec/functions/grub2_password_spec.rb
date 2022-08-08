require 'spec_helper'

# rubocop:disable RSpec/NamedSubject
describe 'grub2_password' do
  it { is_expected.to run.with_params.and_raise_error(ArgumentError) }
  it { is_expected.to run.with_params('test') }
  it { is_expected.to run.with_params('test', 'salt') }
  it { is_expected.to run.with_params('test', 'salt', 20_000) }

  it 'returns a hash with just a password' do
    result = subject.execute('test')

    expect(result).to match(%r{grub\.pbkdf2\.sha512\.10000\.})
  end

  it 'returns a hash with a hash' do
    result = subject.execute('test', 'salt')

    expect(result).to match(%r{grub\.pbkdf2\.sha512\.10000\.})
  end

  it 'returns a hash with rounds' do
    result = subject.execute('test', '', 20_000)

    expect(result).to match(%r{grub\.pbkdf2\.sha512\.20000\.})
  end
end
