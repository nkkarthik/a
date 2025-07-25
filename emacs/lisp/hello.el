;; read http url from emacs and display in buffer

(let* ((url "http://localhost:4000/api/hello")
       (buf (url-retrieve-synchronously url t t 10))
       body)
  (unless buf (error "failed %s" url))
  (with-current-buffer buf
    (goto-char (point-min))
    (re-search-forward "^$" nil 'move)
    (setq body (buffer-substring-no-properties (point) (point-max)))
    (kill-buffer))
  (with-current-buffer (get-buffer-create "*hello*")
    (erase-buffer)
    (insert body)
    (display-buffer (current-buffer))))

