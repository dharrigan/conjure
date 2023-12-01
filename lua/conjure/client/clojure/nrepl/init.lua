-- [nfnl] Compiled from fnl/conjure/client/clojure/nrepl/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _2amodule_name_2a = "conjure.client.clojure.nrepl"
local _2amodule_2a
do
  _G.package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = _G.package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local a, action, auto_repl, client, config, debugger, eval, mapping, nvim, parse, server, str, text, ts, util = autoload("conjure.aniseed.core"), autoload("conjure.client.clojure.nrepl.action"), autoload("conjure.client.clojure.nrepl.auto-repl"), autoload("conjure.client"), autoload("conjure.config"), autoload("conjure.client.clojure.nrepl.debugger"), autoload("conjure.eval"), autoload("conjure.mapping"), autoload("conjure.aniseed.nvim"), autoload("conjure.client.clojure.nrepl.parse"), autoload("conjure.client.clojure.nrepl.server"), autoload("conjure.aniseed.string"), autoload("conjure.text"), autoload("conjure.tree-sitter"), autoload("conjure.util")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["action"] = action
_2amodule_locals_2a["auto-repl"] = auto_repl
_2amodule_locals_2a["client"] = client
_2amodule_locals_2a["config"] = config
_2amodule_locals_2a["debugger"] = debugger
_2amodule_locals_2a["eval"] = eval
_2amodule_locals_2a["mapping"] = mapping
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["parse"] = parse
_2amodule_locals_2a["server"] = server
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["text"] = text
_2amodule_locals_2a["ts"] = ts
_2amodule_locals_2a["util"] = util
do local _ = {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil} end
local buf_suffix = ".cljc"
_2amodule_2a["buf-suffix"] = buf_suffix
do local _ = {nil, nil} end
local comment_prefix = "; "
_2amodule_2a["comment-prefix"] = comment_prefix
do local _ = {nil, nil} end
local cfg = config["get-in-fn"]({"client", "clojure", "nrepl"})
do end (_2amodule_locals_2a)["cfg"] = cfg
do local _ = {nil, nil} end
local reader_macro_pairs = {{"#{", "}"}, {"#(", ")"}, {"#?(", ")"}, {"'(", ")"}, {"'[", "]"}, {"'{", "}"}, {"`(", ")"}, {"`[", "]"}, {"`{", "}"}}
_2amodule_locals_2a["reader-macro-pairs"] = reader_macro_pairs
do local _ = {nil, nil} end
local reader_macros = {"@", "^{", "^:"}
_2amodule_locals_2a["reader-macros"] = reader_macros
do local _ = {nil, nil} end
local function form_node_3f(node)
  return (ts["node-surrounded-by-form-pair-chars?"](node, reader_macro_pairs) or ts["node-prefixed-by-chars?"](node, reader_macros))
end
_2amodule_2a["form-node?"] = form_node_3f
do local _ = {form_node_3f, nil} end
local function symbol_node_3f(node)
  return string.find(node:type(), "kwd")
end
_2amodule_2a["symbol-node?"] = symbol_node_3f
do local _ = {symbol_node_3f, nil} end
local comment_node_3f = ts["lisp-comment-node?"]
_2amodule_2a["comment-node?"] = comment_node_3f
do local _ = {nil, nil} end
config.merge({client = {clojure = {nrepl = {connection = {default_host = "localhost", port_files = {".nrepl-port", ".shadow-cljs/nrepl.port"}, auto_repl = {enabled = true, cmd = "bb nrepl-server localhost:$port", port_file = ".nrepl-port", hidden = false}}, eval = {pretty_print = true, auto_require = true, print_quota = nil, print_function = "conjure.internal/pprint", print_options = {length = 500, level = 50, right_margin = 72}, raw_out = false}, interrupt = {sample_limit = 0.3}, refresh = {after = nil, before = nil, dirs = nil}, test = {current_form_names = {"deftest"}, runner = "clojure", call_suffix = nil, raw_out = false}, completion = {cljs = {use_suitable = true}, with_context = false}, tap = {queue_size = 16}}}}})
if config["get-in"]({"mapping", "enable_defaults"}) then
  config.merge({client = {clojure = {nrepl = {mapping = {disconnect = "cd", connect_port_file = "cf", interrupt = "ei", last_exception = "ve", result_1 = "v1", result_2 = "v2", result_3 = "v3", view_source = "vs", view_tap = "vt", session_clone = "sc", session_fresh = "sf", session_close = "sq", session_close_all = "sQ", session_list = "sl", session_next = "sn", session_prev = "sp", session_select = "ss", run_all_tests = "ta", run_current_ns_tests = "tn", run_alternate_ns_tests = "tN", run_current_test = "tc", refresh_changed = "rr", refresh_all = "ra", refresh_clear = "rc"}}}}})
