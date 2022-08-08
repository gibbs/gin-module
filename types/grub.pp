# @summary GRUB
type Gin::GRUB = Struct[
  {
    Optional['boot_without_password'] => Boolean,
    Optional['enable']                => Boolean,
    Optional['password']              => String,
    Optional['password_rounds']       => Integer[1, 2147483647],
    Optional['password_salt']         => String[1],
    Optional['user']                  => String,
  }
]
