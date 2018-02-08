;;; karel-mode.el --- Fanuc KAREL syntax highlighting

(defconst karel-mode-builtins
  '("abort_task"   "act_screen"   "act_tbl"      "add_bynamepc" "add_dict"     "add_intpc"
    "add_realpc"   "add_stringpc" "append_node"  "append_queue" "att_window_d"
    "att_window_s" "avl_pos_num"  "bytes_ahead"  "call_prog"    "call_proglin"
    "check_dict"   "check_epos"   "check_name"   "clear"        "clear_sema"   "close_tep"
    "clr_io_stat"  "clr_port_sim" "clr_pos_reg"  "cnc_dyn_disb" "cnc_dyn_dise"
    "cnc_dyn_disi" "cnc_dyn_disp" "cnc_dyn_disr" "cnc_dyn_diss" "cncl_stp_mtn"
    "cnv_cnf_strg" "cnv_conf_str" "cnv_int_str"  "cnv_jpos_rel" "cnv_real_str"
    "cnv_rel_jpos" "cnv_str_conf" "cnv_str_int"  "cnv_str_real" "cnv_str_time"
    "cnv_time_str" "compare_file" "cont_task"    "copy_file"    "copy_path"    "copy_queue"
    "copy_tpe"     "create_tpe"   "create_var"   "daq_checkp"   "daq_regpipe"  "daq_start"
    "daq_stop"     "daq_unreg"    "daq_write"    "def_screen"   "def_window"   "delete_file"
    "delete_node"  "delete_queue" "del_inst_tpe" "det_window"   "disctrl_alph"
    "disctrl_form" "disctrl_list" "disctrl_plmn" "disctrl_sbmn" "disctrl_tbl"
    "dismount_dev" "dosfile_inf"  "err_data"     "file_list"    "force_spmenu" "format_dev"
    "get_attr_prg" "get_port_asg" "get_port_cmt" "get_port_mod" "get_port_sim"
    "get_port_val" "get_pos_frm"  "get_pos_typ"  "get_preg_cmt" "get_queue"    "get_reg"
    "get_reg_cmt"  "get_sreg_cmt" "get_str_reg"  "get_time"     "get_tpe_cmt"
    "get_tpe_prm"  "get_tsk_info" "get_usec_sub" "get_var"      "ini_dyn_disb"
    "ini_dyn_dise" "ini_dyn_disi" "ini_dyn_disp" "ini_dyn_disr" "ini_dyn_diss"
    "init_queue"   "init_tbl"     "insert_node"  "insert_queue" "io_mod_type"  "kcl"
    "kcl_no_wait"  "kcl_status"   "load"         "load_status"  "lock_group"   "modify_queue"
    "mount_dev"    "move_file"    "msg_connect"  "msg_diso"     "msg_ping"     "open_tpe"
    "pause_task"   "pend_sema"    "pipe_config"  "pop_key_rd"   "pos_reg_type" "post_err"
    "post_err_l"   "post_sema"    "print_file"   "prog_backup"  "prog_clear"   "prog_restore"
    "prog_list"    "purge_dev"    "push_key_rd"  "read_dict"    "read_dict_v"  "read_kb"
    "remove_dict"  "rename_file"  "rename_var"   "rename_vars"  "reset"        "run_task" "save"
    "save_dram"    "select_tpe"   "send_datapc"  "send_eventpc" "set_attr_prg"
    "set_cursor"   "set_epos_reg" "set_epos_tpe" "set_file_atr" "set_file_pos"
    "set_int_reg"  "set_jpos_reg" "set_jpos_tpe" "set_lang"     "set_perch"
    "set_port_asg" "set_port_atr" "set_port_cmt" "set_port_mod" "set_port_sim"
    "set_port_val" "set_pos_reg"  "set_pos_tpe"  "set_preg_cmt" "set_real_reg"
    "set_reg"      "cmt"          "set_sreg_cmt" "set_str_reg"  "set_time"     "set_tpe_cmt"
    "set_trns_tpe" "set_tsk_attr" "set_tsk_name" "set_var"      "translate"
    "unlock_group" "unpos"        "v_cam_calib"  "v_get_offset" "v_get_passfl" "v_get_queue"
    "v_init_queue" "v_ralc_queue" "v_run_find"   "v_set_ref"    "v_start_vtrk"
    "v_stop_vtrk"  "var_info"     "var_list"     "vol_space"    "vreg_fnd_pos" "vreg_offset"
    "write_dict"   "write_dict_v" "xml_addtag"   "xml_getdata"  "xml_remtag"   "xml_scan"
    "xml_setvar")
  "All built-in functions in the KAREL language.  Used for font locking.")