else
end
local function context(header)
  local _2_ = header
  if (nil ~= _2_) then
    local _3_ = parse["strip-shebang"](_2_)
    if (nil ~= _3_) then
      local _4_ = parse["strip-meta"](_3_)
      if (nil ~= _4_) then
        local _5_ = parse["strip-comments"](_4_)
        if (nil ~= _5_) then
          local _6_ = string.match(_5_, "%(%s*ns%s+([^)]*)")
          if (nil ~= _6_) then
            local _7_ = str.split(_6_, "%s+")
            if (nil ~= _7_) then
              return a.first(_7_)
            else
              return _7_
            end
          else
            return _6_
          end
        else
          return _5_
        end
      else
        return _4_
      end
    else
      return _3_
    end
  else
    return _2_
  end
end
_2amodule_2a["context"] = context
do local _ = {context, nil} end
local function eval_file(opts)
  return action["eval-file"](opts)
end
_2amodule_2a["eval-file"] = eval_file
do local _ = {eval_file, nil} end
local function eval_str(opts)
  return action["eval-str"](opts)
end
_2amodule_2a["eval-str"] = eval_str
do local _ = {eval_str, nil} end
local function doc_str(opts)
  return action["doc-str"](opts)
end
_2amodule_2a["doc-str"] = doc_str
do local _ = {doc_str, nil} end
local function def_str(opts)
  return action["def-str"](opts)
end
_2amodule_2a["def-str"] = def_str
do local _ = {def_str, nil} end
local function completions(opts)
  return action.completions(opts)
end
_2amodule_2a["completions"] = completions
do local _ = {completions, nil} end
local function connect(opts)
  return action["connect-host-port"](opts)
