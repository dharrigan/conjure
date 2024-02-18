-- [nfnl] Compiled from fnl/conjure/log.fnl by https://github.com/Olical/nfnl, do not edit.
local _2amodule_name_2a = "conjure.log"
local _2amodule_2a = _G.package.loaded[_2amodule_name_2a]
local _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
local autoload = (require("aniseed.autoload")).autoload
local a, buffer, client, config, editor, hook, nvim, str, text, timer, view, sponsors = autoload("conjure.aniseed.core"), autoload("conjure.buffer"), autoload("conjure.client"), autoload("conjure.config"), autoload("conjure.editor"), autoload("conjure.hook"), autoload("conjure.aniseed.nvim"), autoload("conjure.aniseed.string"), autoload("conjure.text"), autoload("conjure.timer"), autoload("conjure.aniseed.view"), require("conjure.sponsors")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["buffer"] = buffer
_2amodule_locals_2a["client"] = client
_2amodule_locals_2a["config"] = config
_2amodule_locals_2a["editor"] = editor
_2amodule_locals_2a["hook"] = hook
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["text"] = text
_2amodule_locals_2a["timer"] = timer
_2amodule_locals_2a["view"] = view
_2amodule_locals_2a["sponsors"] = sponsors
local append = (_2amodule_2a).append
local buf = (_2amodule_2a).buf
local clear_close_hud_passive_timer = (_2amodule_2a)["clear-close-hud-passive-timer"]
local close_hud = (_2amodule_2a)["close-hud"]
local close_hud_passive = (_2amodule_2a)["close-hud-passive"]
local close_visible = (_2amodule_2a)["close-visible"]
local cursor_scroll_position__3ecommand = (_2amodule_2a)["cursor-scroll-position->command"]
local dbg = (_2amodule_2a).dbg
local hud_lifetime_ms = (_2amodule_2a)["hud-lifetime-ms"]
local jump_to_latest = (_2amodule_2a)["jump-to-latest"]
local last_line = (_2amodule_2a)["last-line"]
local log_buf_3f = (_2amodule_2a)["log-buf?"]
local reset_hard = (_2amodule_2a)["reset-hard"]
local reset_soft = (_2amodule_2a)["reset-soft"]
local split = (_2amodule_2a).split
local tab = (_2amodule_2a).tab
local toggle = (_2amodule_2a).toggle
local vsplit = (_2amodule_2a).vsplit
local a0 = (_2amodule_locals_2a).a
local _break = (_2amodule_locals_2a)["break"]
local break_lines = (_2amodule_locals_2a)["break-lines"]
local buffer0 = (_2amodule_locals_2a).buffer
local client0 = (_2amodule_locals_2a).client
local close = (_2amodule_locals_2a).close
local config0 = (_2amodule_locals_2a).config
local create_win = (_2amodule_locals_2a)["create-win"]
local current_window_floating_3f = (_2amodule_locals_2a)["current-window-floating?"]
local display_hud = (_2amodule_locals_2a)["display-hud"]
local editor0 = (_2amodule_locals_2a).editor
local find_windows = (_2amodule_locals_2a)["find-windows"]
local flip_anchor = (_2amodule_locals_2a)["flip-anchor"]
local handle_low_priority_spam_21 = (_2amodule_locals_2a)["handle-low-priority-spam!"]
local hook0 = (_2amodule_locals_2a).hook
local hud_window_pos = (_2amodule_locals_2a)["hud-window-pos"]
local in_box_3f = (_2amodule_locals_2a)["in-box?"]
local log_buf_name = (_2amodule_locals_2a)["log-buf-name"]
local low_priority_streak_threshold = (_2amodule_locals_2a)["low-priority-streak-threshold"]
local nvim0 = (_2amodule_locals_2a).nvim
local on_new_log_buf = (_2amodule_locals_2a)["on-new-log-buf"]
local pad_box = (_2amodule_locals_2a)["pad-box"]
local set_win_opts_21 = (_2amodule_locals_2a)["set-win-opts!"]
local sponsors0 = (_2amodule_locals_2a).sponsors
local state = (_2amodule_locals_2a).state
local state_key_header = (_2amodule_locals_2a)["state-key-header"]
local str0 = (_2amodule_locals_2a).str
local text0 = (_2amodule_locals_2a).text
local timer0 = (_2amodule_locals_2a).timer
local trim = (_2amodule_locals_2a).trim
local upsert_buf = (_2amodule_locals_2a)["upsert-buf"]
local view0 = (_2amodule_locals_2a).view
local win_botline = (_2amodule_locals_2a)["win-botline"]
local win_visible_3f = (_2amodule_locals_2a)["win-visible?"]
local with_buf_wins = (_2amodule_locals_2a)["with-buf-wins"]
do local _ = {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil} end
local state0 = ((_2amodule_2a).state or {["last-open-cmd"] = "vsplit", hud = {id = nil, timer = nil, ["created-at-ms"] = 0, ["low-priority-spam"] = {streak = 0, ["help-displayed?"] = false}}, ["jump-to-latest"] = {mark = nil, ns = nvim0.create_namespace("conjure_log_jump_to_latest")}})
do end (_2amodule_locals_2a)["state"] = state0
do local _ = {nil, nil} end
local function _break0()
  return str0.join({client0.get("comment-prefix"), string.rep("-", config0["get-in"]({"log", "break_length"}))})
