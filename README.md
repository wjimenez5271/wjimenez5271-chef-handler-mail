# DESCRIPTION:

A simple chef report handler that uses the Pony gem to send email reports
generated from an Erubis template. Inspired by the example handler on the
Opcode wiki at http://docs.getchef.com/handlers.html#run-from-client-rb

# USAGE:
### Installing 
You'll need to install the gem in systems that will need to run it. You'll want to make sure chef-client has easy access to it. Check out the [chef_gem](https://docs.chef.io/resource_chef_gem.html) resource for a good example of how to accomplish this.  

### Using /etc/chef/config.rb

    require 'rubygems'
    require 'wjimenez5271/chef/handler/mail'

    mail_handler = MailHandler.new
    report_handlers << mail_handler
    exception_handlers << mail_handler


### Using chef_handler LWRP

    chef_gem 'wjimenez5721/chef-handler-mail'
    require 'wjimenez5271/chef/handler/mail'

    chef_handler 'MailHandler' do
       source 'chef/handler/mail'
       arguments :to_address => "root"
       action :nothing
    end.run_action(:enable)
    
### Using the [chef-client](https://github.com/opscode-cookbooks/chef-client) cookbook
Set the following node [attributes](https://docs.chef.io/attributes.html):
```
"chef_client": {
      "exception_handlers": [
        {
          "class": "MailHandler",
          "arguments": [
            "{:to_address => \"me@mydomain.com\", :from_address => \"me@mydomain.com\", :template_path => \"/opt/email_templ.erb\"}"
          ]
        }
      ]
    },
    "load_gems": {
      "chef-handler-mail": {
        "require_name": "wjimenez5271/chef/handler/mail"
      }
    }
}
```
and then add chef-client::config to your node's role/runlist.

# LICENSE AND AUTHOR:

Author:: Mathieu Sauve-Frankel (<msf@kisoku.net>)

Copyright:: 2011, Mathieu Sauve-Frankel

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
