php-static-analysis
===================

HipHop VM + Scheck (pfff) + PHP Mess Detector

Build
=====

	docker build -t phpsa .

Usage
=====

	docker run -v /path/to/your/app:/app -i -t phpsa scheck /app

	docker run -v /path/to/your/app:/app -i -t phpsa hhvm-wrapper analyze /app

	docker run -v /path/to/your/app:/app -i -t phpsa phpmd /app text unusedcode

Help
====

[Scheck](https://github.com/facebook/pfff/wiki/Scheck)

[HHVM-wrapper](https://github.com/sebastianbergmann/hhvm-wrapper/blob/master/README.md)

[PHP Mess Detector](https://github.com/phpmd/phpmd/blob/master/README.rst)

[Docker](http://docs.docker.io/reference/)