end
_2amodule_locals_2a["break"] = _break0
do local _ = {_break0, nil} end
local function state_key_header0()
  return str0.join({client0.get("comment-prefix"), "State: ", client0["state-key"]()})
end
_2amodule_locals_2a["state-key-header"] = state_key_header0
do local _ = {state_key_header0, nil} end
local function log_buf_name0()
  return str0.join({"conjure-log-", nvim0.fn.getpid(), client0.get("buf-suffix")})
end
_2amodule_locals_2a["log-buf-name"] = log_buf_name0
do local _ = {log_buf_name0, nil} end
local function log_buf_3f0(name)
  return text0["ends-with"](name, log_buf_name0())
end
_2amodule_2a["log-buf?"] = log_buf_3f0
do local _ = {log_buf_3f0, nil} end
local function on_new_log_buf0(buf0)
  state0["jump-to-latest"].mark = nvim0.buf_set_extmark(buf0, state0["jump-to-latest"].ns, 0, 0, {})
  return nvim0.buf_set_lines(buf0, 0, -1, false, {str0.join({client0.get("comment-prefix"), "Sponsored by @", a0.get(sponsors0, a0.inc(math.floor(a0.rand(a0.dec(a0.count(sponsors0)))))), " \226\157\164"})})
end
_2amodule_locals_2a["on-new-log-buf"] = on_new_log_buf0
do local _ = {on_new_log_buf0, nil} end
local function upsert_buf0()
  return buffer0["upsert-hidden"](log_buf_name0(), client0.wrap(on_new_log_buf0))
end
_2amodule_locals_2a["upsert-buf"] = upsert_buf0
do local _ = {upsert_buf0, nil} end
local function clear_close_hud_passive_timer0()
  return a0["update-in"](state0, {"hud", "timer"}, timer0.destroy)
end
_2amodule_2a["clear-close-hud-passive-timer"] = clear_close_hud_passive_timer0
do local _ = {clear_close_hud_passive_timer0, nil} end
local function _1_()
  if state0.hud.id then
    pcall(nvim0.win_close, state0.hud.id, true)
    state0.hud.id = nil
    return nil
  else
    return nil
  end
end
hook0.define("close-hud", _1_)
local function close_hud0()
  clear_close_hud_passive_timer0()
  return hook0.exec("close-hud")
end
_2amodule_2a["close-hud"] = close_hud0
do local _ = {close_hud0, nil} end
local function hud_lifetime_ms0()
  return (vim.loop.now() - state0.hud["created-at-ms"])
