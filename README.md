# r/place ripoff

## run server

```bash
bundle install
bundle exec rake db:create db:migrate db:seed
ruby app.rb
```

## set pixel using curl

```bash
curl -X POST http://localhost:4567/pixel -F color=red -F x=0 -F y=0
```

## show current pixel map using curl

```bash
curl http://localhost:4567/pixel
```
