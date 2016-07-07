---
title: HTTP Method Override
tags: [angularjs, yii2, http]
created_at: Jul 07, 2016
kind: article
---

yii\web\UrlManager::rulesConfig
overrided yii\web\UrlRule

detailed look at `parseUrl`
look into `yii\web\Request::getMethod()`

angular hack

```javascript
angular.config(function ($httpProvider) {
    $httpProvider.interceptors.push(interceptor);
});

function interceptor($q) {
    return {
        request: function (config) {
            if (['GET', 'POST'].indexOf(config.method) === -1) {
                config.headers = config.headers || {};
                config.headers['X-HTTP-Method-Override'] = config.method;
                config.method = 'POST';
            }

            return config;
        },
    };
}
```