end
_2amodule_2a["hud-lifetime-ms"] = hud_lifetime_ms0
do local _ = {hud_lifetime_ms0, nil} end
local function close_hud_passive0()
  if (state0.hud.id and (hud_lifetime_ms0() > config0["get-in"]({"log", "hud", "minimum_lifetime_ms"}))) then
    local original_timer_id = state0.hud["timer-id"]
    local delay = config0["get-in"]({"log", "hud", "passive_close_delay"})
    if (0 == delay) then
      return close_hud0()
    else
      if not a0["get-in"](state0, {"hud", "timer"}) then
        return a0["assoc-in"](state0, {"hud", "timer"}, timer0.defer(close_hud0, delay))
      else
        return nil
      end
    end
  else
    return nil
  end
end
_2amodule_2a["close-hud-passive"] = close_hud_passive0
do local _ = {close_hud_passive0, nil} end
local function break_lines0(buf0)
  local break_str = _break0()
  local function _8_(_6_)
    local _arg_7_ = _6_
    local n = _arg_7_[1]
    local s = _arg_7_[2]
    return (s == break_str)
  end
  return a0.map(a0.first, a0.filter(_8_, a0["kv-pairs"](nvim0.buf_get_lines(buf0, 0, -1, false))))
end
_2amodule_locals_2a["break-lines"] = break_lines0
do local _ = {break_lines0, nil} end
local function set_win_opts_210(win)
  local function _9_()
    if config0["get-in"]({"log", "wrap"}) then
      return true
    else
      return false
    end
  end
  nvim0.win_set_option(win, "wrap", _9_())
  nvim0.win_set_option(win, "foldmethod", "marker")
  nvim0.win_set_option(win, "foldmarker", (config0["get-in"]({"log", "fold", "marker", "start"}) .. "," .. config0["get-in"]({"log", "fold", "marker", "end"})))
  return nvim0.win_set_option(win, "foldlevel", 0)
end
_2amodule_locals_2a["set-win-opts!"] = set_win_opts_210
do local _ = {set_win_opts_210, nil} end
local function in_box_3f0(box, pos)
  return ((pos.x >= box.x1) and (pos.x <= box.x2) and (pos.y >= box.y1) and (pos.y <= box.y2))
end
_2amodule_locals_2a["in-box?"] = in_box_3f0
do local _ = {in_box_3f0, nil} end
local function flip_anchor0(anchor, n)
  local chars = {anchor:sub(1, 1), anchor:sub(2)}
  local flip = {N = "S", S = "N", E = "W", W = "E"}
  local function _10_(_241)
    return a0.get(flip, _241)
  end
  return str0.join(a0.update(chars, n, _10_))
end
_2amodule_locals_2a["flip-anchor"] = flip_anchor0
do local _ = {flip_anchor0, nil} end
local function pad_box0(box, padding)
  local function _11_(_241)
    return (_241 - padding.x)
  end
  local function _12_(_241)
    return (_241 - padding.y)
  end
  local function _13_(_241)
    return (_241 + padding.x)
  end
  local function _14_(_241)
    return (_241 + padding.y)
  end
  return a0.update(a0.update(a0.update(a0.update(box, "x1", _11_), "y1", _12_), "x2", _13_), "y2", _14_)
