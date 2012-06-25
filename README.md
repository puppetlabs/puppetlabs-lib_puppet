# lib_puppet

This is the lib_puppet module. This is to provide a way to identify lib/puppet path and copy files to that directory.

## Usage

This is used to work around an issue with puppet face. In the face module symlink files/lib to ../lib

    $ tree puppetlabs-demo_face
    .
    ├── Modulefile
    ├── README.md
    ├── files
    │   └── lib -> ../lib
    ├── lib
    │   └── puppet
    │       ├── application
    │       │   └── ...
    │       ├── face
    │       │   └── ...
    │       └── demo_face.rb

In the manifests to push the entire lib directory to lib/puppet:

    lib_puppet { 'demo_face.rb':
      ensure => present,
    }

    lib_puppet { [ 'application', 'face' ]:
      ensure  => present,
      recurse => true,
    }
