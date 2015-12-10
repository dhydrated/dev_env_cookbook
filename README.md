# *dev_env* Cookbook

Cookbook to setup development environment.

## Supported Platforms

Tested in Ubuntu.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:dev_env][:apps]</tt></td>
    <td>Array</td>
    <td>Array of Hash.</td>
    <td><tt>nil</tt></td>
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
</table>
Note: `app` is a Hash object within `[:dev_env][:apps]` Array.

## Usage

### dev_env::pre_process

Include `dev_env` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[dev_env::pre_process]"
  ]
}
```

### dev_env::default

Include `dev_env` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[dev_env::default]"
  ]
}
```

## License and Authors

Author:: Taufek Johar (<taufek@gmail.com>)

