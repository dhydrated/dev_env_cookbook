# *dev_env* Cookbook

A simple Cookbook to setup development environment. Here it takes care the usual procedures to setup a local development which are:

1. Install NIX packages.
1. Setup your projects.
  1. Git checkout the project.
  1. Run post bash commands to complete the setup.

## Supported Platforms

Tested in Ubuntu.

## Attributes

Main Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:dev_env][:user]</tt></td>
    <td>String</td>
    <td>User to that will be assigned to own the <tt>wrap-ssh4git.sh</tt> file. This file is required to ignore the host checks when running <tt>git clone/checkout</tt>.</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>[:dev_env][:packages]</tt></td>
    <td>Array</td>
    <td>Array of Hash that contains list of NIX packages to be installed. <tt>package</tt> in below list will refer to the Hash object in this Array.</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>[:dev_env][:apps]</tt></td>
    <td>Array</td>
    <td>Array of Hash that contains list of project/app to be installed. <tt>app</tt> in below list will refer to the Hash object in this Array.</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Packages Attributes (package)

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>package[:name]</tt></td>
    <td>String</td>
    <td>Name of NIX package you wish to install.</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Application Attributes (app)

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>app[:checkout]</tt></td>
    <td>String</td>
    <td>Project checkout path. i.e. if <tt>/home/user/project</tt> is your checkout path, it will run <tt>git clone {app[:git_repo]} /home/user/project</tt>.</td>
    <td><tt>nil</tt></td>
  </tr> 
  <tr>
    <td><tt>app[:git_repo]</tt></td>
    <td>String</td>
    <td>Git repository URL.</td>
    <td><tt>nil</tt></td>
  </tr>  
  <tr>
    <td><tt>app[:revision]</tt></td>
    <td>String</td>
    <td>Git revision or branch to be used for checkout.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>app[:git_action]</tt></td>
    <td>String</td>
    <td>Git action. Possible values are either <tt>checkout</tt> or <tt>sync</tt></td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>app[:timeout]</tt></td>
    <td>Integer</td>
    <td>Timeout (in seconds) set for <tt>git</tt> execution.</td>
    <td><tt>600</tt></td>
  </tr>
  <tr>
    <td><tt>app[:retries]</tt></td>
    <td>Integer</td>
    <td>Number of retries if the <tt>git</tt> execution fails.</td>
    <td><tt>5</tt></td>
  </tr>
  <tr>
    <td><tt>app[:git_ignore_failure]</tt></td>
    <td>Boolean</td>
    <td>Indicates if you want to ignore the error if the <tt>git</tt> execution fails.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>app[:user]</tt></td>
    <td>String</td>
    <td>User that will be assigned for the project permission.</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>app[:post_commands]</tt></td>
    <td>String</td>
    <td>Bash command to run from the checkout path after the <tt>git</tt> execution completed.</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

## Usage

### dev\_env::pre_process

`dev_env::pre_process` recipe. This is to install NIX packages.

```json
{
  "run_list": [
    "recipe[dev_env::pre_process]"
  ],
  "json": {
    dev_env: {
      packages: [
         { name: "curl" },
         { name: "apache2" },
      ]
    }
  }
}
```

### dev_env::default

`dev_env::default` recipe. This is to setup projects.

```json
{
  "run_list": [
    "recipe[dev_env::default]"
  ],
  "json": {
    dev_env: {
      apps: [
        {
          checkout_path: "/vagrant/home/projects/sample_app",
          git_repo: "git@github.com:railstutorial/sample_app.git",
          revision: "master",
          git_action: "checkout",
          user: "vagrant",
          post_commands: <<-EOH
            gem install bundler
            rake bundle install
            rake db:seed
          EOH
        },
        {
          ...
        }
      ]
    }
  }
}
```

## License and Authors

Author:: Taufek Johar (<taufek@gmail.com>)
