# custom-ruby-cops

How to install custom Cops:

- Create a folder to store them in (In Rails I prefer `lib/rubocop/cop`)
- Save cop in that folder
- Require it in your `.rubocop.yml`:

```
require:
 - ./lib/rubocop/cop/style/env_fetch.rb
 ```