(defconst karel-mode-keywords
  '("begin" "end" "const" "var" "from" "in" "do" "else" "for" "if" "return" "state" "while")
  "All keywords in the KAREL language.  Used for font locking.")

(defconst karel-mode-constants
  '("cr" "true" "false" "on" "off" "maxint" "minint" "rsworld" "aesworld"
    "wristworld" "joint" "linear" "circular" "fine" "coarse" "nosettle"
    "nodecel" "vardecel")
  "All keywords in the KAREL language.  Used for font locking.")

(defconst karel-mode-directives
  '("%ALPHABETIZE" "%CMOSVARS" "%CMOS2SHADOW" "%COMMENT" "%CRTDEVICE"
    "%DEFGROUP" "%DELAY" "%ENVIRONMENT" "%INCLUDE" "%LOCKGROUP" "%NOABORT"
    "%NOBUSYLAMP" "%NOLOCKGROUP" "%NOPAUSE" "%NOPAUSESHFT" "%PRIORITY"
    "%SHADOWVARS" "%STACKSIZE" "%TIMESLICE" "%TPMOTION" "%UNINITVARS")
  "All translator directives in the KAREL language.  Used for font locking.")

(defconst karel-mode-types
  '("BOOLEAN" "FILE" "INTEGER" "REAL" "STRING" "ARRAY OF BYTE" "ARRAY OF SHORT"
    "CAM_SETUP" "CONFIG" "JOINTPOS1" "JOINTPOS2" "JOINTPOS3" "JOINTPOS4"
    "JOINTPOS5" "JOINTPOS6" "JOINTPOS7" "JOINTPOS8" "JOINTPOS9" "JOINTPOS"
    "MODEL" "PATH" "POSITION" "QUEUE_TYPE" "VECTOR" "VIS_PROCESS" "XYZWPREXT"
    "XYZWPR")
  "All data types in the KAREL language.  Used for font locking.")

(setq karel-font-lock-keywords
      (let* (
             ;; generate regex string for each category of keywords
             (x-builtins-regexp  (regexp-opt karel-mode-builtins 'words))
             (x-keywords-regexp  (regexp-opt karel-mode-keywords 'words))
             (x-constants-regexp (regexp-opt karel-mode-constants 'words))
             (x-types-regexp     (regexp-opt karel-mode-types 'words))
             )

        `(
          (,x-builtins-regexp . font-lock-builtin-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          (,x-types-regexp . font-lock-type-face)
          (,x-constants-regexp . font-lock-constant-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

(defvar karel-mode-syntax-table
  (let ((syntax-table (make-syntax-table)))
    (modify-syntax-entry ?\' "\"" syntax-table)    ;; Strings
    (modify-syntax-entry ?\" "\"" syntax-table)    ;; ^
    (modify-syntax-entry ?_ "_" syntax-table)      ;; Symbols may contain underscore
    (modify-syntax-entry ?- ". 1234" syntax-table) ;; "--" for comments
    (modify-syntax-entry ?\n ">" syntax-table)     ;; Newline is comment ender
    (modify-syntax-entry ?* "." syntax-table)
    (modify-syntax-entry ?\( "." syntax-table)
    (modify-syntax-entry ?\) "." syntax-table)
    (modify-syntax-entry ?\{ "(}" syntax-table)
    (modify-syntax-entry ?\} "){" syntax-table)
    (modify-syntax-entry ?\[ "(]" syntax-table)
    (modify-syntax-entry ?\] ")[" syntax-table)
    syntax-table)
  "Syntax table in use in `karel-mode' buffers.")

;;;###autoload
(define-derived-mode karel-mode fundamental-mode "Fanuc-KAREL"
  :syntax-table karel-mode-syntax-table
  "Major mode for editing KAREL"
  (set (make-local-variable 'comment-start) "-- ")
  (set (make-local-variable 'comment-start-skip) "--+ *")
  (setq font-lock-defaults '((karel-font-lock-keywords) nil t)))

(provide 'karel-mode)

;;; karel-mode.el ends here
