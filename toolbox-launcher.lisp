;;;; toolbox-launcher.lisp

(in-package #:toolbox-launcher)

(defvar *selected-toolbox* "fedora-toolbox-34" "The name of the selected the toolbox container name.")
(defvar *command-text* "emacs" "The command to execute.")

(defun start-ui ()
  "Launches the UI for toolbox-launcher."
  (with-nodgui (:title "toolbox launcher")
    (let* ((toolbox-label (make-instance 'label
                                         :text "Toolbox:"))
           (toolbox-combo (make-instance 'combobox
                                         :values '("fedora-toolbox-34" "sbcl" "blue")))
           (command-label (make-instance 'label
                                         :text "Command:"))
           (command-entry (make-instance 'entry
                                         :text "emacs"))
           (exec-button (make-instance 'button
                                       :text "Execute"
                                       :command (lambda ()
                                                  (setf *selected-toolbox* (text toolbox-combo)
                                                        *command-text* (text command-entry))
                                                  (run-program-and-exit)))))
      (grid toolbox-label 0 0 :padx 5 :pady 5)
      (grid toolbox-combo 0 1 :padx 5 :pady 5)
      (grid command-label 1 0 :padx 5 :pady 5)
      (grid command-entry 1 1 :padx 5 :pady 5)
      (grid exec-button 2 0 :padx 5 :pady 5 :columnspan 2)
      (grid-columnconfigure *tk* :all :weight 1)
      (grid-rowconfigure    *tk* :all :weight 1))))

(defun run-program-and-exit ()
  "Run the program according to the parameters in the UI and exit."
  (uiop:launch-program
   (format nil "toolbox run -c ~a ~a"
           *selected-toolbox*
           *command-text*))
   ;; got this from reading the source, maybe there is a better way
   (setf *exit-mainloop* t))
