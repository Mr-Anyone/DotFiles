$path = `pwd`;
$view = $ENV{VIEW};

print "path: $path";
print "view: $view";

if ($view eq "") {
    `tmux split-window -v`
} else {
    # Setting into a clearcase view
    `tmux split-window -v  -c '#{pane_current_path}' 'cleartool setview $view'`
}
