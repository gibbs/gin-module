# @summary lvm
#
# @api private
#
class gin::lvm {
  assert_private()

  $config = lookup({
    'name'          => 'gin::lvm',
    'value_type'    => Gin::LVM,
    'default_value' => {},
  })

  class { 'lvm':
    * => $config,
  }

  $volumes = lookup({
    'name'          => 'gin::lvm_volumes',
    'value_type'    => Hash[String, Gin::LVM::Volume],
    'default_value' => {},
  })

  $volumes.each |$volume, $parameters| {
    lvm::volume { $volume:
      * => $parameters,
    }
  }

  $logical_volumes = lookup({
    'name'          => 'gin::lvm_logical_volumes',
    'value_type'    => Hash[String, Gin::LVM::Logical_Volume],
    'default_value' => {},
  })

  $logical_volumes.each |$volume, $parameters| {
    lvm::logical_volume { $volume:
      * => $parameters,
    }
  }

  $volume_groups = lookup({
    'name'          => 'gin::lvm_volume_groups',
    'value_type'    => Hash[String, Gin::LVM::Volume_Group],
    'default_value' => {},
  })

  $volume_groups.each |$group, $parameters| {
    lvm::volume_group { $group:
      * => $parameters,
    }
  }

  $physical_volumes = lookup({
    'name'          => 'gin::lvm_physical_volumes',
    'value_type'    => Hash[String, Gin::LVM::Physical_Volume],
    'default_value' => {},
  })

  $physical_volumes.each |$volume, $parameters| {
    lvm::physical_volume { $volume:
      * => $parameters,
    }
  }

  gin::data { 'lvm':
    content => {
      'gin::lvm'                  => $config,
      'gin::lvm_volumes'          => $volumes,
      'gin::lvm_logical_volumes'  => $logical_volumes,
      'gin::lvm_volume_groups'    => $volume_groups,
      'gin::lvm_physical_volumes' => $physical_volumes,
    },
  }
}
