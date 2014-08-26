# カジュアルにリアクティブウェブを実現している話

"月刊ライトニングトーク2014年8月号: MEAN 祭り"の発表で使ったコードです。

[発表スライド](https://speakerdeck.com/nashibao/kaziyuaruniriakuteibuuebuwoshi-xian-siteiruhua)

カスタマイズしやすいように薄いコードのままでmeteor.jsライクにテンプレートまでバインディングします。isormophicにmongooseのapiをクライアントサイドから呼び出すサンプルです。

サーバサイド: [rpc/index.coffee(46 lines)](https://github.com/nashibao/test-casual-reactive-web/blob/master/apps/rpc/index.coffee)

クライアントサイド: [rpc/index.coffee(61 lines)](https://github.com/nashibao/test-casual-reactive-web/blob/master/public/js/rpc/index.coffee)

mongooseのラッパ: [rpc/mongoose.coffee(16 lines)](https://github.com/nashibao/test-casual-reactive-web/blob/master/public/js/rpc/mongoose.coffee)
