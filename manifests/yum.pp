# @summary Yellowdog Updater, Modified (YUM)
#
# @api private
#
# @see https://forge.puppet.com/modules/puppet/yum
#
class gin::yum {
  assert_private()

  if $facts['os']['family'] == 'RedHat' {
    $config = lookup({
      'name'          => 'gin::yum',
      'value_type'    => Gin::YUM,
      'default_value' => {},
    })

    $parameters = deep_merge({
      clean_old_kernels => true,
      keep_kernel_devel => false,
    }, $config)

    class { 'yum':
      * => $parameters,
    }

    $gpg_keys = lookup({
      'name'          => 'gin::yum_gpg_keys',
      'value_type'    => Hash[String, Gin::YUM::GPG_Key],
      'default_value' => {},
    })

    $gpg_keys.each |$gpg_key, $parameters| {
      yum::gpgkey { $gpg_key:
        * => $parameters,
      }
    }

    $groups = lookup({
      'name'          => 'gin::yum_groups',
      'value_type'    => Hash[String, Gin::YUM::Group],
      'default_value' => {},
    })

    $groups.each |$group, $parameters| {
      yum::group { $group:
        * => $parameters,
      }
    }

    $plugins = lookup({
      'name'          => 'gin::yum_plugins',
      'value_type'    => Hash[String, Gin::YUM::Plugin],
      'default_value' => {},
    })

    $plugins.each |$plugin, $parameters| {
      yum::plugin { $plugin:
        * => $parameters,
      }
    }

    $post_transaction_actions = lookup({
      'name'          => 'gin::yum_post_transaction_actions',
      'value_type'    => Hash[String, Gin::YUM::Post_Transaction_Action],
      'default_value' => {},
    })

    $post_transaction_actions.each |$action, $parameters| {
      yum::post_transaction_action { $action:
        * => $parameters,
      }
    }

    $version_locks = lookup({
      'name'          => 'gin::yum_version_locks',
      'value_type'    => Hash[String, Gin::YUM::Version_Lock],
      'default_value' => {},
    })

    $version_locks.each |$version_lock, $parameters| {
      yum::versionlock { $version_lock:
        * => $parameters,
      }
    }

    gin::data { 'yum':
      content => {
        'gin::yum'                          => $parameters,
        'gin::yum_gpg_keys'                 => $gpg_keys,
        'gin::yum_groups'                   => $groups,
        'gin::yum_plugins'                  => $plugins,
        'gin::yum_post_transaction_actions' => $post_transaction_actions,
        'gin::yum_version_locks'            => $version_locks,
      },
    }
  }
}
