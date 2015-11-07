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
    <td><tt>['dev_env']['app']['checkout_path']</tt></td>
    <td>String</td>
    <td>Project GIT repository url</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

## Usage

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