end
_2amodule_locals_2a["pad-box"] = pad_box0
do local _ = {pad_box0, nil} end
local function hud_window_pos0(anchor, size, rec_3f)
  local north = 0
  local west = 0
  local south = (editor0.height() - 2)
  local east = editor0.width()
  local padding_percent = config0["get-in"]({"log", "hud", "overlap_padding"})
  local pos
  local _15_
  if ("NE" == anchor) then
    _15_ = {row = north, col = east, box = {y1 = north, x1 = (east - size.width), y2 = (north + size.height), x2 = east}}
  elseif ("SE" == anchor) then
    _15_ = {row = south, col = east, box = {y1 = (south - size.height), x1 = (east - size.width), y2 = south, x2 = east}}
  elseif ("SW" == anchor) then
    _15_ = {row = south, col = west, box = {y1 = (south - size.height), x1 = west, y2 = south, x2 = (west + size.width)}}
  elseif ("NW" == anchor) then
    _15_ = {row = north, col = west, box = {y1 = north, x1 = west, y2 = (north + size.height), x2 = (west + size.width)}}
  else
    nvim0.err_writeln("g:conjure#log#hud#anchor must be one of: NE, SE, SW, NW")
    _15_ = hud_window_pos0("NE", size)
  end
  pos = a0.assoc(_15_, "anchor", anchor)
  if (not rec_3f and in_box_3f0(pad_box0(pos.box, {x = editor0["percent-width"](padding_percent), y = editor0["percent-height"](padding_percent)}), {x = editor0["cursor-left"](), y = editor0["cursor-top"]()})) then
    local function _17_()
      if (size.width > size.height) then
        return 1
      else
        return 2
      end
    end
    return hud_window_pos0(flip_anchor0(anchor, _17_()), size, true)
  else
    return pos
  end
end
_2amodule_locals_2a["hud-window-pos"] = hud_window_pos0
do local _ = {hud_window_pos0, nil} end
local function current_window_floating_3f0()
  return ("number" == type(a0.get(nvim0.win_get_config(0), "zindex")))
end
_2amodule_locals_2a["current-window-floating?"] = current_window_floating_3f0
do local _ = {current_window_floating_3f0, nil} end
local low_priority_streak_threshold0 = 5
_2amodule_locals_2a["low-priority-streak-threshold"] = low_priority_streak_threshold0
do local _ = {nil, nil} end
local function handle_low_priority_spam_210(low_priority_3f)
  if not a0["get-in"](state0, {"hud", "low-priority-spam", "help-displayed?"}) then
    if low_priority_3f then
      a0["update-in"](state0, {"hud", "low-priority-spam", "streak"}, a0.inc)
    else
      a0["assoc-in"](state0, {"hud", "low-priority-spam", "streak"}, 0)
    end
    if (a0["get-in"](state0, {"hud", "low-priority-spam", "streak"}) > low_priority_streak_threshold0) then
      do
        local pref = client0.get("comment-prefix")
        client0.schedule((_2amodule_2a).append, {(pref .. "Is the HUD popping up too much and annoying you in this project?"), (pref .. "Set this option to suppress this kind of output for this session."), (pref .. "  :let g:conjure#log#hud#ignore_low_priority = v:true")}, {["break?"] = true})
      end
      return a0["assoc-in"](state0, {"hud", "low-priority-spam", "help-displayed?"}, true)
    else
      return nil
    end
  else
    return nil
  end
end
_2amodule_locals_2a["handle-low-priority-spam!"] = handle_low_priority_spam_210
do local _ = {handle_low_priority_spam_210, nil} end
local function _22_(opts)
  local buf0 = upsert_buf0()
  local last_break = a0.last(break_lines0(buf0))
  local line_count = nvim0.buf_line_count(buf0)
  local size = {width = editor0["percent-width"](config0["get-in"]({"log", "hud", "width"})), height = editor0["percent-height"](config0["get-in"]({"log", "hud", "height"}))}
  local pos = hud_window_pos0(config0["get-in"]({"log", "hud", "anchor"}), size)
  local border = config0["get-in"]({"log", "hud", "border"})
  local win_opts = a0.merge({relative = "editor", row = pos.row, col = pos.col, anchor = pos.anchor, width = size.width, height = size.height, style = "minimal", zindex = config0["get-in"]({"log", "hud", "zindex"}), border = border, focusable = false})
  if (state0.hud.id and not nvim0.win_is_valid(state0.hud.id)) then
    close_hud0()
  else
  end
  if state0.hud.id then
    nvim0.win_set_buf(state0.hud.id, buf0)
  else
    handle_low_priority_spam_210(a0.get(opts, "low-priority?"))
    state0.hud.id = nvim0.open_win(buf0, false, win_opts)
    set_win_opts_210(state0.hud.id)
  end
  state0.hud["created-at-ms"] = vim.loop.now()
  if last_break then
    nvim0.win_set_cursor(state0.hud.id, {1, 0})
    return nvim0.win_set_cursor(state0.hud.id, {math.min((last_break + a0.inc(math.floor((win_opts.height / 2)))), line_count), 0})
  else
    return nvim0.win_set_cursor(state0.hud.id, {line_count, 0})
  end
