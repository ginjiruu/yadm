# config.nu
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

# ~/.config/nushell/config.nu
let abbreviations = {
  g: 'git'
  gt: 'git tree'
  gs: 'git status'
  gd: 'git d'
  ge: 'git de'
  gm: 'git commit -m'
  ga: 'git add -A'
  tf: 'terraform'
  kc: 'kubectl'
  kcn: 'kubectl get --output json'
}

$env.config = {
  # Keybinds for fish-like abbreviations
  keybindings: [
    {
      name: abbr_menu
      modifier: none
      keycode: enter
      mode: [emacs, vi_normal, vi_insert]
      event: [
          { send: menu name: abbr_menu }
          { send: enter }
      ]
    }
    {
      name: accept_abbr
      modifier: control
      keycode: char_y
      mode: [emacs, vi_normal, vi_insert]
      event: [
        { send: HistoryHintComplete }]
    }
    {
      name: abbr_menu
      modifier: none
      keycode: space
      mode: [emacs, vi_normal, vi_insert]
      event: [
          { send: menu name: abbr_menu }
          { edit: insertchar value: ' '}
      ]
    }
    # End fish
  ]
  cursor_shape: {
    vi_insert: line
    vi_normal: block
    emacs: line
  }
  menus: [
    # Menu for fish like abbreviations
    {
      name: abbr_menu
      only_buffer_difference: false
      marker: none
      type: {
        layout: columnar
        columns: 1
        col_width: 20
        col_padding: 2
      }
      style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
      }
      source: { |buffer, position|
        # Extract the current word before the cursor
        let before_cursor = ($buffer | str substring 0..$position)
        let current_word = ($before_cursor | split row ' ' | last)

        let match = $abbreviations | columns | where $it == $current_word
        if ($match | is-empty) {
          { value: $buffer }
        } else {
          # Replace only the current word, preserve rest of buffer
          let replacement = ($abbreviations | get $match.0)
          let word_len = ($current_word | str length | into int)
          let before_word_end = ($position - $word_len)
          let before_word = if $before_word_end > 0 {
            ($buffer | str substring 0..<$before_word_end)
          } else {
            ''
          }
          let after_cursor = ($buffer | str substring $position..)
          { value: ($before_word ++ $replacement ++ $after_cursor) }
        }
      }
    }
  ]
}

# ${UserConfigDir}/nushell/config.nu
source $"($nu.cache-dir)/carapace.nu"
