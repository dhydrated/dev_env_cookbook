# booster-dev-cookbook-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['booster-dev-cookbook']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### booster-dev-cookbook::default

Include `booster-dev-cookbook` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[booster-dev-cookbook::default]"
  ]
}
```

## License and Authors

Author:: Taufek Johar (<taufek@gmail.com>)
