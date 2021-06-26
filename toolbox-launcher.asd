;;;; toolbox-launcher.asd

;; See https://lispcookbook.github.io/cl-cookbook/scripting.html#building-a-smaller-binary-with-sbcls-core-compression
#+sb-core-compression
(defmethod asdf:perform ((o asdf:image-op) (c asdf:system))
  (uiop:dump-image (asdf:output-file o c) :executable t :compression t))

(asdf:defsystem #:toolbox-launcher
  :description "Small GUI to launch a program from a toolbox container"
  :author "Sebastián Monía <smonia@outlook.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :build-operation "program-op"
  :build-pathname "toolbox-launcher"
  :entry-point "toolbox-launcher:init"
  :depends-on (#:alexandria
               #:uiop
               #:nodgui)
  :components ((:file "package")
               (:file "toolbox-launcher")))
