# @see https://github.com/puppetlabs/puppetlabs-apt/blob/v7.7.1/manifests/ppa.pp
type Gin::APT::PPA = Struct[
  {
    Optional['dist']           => String,
    Optional['ensure']         => String,
    Optional['options']        => String,
    Optional['package_manage'] => Boolean,
    Optional['package_name']   => String,
    Optional['release']        => String,
  }
]
