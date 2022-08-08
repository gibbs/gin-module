# @see https://github.com/puppetlabs/puppetlabs-apt/blob/v7.7.1/manifests/key.pp
type Gin::APT::Key = Struct[
  {
    Optional['content']  => String,
    Optional['ensure']   => Enum['present', 'absent', 'refreshed'],
    Optional['id']       => Pattern[/\A(0x)?[0-9a-fA-F]{8}\Z/, /\A(0x)?[0-9a-fA-F]{16}\Z/, /\A(0x)?[0-9a-fA-F]{40}\Z/],
    Optional['options']  => String,
    Optional['server']   => Pattern[/\A((hkp|hkps|http|https):\/\/)?([a-z\d])([a-z\d-]{0,61}\.)+[a-z\d]+(:\d{2,5})?(\/[a-zA-Z\d\-_.]+)*\/?$/],
    Optional['source']   => Pattern[/\Ahttps?:\/\//, /\Aftp:\/\//, /\A\/\w+/],
    Optional['weak_ssl'] => Boolean,
  }
]
