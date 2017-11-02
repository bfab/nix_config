set -e



print_usage_and_exit() {
    echo -e "\nUsage: `basename $0` \"<user_1>@<host_1> ... <user_n>@<host_n>\" <command_to_run> [args]"
    exit 1
}

parse_params() {
    [ $# -gt 1 ] || print_usage_and_exit

    CMD_TARGETS=$1
    shift
    COMMAND=$@
}

run_command_on_hosts() {

    for TARGET in $CMD_TARGETS ;do
    	echo -e "\n> Running\n> \n>   $COMMAND\n> \n> as $TARGET ; you may be asked for a password...\n" 
        ssh $TARGET "$COMMAND"
    done

    echo -e "\n> All done!"
}

#note: quoting here is important to avoid parameters being split on spaces
parse_params "$@"

run_command_on_hosts
