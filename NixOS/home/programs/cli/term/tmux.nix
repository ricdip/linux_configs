{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tmux # terminal multiplexer
  ];

  home.file.".tmux.conf".text = ''
    ## terminal
    set -g default-terminal "tmux-256color"

    ## prefix
    # change prefix from Ctrl-b to Ctrl-a
    unbind C-b
    set-option -g prefix C-a
    bind-key C-a send-prefix

    ## reload
    bind r source-file ~/.tmux.conf \; display-message "tmux reloaded"

    ## mouse
    set -g mouse on

    ## split panels (vim style)
    # vertical
    bind | split-window -h -c "#{pane_current_path}"

    # horizontal
    bind - split-window -v -c "#{pane_current_path}"

    # use same directory for current pane
    bind c new-window -c "#{pane_current_path}"

    ## pane navigation (hjkl)
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R

    ## pane resize (shift + hjkl)
    bind -r H resize-pane -L 5
    bind -r J resize-pane -D 5
    bind -r K resize-pane -U 5
    bind -r L resize-pane -R 5

    ## window navigation
    bind Tab last-window
    bind -r n next-window
    bind -r p previous-window

    # window navigation with numbers
    bind-key -n M-1 select-window -t 1
    bind-key -n M-2 select-window -t 2
    bind-key -n M-3 select-window -t 3
    bind-key -n M-4 select-window -t 4

    ## other settings
    set -g history-limit 50000
    set -g renumber-windows on
    set -g base-index 1
    setw -g pane-base-index 1
    set -sg escape-time 0
    set -g focus-events on
    set -g status-interval 5
    bind x kill-pane
    bind S setw synchronize-panes
    set -g set-clipboard on

    ## status bar
    set -g status-position bottom
    set -g status-style bg="#000000",fg="#FFFFFF"
    set -g status-left ""
    set -g status-right " S#S:W#I:P#P "
    set -g window-status-format " #W#{window_flags} "
    set -g window-status-current-format " #[bold]#W#{window_flags} "
    set -g pane-border-style fg="#444444"
    set -g pane-active-border-style fg="#88c0d0"

    ## vim mode
    setw -g mode-keys vi

    # vim like selection
    bind-key -T copy-mode-vi v send -X begin-selection
    bind-key -T copy-mode-vi y send -X copy-selection-and-cancel

    # mouse scroll + copy
    bind -T copy-mode-vi MouseDragEnd1Pane send -X copy-selection-and-cancel
  '';
}
