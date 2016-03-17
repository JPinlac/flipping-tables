class box-essentials {
   $essential = [
      'vim',
      'colordiff',
      'tmux',
      'tree',
      'curl',
      'unzip',
      'tar',
      'mc',
      'wget',
      'ssh',
      'patchutils'
   ]
   package {$essential: ensure => 'latest'}

   $remote_fs = [
      'sshfs',
      'curlftpfs',
   ]
   package {$remote_fs: ensure => 'latest'}
}