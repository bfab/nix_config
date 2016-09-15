set -e



print_usage_and_exit() {
    echo -e "\nUsage: `basename $0` \"<user_1>@<host_1> ... <user_n>@<host_n>\" <script_full_path>"
    exit 1
}

parse_params() {
    [ $# = 2 ] || print_usage_and_exit

    CMD_TARGETS=$1
    COMMAND="$2"
}

run_command_on_hosts() {

    for TARGET in $CMD_TARGETS ;do
    	echo "\n> Running\n> \n>   $COMMAND\n> \n> as $TARGET ; you may be asked for a password...\n" 
        ssh $TARGET /bin/bash -s <"$COMMAND"
    done

    echo "\n> All done!"
}
#note: quoting here is important to avoid parameters being split on spaces
parse_params "$@"

run_command_on_hosts