end
hook0.define("display-hud", _22_)
local function display_hud0(opts)
  if (config0["get-in"]({"log", "hud", "enabled"}) and not current_window_floating_3f0() and (not config0["get-in"]({"log", "hud", "ignore_low_priority"}) or (config0["get-in"]({"log", "hud", "ignore_low_priority"}) and not a0.get(opts, "low-priority?")))) then
    clear_close_hud_passive_timer0()
    return hook0.exec("display-hud", opts)
  else
    return nil
  end
end
_2amodule_locals_2a["display-hud"] = display_hud0
do local _ = {display_hud0, nil} end
local function win_visible_3f0(win)
  return (nvim0.fn.tabpagenr() == a0.first(nvim0.fn.win_id2tabwin(win)))
end
_2amodule_locals_2a["win-visible?"] = win_visible_3f0
do local _ = {win_visible_3f0, nil} end
local function with_buf_wins0(buf0, f)
  local function _27_(win)
    if (buf0 == nvim0.win_get_buf(win)) then
      return f(win)
    else
      return nil
    end
  end
  return a0["run!"](_27_, nvim0.list_wins())
end
_2amodule_locals_2a["with-buf-wins"] = with_buf_wins0
do local _ = {with_buf_wins0, nil} end
local function win_botline0(win)
  return a0.get(a0.first(nvim0.fn.getwininfo(win)), "botline")
end
_2amodule_locals_2a["win-botline"] = win_botline0
do local _ = {win_botline0, nil} end
local function trim0(buf0)
  local line_count = nvim0.buf_line_count(buf0)
  if (line_count > config0["get-in"]({"log", "trim", "at"})) then
    local target_line_count = (line_count - config0["get-in"]({"log", "trim", "to"}))
    local break_line
    local function _29_(line)
      if (line >= target_line_count) then
        return line
      else
        return nil
      end
    end
    break_line = a0.some(_29_, break_lines0(buf0))
    if break_line then
      nvim0.buf_set_lines(buf0, 0, break_line, false, {})
      local line_count0 = nvim0.buf_line_count(buf0)
      local function _31_(win)
        local _let_32_ = nvim0.win_get_cursor(win)
        local row = _let_32_[1]
        local col = _let_32_[2]
        nvim0.win_set_cursor(win, {1, 0})
        return nvim0.win_set_cursor(win, {row, col})
      end
      return with_buf_wins0(buf0, _31_)
    else
      return nil
    end
  else
    return nil
  end
end
_2amodule_locals_2a["trim"] = trim0
do local _ = {trim0, nil} end
local function last_line0(buf0, extra_offset)
  return a0.first(nvim0.buf_get_lines((buf0 or upsert_buf0()), (-2 + (extra_offset or 0)), -1, false))
end
_2amodule_2a["last-line"] = last_line0
do local _ = {last_line0, nil} end
local cursor_scroll_position__3ecommand0 = {top = "normal zt", center = "normal zz", bottom = "normal zb", none = nil}
_2amodule_2a["cursor-scroll-position->command"] = cursor_scroll_position__3ecommand0
do local _ = {nil, nil} end
local function jump_to_latest0()
  local buf0 = upsert_buf0()
  local last_eval_start = nvim0.buf_get_extmark_by_id(buf0, state0["jump-to-latest"].ns, state0["jump-to-latest"].mark, {})
  local function _35_(win)
    local function _36_()
      return nvim0.win_set_cursor(win, last_eval_start)
    end
    pcall(_36_)
    local cmd = a0.get(cursor_scroll_position__3ecommand0, config0["get-in"]({"log", "jump_to_latest", "cursor_scroll_position"}))
    if cmd then
      local function _37_()
        return nvim0.command(cmd)
      end
      return nvim0.win_call(win, _37_)
    else
      return nil
    end
  end
  return with_buf_wins0(buf0, _35_)
