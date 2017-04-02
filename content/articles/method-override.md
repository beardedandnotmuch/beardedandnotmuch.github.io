---
title: HTTP Method Override
tags: [angularjs, yii2, http]
created_at: Jul 07, 2016
kind: article
---

### Situation
Almost finished project written on angularjs/yii2 was deployed to the server of
consumer at the first time. After all technical preparation was done we found
a bug: all `PUT` and `DELETE` requests gets 403 error from the server.

### Analysis
The problem was that provider allows only `GET` and `POST` requests. So we should
find the way to fix this and avoid mass changes in the code (due to estimate).
yii\web\UrlManager::rulesConfig
overrided yii\web\UrlRule

detailed look at `parseUrl`
look into `yii\web\Request::getMethod()`

### Solution
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
