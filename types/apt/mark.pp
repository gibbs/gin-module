# @see https://github.com/puppetlabs/puppetlabs-apt/blob/v7.7.1/manifests/mark.pp
type Gin::APT::Mark = Struct[
  {
    Optional['setting'] => Enum['auto','manual','hold','unhold'],
  }
]
