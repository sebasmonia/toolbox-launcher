;;;; toolbox-launcher.asd

(asdf:defsystem #:toolbox-launcher
  :description "Small GUI to launch a program from a toolbox container"
  :author "Sebastián Monía <smonia@outlook.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:alexandria
               #:uiop
               #:nodgui)
  :components ((:file "package")
               (:file "toolbox-launcher")))
