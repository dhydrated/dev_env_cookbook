default[:dev_env][:user]=nil

# default[:dev_env][:packages]=[
#   {
#     name: "<package_name>
#   }
# ]
default[:dev_env][:packages]=[]

# default[:dev_env][:apps]=[
#   {
#     checkout_path: "<checkout_path>,
#     git_repo: "<git_repo>,
#     revision: "master",
#     git_action: "checkout",
#     user: "user",
#     retries: 5,
#     post_commands_ignore_failure: true,
#     post_commands: "<commands_to_execute>"
#   }
# ]
default[:dev_env][:apps]=[]

