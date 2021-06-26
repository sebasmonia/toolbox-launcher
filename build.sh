#!/usr/bin/env bash

sbcl --eval "(ql:quickload :toolbox-launcher)" --eval "(asdf:make :toolbox-launcher)"
