class box-dev-environment {
   $java = [
      'openjdk-7-jdk'
   ]

   package {$java: ensure => 'installed'}

   # 32bit compatibility for x64 systems
   $ionic_dev_64 = [
      'lib32z1',
      'lib32stdc++6'
   ]

   package {$ionic_dev_64: ensure => 'installed'}

   $ionic_dev = [
      'gem',
      'gcc-multilib',
      'build-essential',
      'npm',
      'ruby-sass',
      'ant',
      'expect',
      'python-software-properties'
   ]

   package {$ionic_dev: ensure => 'installed'}

   # Versioning do not ensure always the lastest version
   package { 'git':
       ensure  => 'present'
   }

   package { 'subversion':
       ensure  => 'present'
   }
}
