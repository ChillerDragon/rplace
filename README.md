# r/place ripoff

## run server

First install the depdencies of [rmagick](https://github.com/rmagick/rmagick#prerequisites)

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

Either as json

```bash
curl -H "Accept: application/json" http://localhost:4567/pixel
```

Or as png image

```bash
curl -H "Accept: image/png" http://localhost:4567/pixel -o pixel.png
```