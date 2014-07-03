## elixir_dynamo_cms

Sinatra-likeなWAFである[Dynamo](https://github.com/dynamo/dynamo)を使ったCMS  
CMSと言っても`articles/:year/:month/:day/*.md`をレンダする程度  
日本語OK

### Try
```
$ git clone git@github.com:Joe-noh/elixir_dynamo_cms
$ cd elixir_dynamo_cms
$ mix deps.get
$ mix deps.compile
$ mix server
```

### 反省点
* しょぼい
* `lib/elixir_dynamo_cms/dynamo.ex`で`*.md`のパスを読んでいるが、ここでやるべきことでは無い
  * どうやってファイル分割するかわからん