end
_2amodule_2a["jump-to-latest"] = jump_to_latest0
do local _ = {jump_to_latest0, nil} end
local function append0(lines, opts)
  local line_count = a0.count(lines)
  if (line_count > 0) then
    local visible_scrolling_log_3f = false
    local buf0 = upsert_buf0()
    local join_first_3f = a0.get(opts, "join-first?")
    local lines0
    local function _39_(line)
      return string.gsub(tostring(line), "\n", "\226\134\181")
    end
    lines0 = a0.map(_39_, lines)
    local lines1
    if (line_count <= config0["get-in"]({"log", "strip_ansi_escape_sequences_line_limit"})) then
      lines1 = a0.map(text0["strip-ansi-escape-sequences"], lines0)
    else
      lines1 = lines0
    end
    local comment_prefix = client0.get("comment-prefix")
    local fold_marker_end = str0.join({comment_prefix, config0["get-in"]({"log", "fold", "marker", "end"})})
    local lines2
    if (not a0.get(opts, "break?") and not join_first_3f and config0["get-in"]({"log", "fold", "enabled"}) and (a0.count(lines1) >= config0["get-in"]({"log", "fold", "lines"}))) then
      lines2 = a0.concat({str0.join({comment_prefix, config0["get-in"]({"log", "fold", "marker", "start"}), " ", text0["left-sample"](str0.join("\n", lines1), editor0["percent-width"](config0["get-in"]({"preview", "sample_limit"})))})}, lines1, {fold_marker_end})
    else
      lines2 = lines1
    end
    local last_fold_3f = (fold_marker_end == last_line0(buf0))
    local lines3
    if a0.get(opts, "break?") then
      local _42_
      if client0["multiple-states?"]() then
        _42_ = {state_key_header0()}
      else
        _42_ = nil
      end
      lines3 = a0.concat({_break0()}, _42_, lines2)
    elseif join_first_3f then
      local _44_
      if last_fold_3f then
        _44_ = {(last_line0(buf0, -1) .. a0.first(lines2)), fold_marker_end}
      else
        _44_ = {(last_line0(buf0) .. a0.first(lines2))}
      end
      lines3 = a0.concat(_44_, a0.rest(lines2))
    else
      lines3 = lines2
    end
    local old_lines = nvim0.buf_line_count(buf0)
    do
      local ok_3f, err = nil, nil
      local function _47_()
        local _48_
        if buffer0["empty?"](buf0) then
          _48_ = 0
        elseif join_first_3f then
          if last_fold_3f then
            _48_ = -3
          else
            _48_ = -2
          end
        else
          _48_ = -1
        end
        return nvim0.buf_set_lines(buf0, _48_, -1, false, lines3)
      end
      ok_3f, err = pcall(_47_)
      if not ok_3f then
        error(("Conjure failed to append to log: " .. err .. "\n" .. "Offending lines: " .. a0["pr-str"](lines3)))
      else
      end
    end
    do
      local new_lines = nvim0.buf_line_count(buf0)
      local jump_to_latest_3f = config0["get-in"]({"log", "jump_to_latest", "enabled"})
      local _52_
      if join_first_3f then
        _52_ = old_lines
      else
        _52_ = a0.inc(old_lines)
      end
      nvim0.buf_set_extmark(buf0, state0["jump-to-latest"].ns, _52_, 0, {id = state0["jump-to-latest"].mark})
      local function _54_(win)
        visible_scrolling_log_3f = ((win ~= state0.hud.id) and win_visible_3f0(win) and (jump_to_latest_3f or (win_botline0(win) >= old_lines)))
        local _let_55_ = nvim0.win_get_cursor(win)
        local row = _let_55_[1]
        local _ = _let_55_[2]
        if jump_to_latest_3f then
          return jump_to_latest0()
        elseif (row == old_lines) then
          return nvim0.win_set_cursor(win, {new_lines, 0})
        else
          return nil
        end
      end
      with_buf_wins0(buf0, _54_)
    end
    if (not a0.get(opts, "suppress-hud?") and not visible_scrolling_log_3f) then
      display_hud0(opts)
    else
      close_hud0()
    end
    return trim0(buf0)
  else
    return nil
  end