end
_2amodule_2a["connect"] = connect
do local _ = {connect, nil} end
local function on_filetype()
  mapping.buf("CljDisconnect", cfg({"mapping", "disconnect"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.server", "disconnect"), {desc = "Disconnect from the current REPL"})
  mapping.buf("CljConnectPortFile", cfg({"mapping", "connect_port_file"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "connect-port-file"), {desc = "Connect to port specified in .nrepl-port etc"})
  mapping.buf("CljInterrupt", cfg({"mapping", "interrupt"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "interrupt"), {desc = "Interrupt the current evaluation"})
  mapping.buf("CljLastException", cfg({"mapping", "last_exception"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "last-exception"), {desc = "Display the last exception in the log"})
  mapping.buf("CljResult1", cfg({"mapping", "result_1"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "result-1"), {desc = "Display the most recent result"})
  mapping.buf("CljResult2", cfg({"mapping", "result_2"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "result-2"), {desc = "Display the second most recent result"})
  mapping.buf("CljResult3", cfg({"mapping", "result_3"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "result-3"), {desc = "Display the third most recent result"})
  mapping.buf("CljViewSource", cfg({"mapping", "view_source"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "view-source"), {desc = "View the source of the function under the cursor"})
  mapping.buf("CljSessionClone", cfg({"mapping", "session_clone"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "clone-current-session"), {desc = "Clone the current nREPL session"})
  mapping.buf("CljSessionFresh", cfg({"mapping", "session_fresh"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "clone-fresh-session"), {desc = "Create a fresh nREPL session"})
  mapping.buf("CljSessionClose", cfg({"mapping", "session_close"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "close-current-session"), {desc = "Close the current nREPL session"})
  mapping.buf("CljSessionCloseAll", cfg({"mapping", "session_close_all"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "close-all-sessions"), {desc = "Close all nREPL sessions"})
  mapping.buf("CljSessionList", cfg({"mapping", "session_list"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "display-sessions"), {desc = "List the current nREPL sessions"})
  mapping.buf("CljSessionNext", cfg({"mapping", "session_next"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "next-session"), {desc = "Activate the next nREPL session"})
  mapping.buf("CljSessionPrev", cfg({"mapping", "session_prev"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "prev-session"), {desc = "Activate the previous nREPL session"})
  mapping.buf("CljSessionSelect", cfg({"mapping", "session_select"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "select-session-interactive"), {desc = "Prompt to select a nREPL session"})
  mapping.buf("CljRunAllTests", cfg({"mapping", "run_all_tests"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "run-all-tests"), {desc = "Run all loaded tests"})
  mapping.buf("CljRunCurrentNsTests", cfg({"mapping", "run_current_ns_tests"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "run-current-ns-tests"), {desc = "Run loaded tests in the current namespace"})
  mapping.buf("CljRunAlternateNsTests", cfg({"mapping", "run_alternate_ns_tests"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "run-alternate-ns-tests"), {desc = "Run the tests in the *-test variant of your current namespace"})
  mapping.buf("CljRunCurrentTest", cfg({"mapping", "run_current_test"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "run-current-test"), {desc = "Run the test under the cursor"})
  mapping.buf("CljRefreshChanged", cfg({"mapping", "refresh_changed"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "refresh-changed"), {desc = "Refresh changed namespaces"})
  mapping.buf("CljRefreshAll", cfg({"mapping", "refresh_all"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "refresh-all"), {desc = "Refresh all namespaces"})
  mapping.buf("CljRefreshClear", cfg({"mapping", "refresh_clear"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "refresh-clear"), {desc = "Clear the refresh cache"})
  mapping.buf("CljViewTap", cfg({"mapping", "view_tap"}), util["wrap-require-fn-call"]("conjure.client.clojure.nrepl.action", "view-tap"), {desc = "Show all tapped values and clear the queue"})
  local function _14_(_241)
    return action["shadow-select"](a.get(_241, "args"))
  end
  nvim.buf_create_user_command(0, "ConjureShadowSelect", _14_, {force = true, nargs = 1})
  local function _15_(_241)
    return action.piggieback(a.get(_241, "args"))
  end
  nvim.buf_create_user_command(0, "ConjurePiggieback", _15_, {force = true, nargs = 1})
  nvim.buf_create_user_command(0, "ConjureOutSubscribe", action["out-subscribe"], {force = true, nargs = 0})
  nvim.buf_create_user_command(0, "ConjureOutUnsubscribe", action["out-unsubscribe"], {force = true, nargs = 0})
  nvim.buf_create_user_command(0, "ConjureCljDebugInit", debugger.init, {force = true})
  nvim.buf_create_user_command(0, "ConjureCljDebugInput", debugger["debug-input"], {force = true, nargs = 1})
  return action["passive-ns-require"]()
end
_2amodule_2a["on-filetype"] = on_filetype
do local _ = {on_filetype, nil} end
local function on_load()
  return action["connect-port-file"]()
end
_2amodule_2a["on-load"] = on_load
do local _ = {on_load, nil} end
local function on_exit()
  auto_repl["delete-auto-repl-port-file"]()
  return server.disconnect()
end
_2amodule_2a["on-exit"] = on_exit
do local _ = {on_exit, nil} end
return _2amodule_2a
