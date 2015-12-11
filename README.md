# *dev_env* Cookbook

A simple Cookbook to setup development environment. Here it takes care the usual procedures to setup a local development which are:

1. Install NIX packages.
1. Setup your projects.
  1. Git checkout the project.
  1. Run post bash commands to complete the setup.

## Supported Platforms

Tested in Ubuntu.

## Attributes

### Main Attributes

* ["dev_env"]["user"] (String) = User to that will be assigned to own the `wrap-ssh4git.sh` file. This file is required to ignore the host checks when running `git clone/checkout`. Default value is `nil`.

* ["dev_env"]["packages"] (Array) = Array of Hash that contains list of NIX packages to be installed. `package` in below list will refer to the Hash object in this Array. Default value is `nil`.

* ["dev_env"]["apps"] (Array) = Array of Hash that contains list of project/app to be installed. `app` in below list will refer to the Hash object in this Array. Default value is `nil`.


### Packages Attributes (package)

* package["name"] (String) = Name of NIX package you wish to install. Default value is `nil`.


### Application Attributes (app)

* app["checkout"] (String) = Project checkout path. i.e. if `/home/user/project` is your checkout path, it will run `git clone {app["git_repo"]} /home/user/project`. Default value is `nil`.

* app["git_repo"] (String) = Git repository URL. Default value is `nil`.

* app["revision"] (String) = Git revision or branch to be used for checkout. Default value is `nil`.

* app["git_action"] (String) = Git action. Possible values are either `checkout` or `sync`. Default value is `nil`.

* app["timeout"] (Integer) = Timeout (in seconds) set for `git` execution. Default value is `600`.

* app["retries"] (Integer) = Number of retries if the `git` execution fails. Default value is `5`.

* app["git_ignore_failure"] (Boolean) = Indicates if you want to ignore the error if the `git` execution fails. Default value is `false`.

* app["user"] (String) = User that will be assigned for the project permission. Default value is `nil`.

* app["post_commands"] (String) = Bash command to run from the checkout path after the `git` execution completed. Default value is `nil`.


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
