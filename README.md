### docker + nginx + mysql8/5 + php8/7/5

**扩展 redis + mongodb + swoole + elasticsearch + node** (更多扩展可编辑 `.env` 文件)

使用
----

1. 安装 `docker` 和 `docker-compose`
2. git clone 代码到本地
    ```
    $ git clone git@github.com:Gekkoou/dnmp.git
    ```
3. 执行命令
    ```
    $ cd dnmp
    $ docker-compose up -d
    ```
4. 默认站点在浏览器中访问 `localhost`

目录结构
----

```
├── services                        服务构建文件和配置文件目录
│   ├── elasticsearch               Elasticsearch目录 (配置文件/数据/日志)
│   │   │── conf
│   │   │   └── elasticsearch.yml
│   │   │── data
│   │   └── log
│   ├── hyperf                      Hyperf目录 (配置文件/日志)
│   │   │── conf
│   │   │   └── php.ini
│   │   │── log
│   │   └── Dockerfile
│   ├── mongo                       Mongo目录 (配置文件/数据/日志)
│   │   │── conf
│   │   │   └── mongod.conf
│   │   │── data
│   │   └── log
│   ├── mysql                       Mysql目录 (配置文件/数据/日志)
│   │   │── conf
│   │   │   └── mysql.cnf
│   │   │── data
│   │   └── log
│   ├── mysql8                      Mysql8目录 (配置文件/数据/日志)
│   │   │── conf
│   │   │   └── mysql.cnf
│   │   │── data
│   │   └── log
│   ├── nginx                       Nginx目录 (配置文件/日志)
│   │   │── conf
│   │   │   │── conf.d
│   │   │   │   └── default.conf
│   │   │   └── nginx.conf
│   │   └── log
│   ├── php56                       PHP56目录 (配置文件/日志)
│   │   │── conf
│   │   │   │── php.ini
│   │   │   └── php-fpm.conf
│   │   └── log
│   ├── php74                       PHP74目录 (配置文件/日志)
│   │   │── conf
│   │   │   │── php.ini
│   │   │   └── php-fpm.conf
│   │   └── log
│   ├── php83                       PHP83目录 (配置文件/日志)
│   │   │── conf
│   │   │   │── php.ini
│   │   │   └── php-fpm.conf
│   │   └── log
│   └── redis                       Redis目录 (配置文件/数据/日志)
│       │── conf
│       │   └── redis.conf
│       │── data
│       └── log
├── www                             站点根目录
├── .env                            环境配置文件
├── docker-compose.yml              docker-compose配置文件
├── Dockerfile                      php各版本Dockerfile文件
└── install.sh                      php扩展配置文件
```
