FROM docker.io/php:7.3-bullseye

RUN \
    apt-get update; \
    apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --no-install-recommends --no-install-suggests dist-upgrade;

RUN \
    apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --no-install-recommends --no-install-suggests install git-core;

RUN \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN \
    git clone --branch v1.3.8 --depth 1 https://github.com/zephir-lang/php-zephir-parser.git /usr/src/php-zephir-parser; \
    cd /usr/src/php-zephir-parser; \
    phpize; \
    ./configure; \
    make; \
    make install; \
    docker-php-ext-enable zephir_parser; \
    cd /; \
    rm -rf /usr/src/php-zephir-parser

RUN \
    curl -sL -o /usr/local/bin/zephir.phar https://github.com/zephir-lang/zephir/releases/download/0.11.12/zephir.phar; \
    chmod +x /usr/local/bin/zephir.phar; \
    ln -s /usr/local/bin/zephir.phar /usr/local/bin/zephir
