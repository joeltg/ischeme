(define (make-checkbox-state layout #!optional description value)
  `((value . (if (default-object? value) #f value))
    (description . ,(if (default-object? description) "" description))
    (disabled . #f)
    (layout . ,(make-widget-model layout))
    (_dom_classes . #())
    (continuous_update . #t)))

(define (make-checkbox #!optional description value)
  (let ((layout (make-widget "LayoutModel" "LayoutView")))
    (let ((state (make-checkbox-state layout description value)))
      (let ((widget (make-widget "CheckboxModel" "CheckboxView")))
        (display-widget widget)
        widget))))

(define set-progress-value! (widget-updater 'value boolean?))
(define set-progress-description! (widget-updater 'description string?))
(define set-progress-disabled! (widget-updater 'disabled boolean?))