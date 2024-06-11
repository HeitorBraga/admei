# Creating a new page

```
rails g scaffold [MODEL] [FIELDS...]
```

After that you just need to check the templates files.

In case you don't want this new model as part of tenants add the model at `config/initializers/apartment.rb`

```
config.excluded_models = %w{ ... MODEL }
```