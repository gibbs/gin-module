# @summary Components
type Gin::Components = Struct[
  {
    Optional['acls']         => Boolean,
    Optional['aide']         => Boolean,
    Optional['alternatives'] => Boolean,
    Optional['apt']          => Boolean,
    Optional['archives']     => Boolean,
    Optional['at']           => Boolean,
    Optional['auditd']       => Boolean,
    Optional['cron']         => Boolean,
    Optional['docker']       => Boolean,
    Optional['epel']         => Boolean,
    Optional['files']        => Boolean,
    Optional['grub']         => Boolean,
    Optional['hosts']        => Boolean,
    Optional['kmod']         => Boolean,
    Optional['libvirt']      => Boolean,
    Optional['locales']      => Boolean,
    Optional['login_defs']   => Boolean,
    Optional['logrotate']    => Boolean,
    Optional['lvm']          => Boolean,
    Optional['lynis']        => Boolean,
    Optional['motd']         => Boolean,
    Optional['mount']        => Boolean,
    Optional['nftables']     => Boolean,
    Optional['nsswitch']     => Boolean,
    Optional['packages']     => Boolean,
    Optional['pam']          => Boolean,
    Optional['repositories'] => Boolean,
    Optional['rkhunter']     => Boolean,
    Optional['rhsm']         => Boolean,
    Optional['services']     => Boolean,
    Optional['snmp']         => Boolean,
    Optional['ssh']          => Boolean,
    Optional['sudo']         => Boolean,
    Optional['systemd']      => Boolean,
    Optional['sysstat']      => Boolean,
    Optional['sysctl']       => Boolean,
    Optional['timezone']     => Boolean,
    Optional['useradd']      => Boolean,
    Optional['users']        => Boolean,
    Optional['yum']          => Boolean,
  }
]