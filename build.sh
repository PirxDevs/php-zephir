#!/bin/bash

if [ "${1}" = "all" ]; then
  phpVersions="5.6 7.0 7.1 7.2 7.3 7.4 8.0 8.1 8.2 8.3 8.4 8.5"
else
  phpVersions="8.2 8.3 8.4 8.5"
fi

for phpVersion in ${phpVersions}; do
  pushd php-${phpVersion}-zephir
  docker build -t php-${phpVersion}-zephir .
  docker tag php-${phpVersion}-zephir pirxdevs/php-zephir:${phpVersion}
  docker tag php-${phpVersion}-zephir pirxdevs/php-zephir:$(docker run --rm  php-${phpVersion}-zephir php -r 'echo PHP_VERSION;')
  popd
done
