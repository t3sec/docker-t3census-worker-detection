#!/bin/env bash

cd $HOME
git clone --depth=1 https://github.com/t3sec/t3census-worker-detector.git t3census-worker-detector
cd $HOME/t3census-worker-detector
/usr/bin/composer install