end
_2amodule_2a["append"] = append0
do local _ = {append0, nil} end
local function create_win0(cmd)
  state0["last-open-cmd"] = cmd
  local buf0 = upsert_buf0()
  local function _59_()
    if config0["get-in"]({"log", "botright"}) then
      return "botright "
    else
      return ""
    end
  end
  nvim0.command(("keepalt " .. _59_() .. cmd .. " " .. buffer0.resolve(log_buf_name0())))
  nvim0.win_set_cursor(0, {nvim0.buf_line_count(buf0), 0})
  set_win_opts_210(0)
  return buffer0.unlist(buf0)
end
_2amodule_locals_2a["create-win"] = create_win0
do local _ = {create_win0, nil} end
local function split0()
  return create_win0("split")
end
_2amodule_2a["split"] = split0
do local _ = {split0, nil} end
local function vsplit0()
  return create_win0("vsplit")
end
_2amodule_2a["vsplit"] = vsplit0
do local _ = {vsplit0, nil} end
local function tab0()
  return create_win0("tabnew")
end
_2amodule_2a["tab"] = tab0
do local _ = {tab0, nil} end
local function buf0()
  return create_win0("buf")
end
_2amodule_2a["buf"] = buf0
do local _ = {buf0, nil} end
local function find_windows0()
  local buf1 = upsert_buf0()
  local function _60_(win)
    return ((state0.hud.id ~= win) and (buf1 == nvim0.win_get_buf(win)))
  end
  return a0.filter(_60_, nvim0.tabpage_list_wins(0))
end
_2amodule_locals_2a["find-windows"] = find_windows0
do local _ = {find_windows0, nil} end
local function close0(windows)
  local function _61_(_241)
    return nvim0.win_close(_241, true)
  end
  return a0["run!"](_61_, windows)
end
_2amodule_locals_2a["close"] = close0
do local _ = {close0, nil} end
local function close_visible0()
  close_hud0()
  return close0(find_windows0())
end
_2amodule_2a["close-visible"] = close_visible0
do local _ = {close_visible0, nil} end
local function toggle0()
  local windows = find_windows0()
  if a0["empty?"](windows) then
    if ((state0["last-open-cmd"] == "split") or (state0["last-open-cmd"] == "vsplit")) then
      return create_win0(state0["last-open-cmd"])
    else
      return nil
    end
  else
    return close_visible0(windows)
  end
end
_2amodule_2a["toggle"] = toggle0
do local _ = {toggle0, nil} end
local function dbg0(desc, ...)
  if config0["get-in"]({"debug"}) then
    append0(a0.concat({(client0.get("comment-prefix") .. "debug: " .. desc)}, text0["split-lines"](a0["pr-str"](...))))
  else
  end
  return ...
end
_2amodule_2a["dbg"] = dbg0
do local _ = {dbg0, nil} end
local function reset_soft0()
  return on_new_log_buf0(upsert_buf0())
end
_2amodule_2a["reset-soft"] = reset_soft0
do local _ = {reset_soft0, nil} end
local function reset_hard0()
  return nvim0.ex.bwipeout_(upsert_buf0())
end
_2amodule_2a["reset-hard"] = reset_hard0
do local _ = {reset_hard0, nil} end
return _2amodule_2a
