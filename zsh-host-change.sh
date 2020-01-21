#!/usr/bin/env zsh

clear
echo "HOST 변경"
echo "1. LOCAL 환경"
echo "2. DEV 환경"
echo "3. QA 환경"
echo "4. STG 환경"

ans="y"
function input_env {

    echo "숫자를 입력하세요:"
    read ans
    excute_host_setting
}

function excute_host_setting {
    case $ans in
    1)
        local_env
        ;;
    2)
        dev_env
        ;;
    3)
        qa_env
        ;;
    4)
        stg_env
        ;;
    *)
        echo "잘못 입력하였습니다. $ans"
        input_env
    esac
}

function local_env {
    echo local_env
    echo -n > "/etc/hosts"
    echo 123.123.123.123 wiki.simuruk.com >> "/etc/hosts"
}

function dev_env {
    echo dev_env
    echo -n > "/etc/hosts"
    echo 123.123.123.123 dev.simuruk.com >> "/etc/hosts"
}

function qa_env {
    echo qa_env
    echo -n > "/etc/hosts"
    echo 123.123.123.123 qa.simuruk.com >> "/etc/hosts"
}

function stg_env {
    echo stg_env
    echo -n > "/etc/hosts"
    echo 123.123.123.123 stg.simuruk.com >> "/etc/hosts"
}
input_env
